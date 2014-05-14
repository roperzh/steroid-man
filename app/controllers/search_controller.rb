class SearchController
  include Lotus::Controller

  action "Index" do
    def call(env)
      results = ManFinder.new.by_name(env[:name])
      self.content_type = "application/json"
      self.body         = results.to_json
    end
  end
end
