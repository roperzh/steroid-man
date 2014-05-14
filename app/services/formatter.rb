class Formatter
  class << self
    def truncate(input, limit = 139)
      return unless input

      delimiter = input.size > limit ? "..." : ""
      "#{input[0..limit]}#{delimiter}"
    end
  end
end
