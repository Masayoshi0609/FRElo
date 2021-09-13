class HomesController < ApplicationController
  def index
  end

  def type
  end

  def welcome

    #ユーザーの入力した身長と体重からBMIを算出する処理。
    weight = current_user.weight.to_f
    height1 = current_user.height.to_f
    height2 = height1 / 100

    #enumで管理している運動頻度を、整数型で取り出し計算するための記述
    @result = current_user.exercise_frequency_before_type_cast



    @BMI = (weight / (height2 ** 2)).round(2)

  end

  def result




  end



end
