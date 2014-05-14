module Search
  class Results
    include Lotus::View
    layout nil

    def packages
      locals[:packages].map { |package| PackagePresenter.new(package) }
    end
  end
end
