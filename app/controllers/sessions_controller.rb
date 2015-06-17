class SessionsController < ApplicationController
	def new
		@user = User.new
	end

	def create
		user_params = params.require(:user).permit(:email, :password)
		@user = User.confirm(user_params)
		if @user
			login(@user)
			redirect_to "/places"
		else
			redirect_to login_path
		end
	end

	def destroy
		logout
		redirect_to login_path
	end

	private

	# def login_params
	# 	user = params.require(:user)
	# 	[user[:email], user[:password]]
	# end

end
