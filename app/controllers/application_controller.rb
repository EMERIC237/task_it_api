class ApplicationController < ActionController::API
  def authenticate_request
    header = request.headers["Authorization"]
    header = header.split(" ").last if header
    begin
      @decoded = JWT.decode(header, Rails.application.credentials.secret_key_base)
      @current_user = User.find(@decoded.first["user_id"])
    rescue JWT::ExpiredSignature => e
      render json: { errors: e.message }, status: :unauthorized
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end
end
