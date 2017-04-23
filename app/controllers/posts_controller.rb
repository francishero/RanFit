class PostsController < ApplicationController
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
		@post=Post.create(post_params)
		redirect_to posts_path
	end

	def edit
		@post=Post.find(params[:id])
	end

	def update
		#update in the database
		@post=Post.find(params[:id])
		@post.update(posts_params)
		redirect_to(posts_path(@post))
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
end
