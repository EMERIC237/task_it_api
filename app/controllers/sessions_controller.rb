class SessionsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :user_not_found

  def create
    user = User.find_by!(username: params[:username])
    if user.authenticate(params[:password])
      exp_time = 24.hours.from_now
      token = jwt_encode({ user_id: user.id }, exp_time)
      render json: { token: token, exp: exp_time.iso8601 }, status: :ok
    else
      render json: { error: "Unauthorized" }, status: :unauthorized
    end
  end

  private

  def jwt_encode(payload, exp = 24.hours.from_now)
    payload[:exp] = exp.to_i
    payload[:user_id] = payload[:user_id]
    payload[:email] = User.find(payload[:user_id]).email
    JWT.encode(payload, Rails.application.credentials.secret_key_base)
  end

  def user_not_found
    render json: { error: "User not found" }, status: :not_found
  end
end
