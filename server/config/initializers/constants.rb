module Constants
  module JWT
    JWT_SECRET_KEYS = {
      'access' => Rails.application.credentials.jwt['access_key'],
      'refresh' => Rails.application.credentials.jwt['refresh_key']
    }
    JWT_EXPIRATION_TIME{
      'access' => 30.minutes,
      'refresh' => 30.days
    }
    JWT_ALGORITHM = 'HS256'
  end
end