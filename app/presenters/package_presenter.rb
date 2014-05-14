class PackagePresenter
  include Lotus::Presenter

  def get(attribute)
    raw_attribute = @object["_source"][attribute.to_s]
    raw_attribute
  end

  def short_description
    truncate get(:description)
  end

  private

  def truncate(input, limit = 139)
    return unless input

    delimiter = input.size > limit ? "..." : ""
    "#{input[0..limit]}#{delimiter}"
  end
end
