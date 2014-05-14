class ManFinder

  attr_accessor :client

  def initialize(params = {})
    @page = params[:page] || 1
    @client = Elasticsearch::Client.new
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
    results = client.search index: "man_pages",
      body: {
        query: {
          query_string: {
            query: slug,
            fields: ["slug"]
          }
        }
      }

    results["hits"]["hits"][0]
  end
end
