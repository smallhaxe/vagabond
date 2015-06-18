class PostsController < ApplicationController
	before_action :logged_in?
	before_action :set_user_post, only: [:edit, :update, :destroy]

	def index
		@posts = current_user.posts
	end

	def new
		@post = Post.new
	end

	def create
		post = current_user.posts.new(post_params)
		if post.save
			redirect_to place_path(post.place_id)
		else
			redirect_to new_post_path
		end
	end

	def show
		@post = Post.find(params[:id])
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		if @post.update_attributes(post_params)
			redirect_to post_path(@post)
		else
			redirect_to edit_post_path(@post)
		end
	end

	def destroy
		@post.destroy()
	end

	private

	def post_params
		white_list = [
				:author, :title, :body, 
				:user_id, :place_id
			     ]
		params.require(:post).permit(*white_list)
	end

	def set_user_post
		@post = current_user.posts.find(params[:id])
	end

end
