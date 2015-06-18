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
			redirect_to welcome_path
		end
	end

	def destroy
		logout
		redirect_to ("/")
	end

	private

	def login_params
		user = params.require(:user)
		[user[:email], user[:password]]
	end

	# Assuming you have the route in routes.rb
	# get "/oauth/callback", to: "sessions#callback"
	CALLBACK_URL = "http://localhost:3000/oauth/callback"

	# also on instagram's API management 
	#   you should configure your oauth
	#   callback to match the one above,
	#   at least while in development.

	Instagram.configure do |config|
		config.client_id = "YOUR_CLIENT_ID"
		config.client_secret = "YOUR_CLIENT_SECRET"
		# For secured endpoints only
		#config.client_ips = '<Comma separated list of IPs>'
	end

	def oauth_connect
		# Use Instagram to redirect 
		#   user to instagram
		#   authentication page
		redirect_to Instagram.authorize_url(:redirect_uri => CALLBACK_URL)
	end


	def oauth_callback
		# Once user authenticates
		#  their access_token
		#  will be made available
		#  in the response to this
		#  method...
		res = Instagram.get_access_token(params[:code], redirect_uri: CALLBACK_URL)
		# The access token 
		# is then put into the
		# session
		session[:access_token] = res.access_token

		# assuming you have a route
		# get "/profile", to: "users#profile", as: "profile"
		redirect_to users_path(current_user)
	end

	def get_access_token(code, options={})
    	options[:grant_type] ||= "authorization_code"
    	options[:redirect_uri] ||= self.redirect_uri
    	params = access_token_params.merge(options)
    	#
    	#   See the POST request and the code
    	#       |                          |----------------|
    	#      \|/                                         \|/
    	post("/oauth/access_token/", params.merge(:code => code), signature=false, raw=false, unformatted=true, no_response_wrapper=true)
    end

    Instagram.configure do |config|
	    config.client_id = ENV["CLIENT_ID"] # <--- NOTE THE CHANGE
	    config.client_secret = ENV["CLIENT_SECRET"] # <---- NOTE THE CHANGE
	    # For secured endpoints only
	    #config.client_ips = '<Comma separated list of IPs>'
 	end
end
