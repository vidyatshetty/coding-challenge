class PostsController < ApplicationController
  def index
    # Return all `Post`
    @posts = Post.all
    if params[:title]
      @post = Post.where('title LIKE ?', "%#{params[:title]}%")
    else
      @post = Post.all
    end
  end

  def new
    # Return view to create a new Post
    @post  = Post.new
  end

  def create
    # Add a new `Post` to the database
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render 'new'
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
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    # Remove a `Post` from the database
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Post deleted"
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end

end
