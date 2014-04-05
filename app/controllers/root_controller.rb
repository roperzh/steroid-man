class RootController
  include Lotus::Controller

  action "Index" do
    def call(env)
      self.content_type = "application/json"
      self.body         = Root::Index.render({ format: :json })
    end
  end
end
