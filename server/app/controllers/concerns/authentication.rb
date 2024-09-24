module Authentication
  extend ActiveSupport::Concern
  private
  def authenticate_user
    header = request.headers['Authorization']
    token = header.split(' ').last if header.present?

    if token
      begin
        decoded = JWT.decode(token, Rails.application.secrets.secret_key_base, true, algorithm: 'HS256')
        @current_user_id = decoded[0]['user_id']
        @current_user = User.find(@current_user_id)
      rescue JWT::DecodeError
        render json: { error: 'Invalid token' }, status: :unauthorized
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'User not found' }, status: :unauthorized
      end
    else
      render json: { error: 'Token missing' }, status: :unauthorized
    end
  end

  def authenticate_admin
    authenticate_user
    if @current_user&.role != 'admin'
      render json: { error: 'Access denied: Admins only' }, status: :forbidden
    end
  end
end
