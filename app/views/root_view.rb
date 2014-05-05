module Root
  class Index
    include Lotus::View
    layout :application

    def packages
      locals[:packages].map { |package| PackagePresenter.new(package) }
    end
  end
end
