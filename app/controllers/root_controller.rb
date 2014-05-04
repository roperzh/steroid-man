class RootController
  include Lotus::Controller

  action "Index" do
    def call(env)
      self.body  = Root::Index.render({ format: :html })
    end
  end
end
