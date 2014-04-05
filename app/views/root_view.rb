module Root
  class Index
    include Lotus::View

    def render
      { hola: "mundo" }.to_json
    end
  end
end
