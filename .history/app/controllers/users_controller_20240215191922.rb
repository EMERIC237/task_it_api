class UsersController < ApplicationController

  def index
    users = User.all
    render json: users
  end

  def show
    user = User.find(params[:id])
    

  end

  def create
  end

  def update
  end

  def destroy
  end

  def user_params
    require('user').permit(:username, :email, :password_digest, :first_name, :last_name)
  end
end
