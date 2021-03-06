class MainController < ApplicationController
  caches_action :donate,:newsletter,:sponsors
  def index
    @products_all = Product.active.order('created_at DESC')    
    @products_slider = @products_all.sample(3)

    #for the tabbed
    @products_recent = @products_all.limit(3)
    @products_random = @products_all.sample(3)
    @news_recent = New.active.order("created_at desc").limit(2)

    gon.projects=@products_all.map{|x| {"value" => x.name, "slug" => x.slug, "icon" => x.photo, "category_id"=>x.category_id}} 
    session[:projects] = gon.projects

    session[:recent_products] = @products_recent

  end

  def faq
    products_all = Product.active.order('created_at DESC')
    @products_recent_faq = products_all.limit(4)
    @products_random = products_all.sample(4) 
  end

  def donate 
  end

  def newsletter
  end

  def sponsors
  end
  
  def badge
  end

  def portuguese
    country = Country.find(params[:id])
    @clients =  Client.where(country_id: country.id).order("name asc")    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @clients }
    end
  end

  def portuguese_map
    @countries = Country.joins("inner join clients as c on c.country_id=countries.id").group("countries.id").order("name asc")
    gon.countries = @countries
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @countries }
    end    
  end

  def set_country_coordinates
    @country = Country.find(params[:id]) 
    respond_to do |format|
      if @country.update_attributes(params[:country])
        format.html 
        format.json { head :no_content }
      else
        format.html 
        format.json { render json: @country.errors, status: :unprocessable_entity }
      end
    end
  end

  def set_client_coordinates
    @client = Client.find(params[:id]) 
    respond_to do |format|
      if @client.update_attributes(params[:client])
        format.html 
        format.json { head :no_content }
      else
        format.html 
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def subscribe
    gb = Gibbon::API.new
    if gb.lists.subscribe({:id => 1609106378, :email => {:email => params[:email_subscriber]}, :double_optin => true})
    respond_to do |format|
      format.html { render :text => 'Subscription was successfully. Check your email and thanks for your subscription!'}
      format.js   { render :nothing => true }      
    end
  end
  end

end
