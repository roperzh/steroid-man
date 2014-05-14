class ManFinder

  attr_accessor :client

  def initialize(params = {})
    @page = params[:page] || 1
    @client = Elasticsearch::Client.new(host: ENV["ELASTICSEARCH_URL"])
  end

  def random
    results = client.search index: "man_pages",
      body: {
        query: {
          function_score: {
            query: { match_all: {} },
            random_score: {}
          }
        }
      }

    results["hits"]["hits"]
  end

  def by_slug(slug)
    results = query_fields(["slug"], slug)
    results["hits"]["hits"][0]
  end

  def by_name(name)
    results = query_fields(["name"], name)
    results["hits"]["hits"]
  end

  private

  def query_fields(fields, value)
    client.search index: "man_pages",
      body: {
        query: {
          query_string: {
            query: value,
            fields: fields
          }
        }
      }
  end
end
