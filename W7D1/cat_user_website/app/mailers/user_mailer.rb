class UserMailer < ApplicationMailer
  default from: "jason.huaiyiwang@gmail.com"

  def welcome_email(user)
    @user = user
    @url = "localhost:3000/login"
    attachments["filename.jpg"] = File.read("/path/to/filename.jpg")
    
    mail(to: user.email, subject: "Welcome to My Awesome Site")
  end

  def reminder_email(user)
  end
end
