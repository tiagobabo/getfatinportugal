class Admin::AdminController < ApplicationController
  before_filter :authorized?
  private
  def authorized?
    if !current_user.nil?
      unless current_user.is? :admin
        flash[:error] = "You are not authorized to view that page."
        redirect_to root_path
      end
    end
  end
end
