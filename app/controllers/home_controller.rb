class HomeController < ApplicationController
  def index
    @date = params[:month] ? Date.parse(params[:month]) : Date.today
    if user_signed_in?
      flash.keep 
      redirect_to :action => 'dashboard'
    end
  end
  
  def dashboard
    @new_products = Product.sorteddesc.limit(8) 
    @occassions = current_user.occassions.sorteddesc
  end
end
