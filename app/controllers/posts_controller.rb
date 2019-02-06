class PostsController < ApplicationController
  before_action :require_login

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save 
      redirect_to sub_url(@post.sub_id)
    else
      flash[:errors] = @post.errors.full_messages
      redirect_to sub_url(@post.sub_id) # if nested we have to redirect to sub_url and change flash.now to flash
    end
  end

  def edit 
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    if @post.user_id == current_user.id && @post.update_attributes(post_params)
      redirect_to sub_url(@post.sub_id)
    else 
      flash[:errors] = @post.errors.full_messages
      redirect_to sub_url(@post.sub_id)
    end 
  end
  
  def show
    @post = Post.find_by(id: params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :sub_id)
  end
end
