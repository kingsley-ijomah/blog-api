source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.0.7'
gem 'mysql2', '>= 0.3.18', '< 0.6.0'
gem 'puma', '~> 3.0'



group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end


gem 'apipie-rails'
gem 'knock'
gem 'bcrypt', '~> 3.1.7'
gem 'jsonapi-resources', '~> 0.9.0'
group :development, :test do
  gem 'rspec-rails', '~> 3.0'
  gem 'launchy', '~> 2.4'
  gem 'selenium-webdriver', '~> 3.0'
  gem 'factory_bot_rails', '~> 4.8'
  gem 'faker', '~> 1.8'
end

group :test do
  gem 'shoulda-matchers', '~> 3.0'
  gem 'database_cleaner', '~> 1.5'
  gem 'jsonapi-resources-matchers', '~> 1.0', require: false
end
