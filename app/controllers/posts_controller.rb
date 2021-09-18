class PostsController < ApplicationController

  def show
    @post = Post.find(params[:id])
    @post_detail = @post
    @user = @post.user
    @comments = @post.comments
    @comment = Comment.new
    @post_tags = @post.tags
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    tag_list = params[:post][:tag_name].split(nil)
    if @post.save
      @post.save_tag(tag_list)
      redirect_to mypage_path
    else
      redirect_to mypage_path
    end
  end


  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to mypage_path
  end

  def search
    @tag_list = Tag.all
    @tag = Tag.find(params[:tag_id])
    @posts = @tag.posts.all.reverse_order
  end


private

  def post_params
    params.require(:post).permit(:body, :image)
  end


end