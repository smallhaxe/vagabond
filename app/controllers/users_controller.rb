class UsersController < ApplicationController

  def new
    @user = User.new
  end
  
  def profile
    redirect_to users_path(current_user)
  end
  
  def create
    user_params = params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_city)
    user = User.new(user_params)
    
    if user.save
      login user

      redirect_to "/users/#{user.id}"
    else
      redirect_to "/welcome"
    end
  end

  def index
  	@users = User.all
  end
  
  def show    
  	 @user = User.find(params[:id])      
  end

  def edit
    @user = User.find(params[:id])
  end 

  def update
    # binding.pry
    @user = User.find(params[:id])
  	if @user.update_attributes(user_params)
  		redirect_to user_path(current_user)
  	else
  		redirect_to edit_user_path(current_user)
  	end
  end

  def destroy
  	@user.destroy()
  end

  private

    def set_user
      @user = current_user
    end

    def user_params
      white_list = [
                      :email, :email_confirmation,
                      :password, :password_confirmation,
                      :first_name, :last_name, :current_city
                   ]
      params.require(:user).permit(*white_list)			
    end

end
