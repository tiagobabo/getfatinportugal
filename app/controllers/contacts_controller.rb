class ContactsController < ApplicationController


def index


end

def sendemail
name = params[:name]
email = params[:email]
subject = params[:subject]
message =  params[:message]
    
    Emailer.welcome_email(email).deliver
end

end