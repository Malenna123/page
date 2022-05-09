class Admin::PostsController < ApplicationController
  def index
  	@posts = Post.order(:title).page params[:page]
  end

  def new
  	@post = Post.new
  end

  def edit
	@post = Post.find(params[:id])
  end
  
  def show
		@post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
	@post.update(post_params)	
	redirect_to admin_post_path(@post)
  end

  private
  
  def post_params
	params.require(:post).permit(:title,:content,:image)
  end
end

