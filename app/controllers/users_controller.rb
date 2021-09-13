class UsersController < ApplicationController
  def show
  end

  def edit
  end

  def confirm
  end

  def quit
  end


private

  def usr_params
    params.require(:user).permit(:name, :image, :telephone_number, :is_deleted, :height, :weight, :age, :living_area, :body_type, :exercise_frequency, :fat_percentage, :introduction)
  end



end
