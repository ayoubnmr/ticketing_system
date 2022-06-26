source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }
ruby "2.7.5"
gem "rails", "~> 7.0.3"
gem "sprockets-rails"
gem 'rails_12factor', group: :production
gem "puma", "~> 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem 'devise', '~> 4.8', '>= 4.8.1'
gem 'simple_form', '~> 5.1'
gem "paperclip", "~> 6.0.0"
gem "aws-sdk-s3", require: false
gem "azure-storage-blob", "~> 2.0", require: false
gem "google-cloud-storage", "~> 1.11", require: false
gem 'pg', '~> 1.3', '>= 1.3.5'
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false
gem "sidekiq", "~> 6.5"
gem 'redis-namespace'
group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end
group :development do
  gem 'annotate'
  gem "pry-rails"
  gem "web-console"
  gem "rack-mini-profiler"
  gem "spring"
  gem 'letter_opener'
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end

