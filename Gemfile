source "https://rubygems.org"

gem "puma"

# Lotus stack
gem "lotus-router",     github: 'lotus/router'
gem "lotus-controller", github: 'lotus/controller'
gem "lotus-view",       github: 'lotus/view'
gem "lotus-utils",      github: 'lotus/utils'

# Application stack
gem "dotenv",           "~> 0.10.0"
gem "patron",           "~> 0.4.18"
gem "elasticsearch",    "~> 1.0.1"
gem "oj",               "~> 2.7.1"
gem "groff_parser",     "~> 0.3.0"
gem "sass",             "~> 3.3.7"
gem "sprockets",        github: "sstephenson/sprockets"

group :development do
  gem "shotgun",       "~> 0.9"
end

group :test do
  gem "rack-test",     "~> 0.6.2"
  gem "minitest",      "~> 4.7.1"
  gem "minitest-ansi", "~> 0.1.2"
  gem "simplecov",     "~> 0.7.1"
end
