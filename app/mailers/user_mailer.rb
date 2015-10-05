class UserMailer < ApplicationMailer
  default from: 'brockdonovan@gmail.com'
 
  def request_email(user,date,time)
    @url  = 'http://brock-donovan-booking.herokuapp.com'
    @date = date
    @time = time
    mail(to: user.email, subject: 'Band request')
  end

  def remove_venue(user,date,time)
    @date = date
    @time = time
    mail(to: 'brockdonovan@gmail.com', subject: 'Venue removal request')
  end

end
