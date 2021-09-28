class HotTimelinesController < ApplicationController
  def show
    @user = current_user
    @post = Post.new
    @posts = Post.all.reverse_order.page(params[:page]).per(10)
    @tag_list = Tag.includes(:post_tags, :posts).order("posts.created_at DESC").page(params[:page]).per(7)
  end


private

  def user_params
    params.require(:user).permit(:name, :image, :telephone_number, :is_deleted, :height, :weight, :age, :living_area, :body_type, :exercise_frequency, :fat_percentage, :introduction)
  end

  def post_params
    params.require(:post).permit(:body, :image, :user_id)
  end
end
