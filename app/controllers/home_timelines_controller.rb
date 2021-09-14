class HomeTimelinesController < ApplicationController
  def show
  @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:name, :image, :telephone_number, :is_deleted, :height, :weight, :age, :living_area, :body_type, :exercise_frequency, :fat_percentage, :introduction)
  end

end
