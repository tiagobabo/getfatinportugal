class ContactsController < ApplicationController

  def index
  end

  def suggest_food
    @categories = Category.all.map{|x| [x.name, x.id]}
    @product = Product.new
    gon.projects=session[:projects]
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  def sendemail	
    if simple_captcha_valid?
        Emailer.contact_us(params[:name], params[:email], params[:subject], params[:message]).deliver
        flash[:notice]= 'Email was successfully sent. Thanks for Your Message!'
        respond_to do |format|
          format.html { render :text => '<p style="color:green">Email was successfully sent. Thanks for Your Message!<br /> We will get in touch shortly.</p>'}
          format.js   { render :nothing => true }
        end
    else
       respond_to do |format|
          format.html { render :text => '<p style="color:red">Wrong value in captcha...Try again.</p>'}
          format.js   { render :nothing => true }
        end
    end
  
  end
  
  def send_advertise	
    Emailer.advertise(params[:name], params[:email], params[:phone], params[:message]).deliver
    flash[:notice]= 'Email was successfully sent. Thanks for Your Message!'
    respond_to do |format|
      format.html { render :text => 'Email was successfully sent. Thanks for Your Message!<br /> We will get in touch shortly.'}
      format.js   { render :nothing => true }
    end
  end

  def send_suggest	
    @product = Product.new(params[:product])

    Emailer.suggest_us(params[:name_user], params[:email_user], params[:phone_user], @product.name).deliver
    respond_to do |format|
      if @product.save       
          format.html { render :text => 'Your suggetion was sent with success.<br /> We will get in touch shortly.'}
          format.js   { render :nothing => true }       
      else       
          format.html { render :text => 'Email was not successfully sent. Try again later!<br /> We will get in touch shortly.'}
          format.js   { render :nothing => true }
        
      end
    end
  end 

  def send_client_interest
    @product = Product.find(params[:product])
    Emailer.new_interest(params[:name], params[:address], params[:locality],params[:person_in_charge],params[:email],params[:phone],  @product.name).deliver
    flash[:notice] = "Email was successfully sent."
    respond_to do |format|
      format.html { render :text => 'Email was successfully sent. Thanks for Your Message!<br /> We will get in touch shortly.'}
      format.js   { render :nothing => true }
    end
  end

  def interest
    @products = Product.active.order('name asc')    
    gon.projects=session[:projects]
  end
end
