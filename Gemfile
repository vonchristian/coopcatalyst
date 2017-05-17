source 'https://rubygems.org'
ruby '2.4.1'
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '5.1.0'
gem 'pg'
gem 'puma', group: [:development, :production]
gem 'sass-rails'
gem 'uglifier'
gem 'coffee-rails'
gem 'jbuilder'
gem 'simple_form', github: 'elsurudo/simple_form', branch: 'rails-5.1.0'
gem 'friendly_id'
gem 'bootstrap-sass'
gem "font-awesome-rails"
gem 'bootstrap-datepicker-rails'
gem "simple-line-icons-rails"
gem "select2-rails"
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'paper_trail'
gem 'pg_search'
gem 'kaminari'
gem 'devise'
gem 'paperclip'
gem 'pundit'
gem 'prawn'
gem 'prawn-table'
gem "gretel"
gem 'public_activity'
# gem 'mina-whenever'
gem 'mina-puma', require: false
gem 'listen', '~> 3.1.5'
gem 'figaro'
group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'rspec-its'
end

group :development do

  gem 'spring'
  gem 'spring-watcher-listen'
end

group :test do
  gem 'shoulda-matchers'
  gem 'faker'
  gem 'database_cleaner'
  gem 'capybara'
  gem 'capybara-webkit'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'rack-mini-profiler'
gem 'memory_profiler'
gem 'bullet'
