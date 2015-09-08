class UserMailer < ApplicationMailer
  default from: 'brockdonovan@gmail.com'
 
  def request_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Band request')
  end

end
