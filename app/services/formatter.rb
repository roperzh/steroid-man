class Formatter
  class << self
    def truncate(input, limit = 139)
      return unless input

      delimiter = input.size > limit ? "..." : ""
      "#{input[0..limit]}#{delimiter}"
    end

    def slugfy(input)
      return unless input

      # strip the string
      ret = input[/^(.+?) /].downcase.strip

      #blow away apostrophes
      ret.gsub! /['`]/, ""

      # replace all non alphanumeric, periods with dash
      ret.gsub! /\s*[^A-Za-z0-9\.]\s*/, "-"

      # replace underscore with dash
      ret.gsub! /[-_]{2,}/, "-"

      # convert double dashes to single
      ret.gsub! /-+/, "-"

      # strip off leading/trailing dash
      ret.gsub! /\A[-\.]+|[-\.]+\z/, ""

      ret
    end
  end
end
