module Api
  module V1
    class AuthController < ApplicationController
      # POST /api/v1/auth/signup
      def signup
        user = User.new(signup_params)
        if user.save
          render json: { message: 'User created successfully', user: user.id }, status: :created
        else
          render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
      end

      # POST /api/v1/auth/login
      def login
        user = User.find_by(email: login_params[:email])
        if user&.authenticate(login_params[:password])
          render json: { message: 'Login successful', token: generate_token(user) }, status: :ok
        else
          render json: { error: 'Invalid email or password' }, status: :unauthorized
        end
      end

      private

      def signup_params
        params.require(:user).permit(:email, :name, :tele, :password)
      end

      def login_params
        params.require(:user).permit(:email, :password)
      end

      def generate_token(user)
        # Use a method to generate JWT or any token mechanism you're using
        # Example with JWT:
        JWT.encode({ user_id: user.id, exp: 24.hours.from_now.to_i }, Rails.application.secrets.secret_key_base)
      end
    end
  end
end
