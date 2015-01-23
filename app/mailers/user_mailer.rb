class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def message_from_user(name, email, text)
    @name = name
    @email = email
    @text = text

    mail from: @email, to: "olegkariuk@gmail.com", subject: "AUTO PARK - Message from #{@name}"
  end
end
