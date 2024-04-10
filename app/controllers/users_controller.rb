class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  def index
    users = User.all
    render json: users
  end

  def show
    render json: @user
  end

  def create
    Rails.logger.debug "Received params: #{params.inspect}"  # Add this line

    new_user = User.new(user_params)
    if new_user.save
      render json: new_user
    else
      render json: { error: new_user.errors, message: "could not create a user" }, status: 400
    end
  end

  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: { error: "User could not be updated" }, status: 400
    end
  end

  def destroy
    if @user.destroy
      render json: { message: "User deleted successfully" }
    else
      render json: { error: "User could not be deleted" }, status: 400
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :username, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
