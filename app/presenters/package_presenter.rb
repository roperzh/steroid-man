class PackagePresenter
  include Lotus::Presenter

  def get(attribute)
    raw_attribute = @object["_source"][attribute.to_s]
    raw_attribute
  end

  def short_description
    Formatter.truncate get(:description)
  end
end
