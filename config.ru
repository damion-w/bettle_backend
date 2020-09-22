# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

run Rails.application

# Moved from config/initializers/cors.rb since putting it here works for both Heroku and local
require 'rack/cors'
use Rack::Cors do
  allow do
    origins 'http://localhost:3000/'

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end

  allow do
    origins 'protected-spire-28392.herokuapp.com'

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end