class UsersController < ApplicationController

  def index
    users = User.all
    render json: users
  end

  def show

  end

  def create
  end

  def update
  end

  def destroy
  end

  def user_params
    require('user').permit(
  end
end
