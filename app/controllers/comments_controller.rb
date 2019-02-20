class CommentsController < ApplicationController
	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(comment_params)
		redirect_to post_path(@post)
	end


	def show
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		render 'edit'
	end

	def edit
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
	end
	def destroy
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy
		redirect_to post_path(@post)
	end
	def update
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		if @comment.update(comment_params)
			redirect_to @post
		else
			render 'edit'
		end
	end


	private 
	def comment_params
		params.require(:comment).permit(:body)
	end
end
