module Root
  class Index
    include Lotus::View
    layout :application

    def packages
      locals[:packages].map { |package| PackagePresenter.new(package) }
    end
  end

  class Show
    include Lotus::View
    layout :application

    def package
      PackagePresenter.new(locals[:package])
    end
  end
end
