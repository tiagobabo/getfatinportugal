class ContactsController < ApplicationController


def index


end

def sendemail
name = params[:name]
email = params[:email]
subject = params[:subject]
message =  params[:message]
    
    Emailer.welcome_email("sexta.feira.13@gmail.com").deliver
end

end