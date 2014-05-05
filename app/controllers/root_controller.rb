class RootController
  include Lotus::Controller

  action "Index" do
    def call(env)
      packages   = ManFinder.new.random
      self.body  = Root::Index.render(format: :html, packages: packages)
    end
  end
end
