class HomeController < ApplicationController
  def index
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
