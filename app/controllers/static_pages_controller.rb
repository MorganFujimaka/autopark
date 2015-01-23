class StaticPagesController < ApplicationController
  def contact_us
  end

  def send_email
    UserMailer.message_from_user(name, email, text).deliver

    redirect_to root_path, notice: "Message was successfully send"
  end

  private

  def name
    params[:message][:name]
  end

  def email
    params[:message][:email]
  end

  def text
    params[:message][:text]
  end
end
