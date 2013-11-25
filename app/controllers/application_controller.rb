class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_gon_projects

  def set_gon_projects
    gon.projects=session[:projects]   
    @products_recent = session[:recent_products]
  end
end
