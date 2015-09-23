class UserMailer < ApplicationMailer
  default from: 'brockdonovan@gmail.com'
 
  def request_email(user,date,time)
    @url  = 'http://www.brock-donovan-booking.herokuapp.com'
    @date = date
    @time = time
    mail(to: user.email, subject: 'Band request')
  end

end
