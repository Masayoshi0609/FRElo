class HomeTimelinesController < ApplicationController
  def show
    @user = current_user
    @post = Post.new
    @posts = Post.all.reverse_order
    # @like_posts = @user.like_posts　#いいねした投稿を表示させる記述
  end


private

  def user_params
    params.require(:user).permit(:name, :image, :telephone_number, :is_deleted, :height, :weight, :age, :living_area, :body_type, :exercise_frequency, :fat_percentage, :introduction)
  end

  def post_params
    params.require(:post).permit(:body, :image)
  end

end
