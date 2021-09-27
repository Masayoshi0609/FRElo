class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @body_type = @user.body_type

  end

  def edit
    @user = User.find(params[:id])
    if @user = current_user
      render :edit
    else
      redirect_to user_path(@user.id)
    end
  end


  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def confirm
    @user = current_user
    @body_type = current_user.body_type
  end

  def quit
    user = current_user
    user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end


private

  def user_params
    params.require(:user).permit(:name, :image, :telephone_number, :is_deleted, :height, :weight, :age, :living_area, :body_type_id, :exercise_frequency, :fat_percentage, :introduction)
  end


  def body_type_params
    params.require(:body_type).permit(:description, :name, :image)
  end


end
