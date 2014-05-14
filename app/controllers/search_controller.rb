class SearchController
  include Lotus::Controller

  action "Index" do
    def call(env)
      results    = ManFinder.new.by_name(env[:name])
      self.body  = Search::Results.render(format: :html, packages: results)
    end
  end
end
