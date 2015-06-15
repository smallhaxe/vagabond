class UsersController < ApplicationController

  def new
    @user = User.new
    render :new
  end
  
  def profile
    redirect_to user_path(current_user)
  end
  
  def create
    user_params = params.
  end
  
end
