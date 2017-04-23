class PostsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_post,only:[:show,:edit,:update,:destroy]
	def index
		@posts=Post.all
	end

	def show
		#show a single post with its associated comments and likes
		#an instance variable pointing to the specific post
		@post=Post.find(params[:id])
	end
	def new
		@post=Post.new
	end

	def create
		if @post=Post.create(post_params)
			flash[:success]="Your post has been created"
		redirect_to posts_path
		else 
			flash.now[:alert]="Your new post could not be created! Please check again"
			render 'new'
		end
	end

	def edit
		@post=Post.find(params[:id])
	end

	def update
		#update in the database
		@post=Post.find(params[:id])
		if @post.update(posts_params)
			flash[:success]="Post Updated"
		redirect_to posts_path
	else
		flash.now[:alert]="Update failed. Please check the Form"
		render :edit
	end
	end

	def destroy
		#deletes a specific record
		#its being linked to the action on the index view
		@post=Post.find(params[:id])
		@post.destroy
		redirect_to posts_path
	end


	private
	def post_params
		params.require(:post).permit(:image,:caption)
	end
	def set_post
		@post=Post.find(params[:id])
	end
end
