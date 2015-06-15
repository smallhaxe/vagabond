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
			redirect_to post_path(post)
		else
			redirect_to new_post_path
		end
	end

	def show
		@post = Post.find_by({id: params[:id]})
	end

	def edit
	end

	def update
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
		params.require(:post).permit(:author, :title, :body)
	end

	def set_user_post
		@post = current_user.posts.find_by({id: params[:id]})
		unless @post_path
			redirect_to posts_path
		end
	end


end
