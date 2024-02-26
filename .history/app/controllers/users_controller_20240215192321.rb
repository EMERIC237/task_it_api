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
    new_user = User.new(user_params)
    if new_user.save
      render json: new_user
    else
      render json: {error: "User could not be created"}, status: 400
    end
  end

  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: {error: "User could not be updated"}, status: 400
  end

  def destroy
    Use
  end

  private

  def user_params
    require('user').permit(:username, :email, :password_digest, :first_name, :last_name)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
