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
    @post = current_user.posts.new(post_params)
    @user = @post.user
    @tag_list = Tag.includes(:post_tags).order("post_tags.updated_at").page(params[:page]).per(7)
    @posts = Post.where(user_id: [current_user.id, *current_user.following_ids]).reverse_order.page(params[:page]).per(10)
    tag_list = params[:post][:tag_name].split(nil)

    if @post.image.attached? #画像が含まれているか判定する
      #ここからAPIの画像判定処理
      result = Vision.get_image_data(@post.image)
      if result == true
        @post.save
        @post.save_tag(tag_list)
        redirect_to mypage_path
      elsif result == false
        flash[:notice] = "画像が不適切です。投稿できません。"
        render "follow_timelines/show"
      else
        render "follow_timelines/show"
      end
    elsif @post.save
      @post.save_tag(tag_list)
      redirect_to mypage_path
    else
      render "follow_timelines/show"
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
    @posts = @tag.posts.all.reverse_order.page(params[:page]).per(5)
  end


private

  def post_params
    params.require(:post).permit(:body, :image)
  end

end