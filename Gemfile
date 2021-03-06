# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

gem 'bootsnap', '>= 1.4.4', require: false
gem 'devise', '~> 4.8', '>= 4.8.1'
gem 'faraday', '~> 2.3'
gem 'jbuilder', '~> 2.7'
gem 'net-smtp', require: false
gem 'octicons_helper', '~> 17.3'
gem 'octokit', '~> 4.25', '>= 4.25.1'
gem 'puma', '~> 5.0'
gem 'rails', '~> 6.1.6'
gem 'rails-i18n', '~> 7.0', '>= 7.0.3'
gem 'sass-rails', '>= 6'
gem 'turbolinks', '~> 5'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'webpacker', '~> 5.0'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'sqlite3', '~> 1.4'
end

group :development do
  gem 'letter_opener', '~> 1.8', '>= 1.8.1'
  gem 'listen', '~> 3.3'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'rubocop', '~> 1.30', '>= 1.30.1', require: false
  gem 'rubocop-performance', '~> 1.14', '>= 1.14.2', require: false
  gem 'rubocop-rails', '~> 2.14', '>= 2.14.2', require: false
  gem 'spring'
  gem 'web-console', '>= 4.1.0'
end

group :test do
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver', '>= 4.0.0.rc1'
  gem 'webdrivers'
end

group :production do
  gem 'net-imap', '~> 0.2.3'
  gem 'net-pop', '~> 0.1.1'
  gem 'pg', '~> 1.4', '>= 1.4.1'
end
