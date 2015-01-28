class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_filter :verify_authenticity_token

  def facebook
    @user = User.from_omniauth(request.env["omniauth.auth"])

    sign_in @user
    redirect_to root_path
    set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
  end
end