class UsersController < ApplicationController

  def new
    @user = User.new
    render :new
  end
  
  def profile
    red
  end
  
end
