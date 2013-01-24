class HomeController < ApplicationController
  def index
    if user_signed_in?
      flash.keep 
      redirect_to :action => 'dashboard', :notice => "You have successfully logged in"
    end
  end
  
  def dashboard
    @new_products = Product.sorteddesc.limit(8) 
    if current_user
      @occassions = current_user.occassions 
    end  
  end
end
