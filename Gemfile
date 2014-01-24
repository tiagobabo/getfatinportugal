source 'https://rubygems.org'

#ruby '1.9.3' 
gem 'rails', '3.2.13'
gem "galetahub-simple_captcha", :require => "simple_captcha"
gem 'world_flags', :git => 'git://github.com/djonasson/world_flags.git'
gem "twitter", "~> 4.8.1"
gem 'instagram'
gem 'gon'
gem 'koala'
gem 'devise'
gem 'figaro'
gem 'gibbon'
gem "cancan"
gem 'role_model'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'
group :development, :test do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'sqlite3'
  #gem 'pg'
  #gem "unicorn", "~> 4.6.2"
end

group :production do
  # gems specifically for Heroku go here
  gem "pg"
  gem 'rack-google_analytics', :require => "rack/google_analytics"
  #gem "unicorn", "~> 4.6.2"
  gem 'heroku-deflater'
end


group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  # Add Foundation Here
  gem 'compass-rails' # you need this or you get an err
  gem 'zurb-foundation'

end

gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'friendly_id' 
# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
