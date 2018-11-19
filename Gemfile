source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
gem 'pg'
gem 'pg_search'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.6'
# RuboCop
gem 'rubocop', require: false
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
