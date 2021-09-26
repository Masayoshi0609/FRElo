class HomeTimelinesController < ApplicationController

  def show
    @user = current_user
    @post = Post.new
    @posts = Post.includes(:user).where(users:{body_type_id: current_user.body_type_id} ).reverse_order.page(params[:page]).per(3)
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
