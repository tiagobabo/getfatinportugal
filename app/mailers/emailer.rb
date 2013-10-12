class Emailer < ActionMailer::Base
  default from: "deliciouslyportugal@gmail.com"
  #Hackaton2013
  def welcome_email(user)
   @user=user;
    mail(to: user, subject: 'Welcome to My Awesome Site', message: 'Eheh isto bomba' )
end
end
