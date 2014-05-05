class PackagePresenter
  include Lotus::Presenter

  def get(attribute)
    raw_attribute = @object["_source"][attribute.to_s]
    raw_attribute
  end
end
