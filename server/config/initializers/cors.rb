# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin Ajax requests.

# Read more: https://github.com/cyu/rack-cors

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    # Allow multiple origins from environment variables (e.g., development and production)
    # origins ENV.fetch("CORS_ORIGIN", "localhost:3000")
    origins '*'

    # Allow access to specific API resources
    resource '/users',
      headers: :any,
      methods: [:post]

    resource '/users/:id',
      headers: :any,
      methods: [:get, :put, :delete]

    resource '/users/:user_id/addresses',
      headers: :any,
      methods: [:get, :put]

    resource '/users/:user_id/addresses/:id',
      headers: :any,
      methods: [:get, :put, :delete]

    # Catch-all for other resources
    resource "*",
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]

    # Uncomment if you need to allow cookies/auth tokens with cross-origin requests
    # credentials: true
  end
end