class HomesController < ApplicationController
  def index
  end

  def type
  end

  def welcome

    @body_type = current_user.body_type.name
    @BMI = (weight / (height2 ** 2)).round(2)

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
    @body_type = user.body_type.id

    @BMI = (weight / (height2 ** 2)).round(2)

    #ここから、運動頻度、BMI、体脂肪率を元に属性タイプを振り分ける。
    if exercise == 4 && @BMI <= 31 && @BMI >= 20 && fat <= 12
      @body_type = 1
      user.save
      redirect_to welcome_path

    elsif exercise >= 3 && @BMI <= 31 && @BMI >= 18 && fat <= 15
      @body_type = 2
      user.save
      redirect_to welcome_path

    elsif exercise >= 2 && @BMI <= 25 && @BMI >= 20 && fat <= 20
      @body_type = 3
      user.save
      redirect_to welcome_path

    elsif @BMI <= 20 && fat <= 20
      @body_type = 4
      user.save
      redirect_to welcome_path

    elsif @BMI <= 25 && fat <= 24
      @body_type = 5
      user.save
      redirect_to welcome_path

    elsif @BMI <= 34
      @body_type = 6
      user.save
      redirect_to welcome_path

    elsif @BMI >= 35
      @body_type = 7
      user.save
      redirect_to welcome_path
    end
  end



end
