class UserMailer < ApplicationMailer
  default from: 'yourresume07@gmail.com'

  def welcome_email(user)
    @user = user
    @url = ENV["RESUME_HOST"]
    mail(to: @user.email,
         subject: 'Welcome to Your Resume')
  end

  def user_feedback(user)
    @user = user
    @url = 'localhost:3000'
    mail(to: 'yourresume07@gmail.com',
         subject: @user.survey )
  end
end
