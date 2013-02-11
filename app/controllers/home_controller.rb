class HomeController < ApplicationController
  #include CalendarHelper
  def index
    cookies[:gender] ||= params[:gender] unless params[:gender].blank?
    if user_signed_in?
      flash.keep 
      redirect_to :action => 'dashboard'
    end
  end
  
  def dashboard
    @new_products = Product.sorteddesc.limit(6) 
    @occassions = current_user.occassions.sorteddesc
    @occassions_upcoming = current_user.occassions.upcoming.sorteddesc
    @occassions_past = current_user.occassions.past.sorteddesc
    @date = params[:month] ? Date.parse(params[:month]) : Date.today
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @occassions }
      format.js  { render :json => @occassions }
    end
  end
  
  def about_us
  end
  
  def contact_us
  end
  
  def support
  end


end
