# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController

  protected


  #マイページとなる属性タイムラインに遷移する
  def after_sign_in_path_for(resource)
    mypage_path
  end


  def reject_user

  # ログイン時に入力されたemailのユーザーが存在するか探す
   @user = User.find_by(name: params[:user][:email])
   if @user
     if @user.valid_password?(params[:user][:password]) && (@user.is_deleted == false) # 入力したパスワードが正しく、退会フラグが立っているか確認
       redirect_to new_user_registration
     else

     end
   end
  end

  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
