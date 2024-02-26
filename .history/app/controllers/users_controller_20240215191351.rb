class UsersController < ApplicationController

  def index
    users = User.all
    render json: users, st
  end

  def show
  end

  def create
  end

  def update
  end

  def destroy
  end
end
