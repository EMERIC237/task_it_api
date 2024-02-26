class UsersController < ApplicationController

  def index
    users = User.it { should allow_value("somevalue").for(:someattr) } 
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
