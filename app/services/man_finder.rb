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
end
