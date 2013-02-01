class HomeController < ApplicationController
  #include CalendarHelper
  def index

    if user_signed_in?
      flash.keep 
      redirect_to :action => 'dashboard'
    end
  end
  
  def dashboard
    @new_products = Product.sorteddesc.limit(6) 
    @occassions = current_user.occassions.sorteddesc
    @date = params[:month] ? Date.parse(params[:month]) : Date.today
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @occassions }
      format.js  { render :json => @occassions }
    end
  end
end
