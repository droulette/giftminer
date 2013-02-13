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
    @occasions = current_user.occasions.sorteddesc
    @occasions_upcoming = current_user.occasions.upcoming.sorteddesc
    @occasions_past = current_user.occasions.past.sorteddesc
    @date = params[:month] ? Date.parse(params[:month]) : Date.today
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @occasions }
      format.js  { render :json => @occasions }
    end
  end
  
  def about_us
  end
  
  def contact_us
  end
  
  def support
  end
  
  def thank_you
  end

end
