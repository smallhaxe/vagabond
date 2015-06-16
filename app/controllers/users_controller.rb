class UsersController < ApplicationController

  def new
    @user = User.new
  end
  
  def profile
    redirect_to users_path(current_user)
  end
  
  def create
    user_params = params.require(:user).permit(:first_name, :last_name, :email, :password)
    @user = User.create(user_params)
    login(@user)
    redirect_to users_path(@user.id)
  end

  def index
  	@users = User.all
  end
  
  def show
  	@user = User.find_by({id: params[:id]})
  	@posts = @user.posts
  end

  def edit
  end

  def update
  	@user = @user.update_attributes(user_params)
  	if @user
  		redirect_to profile_path
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
  				:first_name, :last_name
  				]
  	params.require(:user).permit(*white_list)			
  end

end
