class PostsController < ApplicationController

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to mypage_path
  end


  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to mypage_path
  end


private

  def post_params
    params.require(:post).permit(:body, :image)
  end


end