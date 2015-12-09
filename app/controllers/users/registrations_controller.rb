class Users::RegistrationsController < Devise::RegistrationsController
before_filter :configure_sign_up_params

  def update
    super
  end

  protected

  # You can put the params you want to permit in the empty array.
     def configure_sign_up_params
      #devise_parameter_sanitizer.for(:sign_up) << :email, :password, :password_confirmation
       devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :picture, :bio, :username ) }

       devise_parameter_sanitizer.for(:account_update) << :bio
       devise_parameter_sanitizer.for(:account_update) << :role
       devise_parameter_sanitizer.for(:account_update) << :type
       devise_parameter_sanitizer.for(:account_update) << :picture
       devise_parameter_sanitizer.for(:account_update) << :username
     end

  # You can put the params you want to permit in the empty array.
  def configure_account_update_params
    devise_parameter_sanitizer.for(:account_update) << :bio
  end
end


