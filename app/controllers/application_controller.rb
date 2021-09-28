class ApplicationController < ActionController::Base
before_action :authenticate_user!, except: [:index, :privacy, :kiyaku]
before_action :configure_permitted_parameters, if: :devise_controller?

protected

def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :telephone_number, :height, :weight, :age, :living_area, :exercise_frequency, :fat_percentage, :body_type_id, :introduction, :image_id])
  devise_parameter_sanitizer.permit(:sign_in, keys: [:name, :telephone_number, :height, :weight, :age, :living_area, :exercise_frequency, :fat_percentage, :body_type_id, :introduction, :image_id])
  devise_parameter_sanitizer.permit(:account_update, keys: [:name, :telephone_number, :height, :weight, :age, :living_area, :exercise_frequency, :fat_percentage, :body_type_id, :introduction, :image_id])
end


end
