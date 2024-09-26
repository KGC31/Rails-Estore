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
        return
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'User not found' }, status: :unauthorized
        return
      end
    else
      render json: { error: 'Token missing' }, status: :unauthorized
      return
    end
  end

  def authenticate_admin
    authenticate_user
    if @currnet_user && @current_user&.role != 'admin'
      render json: { error: 'Access denied: Admins only' }, status: :forbidden
      return
    end
  end
end
