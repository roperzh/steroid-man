class ManPagesController
  include Lotus::Controller

  action "Index" do
    def call(env)
      packages   = ManFinder.new.random
      self.body  = Root::Index.render(format: :html, packages: packages)
    end
  end

  action "Show" do
    def call(env)
      package   = ManFinder.new.by_slug(env[:id])
      self.body = Root::Show.render(format: :html, package: package)
    end
  end
end
