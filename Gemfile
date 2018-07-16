source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '5.2.0'

# Better css sytanx
gem 'sass',  '~> 3.2.0'
#gem 'sass',  '~> 3.3.0'

# Use SCSS for stylesheets
#gem 'sass-rails', '~> 4.0.0'
gem 'sass-rails', '~> 5.0.6'

# Use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.1.2'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# For haml syntax
gem 'haml'

# For creating haml files when performing scaffold
gem 'haml-rails'

# Forms made easy
gem 'simple_form'

# Use jquery as the JavaScript library
gem 'jquery-rails'


# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.6.0'

# For file upload
gem 'carrierwave'

# For remote file upload
gem 'fog'

# For image manipulation (crop, resize)
gem "mini_magick"

# For authorization
gem 'cancan'

# For login user
gem 'devise'

gem 'bootstrap-sass'


#token para un modelo, en rails 5 no es necesaria la gema
gem 'has_secure_token'


gem 'rails-deprecated_sanitizer'

gem 'webpacker'
gem 'react-rails'
gem 'xmlrpc'

gem 'puma'

gem 'em-hiredis'
gem 'redis', '~> 3.0'

gem 'coffee-script', '~> 2.4', '>= 2.4.1'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development do
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'

  # Remote multi-server automation tool http://www.capistranorb.com
  gem 'capistrano', '~> 2.15.5'

  # Multiple stages deploy for capistrano
  gem 'capistrano-ext'

  # Pure Ruby implementation of an SSH (protocol 2) client 
  # http://net-ssh.github.com/net-ssh
  gem 'net-ssh'
    # For making rails console work
  gem 'rb-readline'
  # Console in error page
  gem 'binding_of_caller'

  # Better looking error page
  gem 'better_errors'

  gem 'web-console', '~> 2.0'
end


group :production, :staging do
  # For PostreSQL
  gem 'pg', '~> 0.18'

  # Use unicorn as the app server
  gem 'unicorn'

  #for console in server
  gem 'rb-readline'
end

group :development, :staging do

end
