source 'http://rubygems.org'


gem 'rails', '4.2.6'
gem 'haml'
gem "haml-rails", "~> 0.9"
gem 'sass-rails', '~> 5.0'

gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'cocoon'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'devise'

#____<<ASSETS>>______________
gem 'normalize-rails'
gem 'materialize-sass'
#____________________________

gem 'bcrypt', '~> 3.1.7'
#for hungry cookies
gem 'activerecord-session_store'
gem 'ransack'
gem 'public_activity'

gem 'will_paginate'
gem 'prawn'
gem 'prawn-table'
gem 'wicked_pdf'
gem 'wkhtmltopdf-binary'

gem 'select2-rails'

gem 'faker'

group :development, :test do
  gem 'annotate', '2.7.0'
  gem 'sqlite3'
  gem 'byebug'
  gem 'better_errors'
  gem 'web-console', '~> 2.0'
  gem 'spring'
  #AwesomePrint.irb!
  gem 'awesome_print'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

group :development do
    gem 'capistrano',         require: false
    gem 'capistrano-rvm',     require: false
    gem 'capistrano-rails',   require: false
    gem 'capistrano-bundler', require: false
    gem 'capistrano3-puma',   require: false
end

gem 'puma'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
