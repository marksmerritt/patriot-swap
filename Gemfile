source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.0'

gem 'rails', '~> 6.0.0.rc1'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5'
gem 'webpacker', '~> 4.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '~> 3.8', '>= 3.8.2'
  gem 'factory_bot_rails', '~> 5.0', '>= 5.0.2'
end

group :test do 
  gem 'capybara', '~> 3.20'
  gem 'database_cleaner', '~> 1.7'
  gem 'shoulda-matchers', '~> 4.0', '>= 4.0.1'
  gem 'simplecov', '~> 0.16.1', require: false
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'devise', '~> 4.6', '>= 4.6.2'
gem 'omniauth', '~> 1.6', '>= 1.6.1'
gem 'figaro', '~> 1.1', '>= 1.1.1'
gem 'money-rails', '~>1.12'
gem 'gutentag', '~> 2.5'
gem 'faker', '~> 1.9', '>= 1.9.3'