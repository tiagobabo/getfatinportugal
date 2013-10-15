class Emailer < ActionMailer::Base
  default from: "deliciouslyportugal@gmail.com"
  
  def welcome_email(user)
    mail(to: user, subject: 'Welcome to My Awesome Site', message: 'Eheh isto bomba' )
end
end
