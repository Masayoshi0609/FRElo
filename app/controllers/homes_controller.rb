class HomesController < ApplicationController
  def index
  end

  def type
   @body_types = BodyType.all
   @user = current_user
  end

  def welcome
   @user = current_user
   @body_type = current_user.body_type

  end



  def judge
    #このアクションは、ユーザー情報を元にタイプ属性を決める処理である。

    user = current_user

    #ユーザーの入力した身長と体重からBMIを算出する処理。
    weight = current_user.weight.to_f
    height1 = current_user.height.to_f
    height2 = height1 / 100

    #enumで管理している運動頻度を、整数型で取り出し計算するための記述
    exercise = user.exercise_frequency_before_type_cast
    fat = user.fat_percentage.to_i

    @BMI = (weight / (height2 ** 2)).round(2)

    #ここから、運動頻度、BMI、体脂肪率を元に属性タイプを振り分ける。

    if exercise == 4 && @BMI <= 31 && @BMI >= 20 && fat <= 12
      user.update( body_type_id: "1" )
      redirect_to welcome_path

    elsif exercise >= 3 && @BMI <= 31 && @BMI >= 18 && fat <= 15
      user.update( body_type_id: "2" )
      redirect_to welcome_path

    elsif exercise >= 2 && @BMI <= 25 && @BMI >= 20 && fat <= 20
      user.update( body_type_id: "3" )
      redirect_to welcome_path

    elsif @BMI <= 20 && fat <= 20
      user.update( body_type_id: "4" )
      redirect_to welcome_path

    elsif @BMI <= 34
      user.update( body_type_id: "6" )
      redirect_to welcome_path

    elsif @BMI >= 35
      user.update( body_type_id: "7" )
      redirect_to welcome_path

    else
      user.update( body_type_id: "5" )
      redirect_to welcome_path
    end
  end

  def privacy
  end

  def kiyaku
  end

private

  def user_params
    params.require(:user).permit(:name, :image, :telephone_number, :is_deleted, :height, :weight, :age, :living_area, :body_type, :exercise_frequency, :fat_percentage, :introduction)
  end

  def body_type_params
    params.require(:body_type).permit(:description, :name, :image)
  end



end
