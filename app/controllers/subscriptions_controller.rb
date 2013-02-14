class SubscriptionsController < ApplicationController
  # GET /subscriptions
  # GET /subscriptions.json
  authorize_resource
  def index
    render :nothing
    @subscription = current_user.subscription

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @subscriptions }
    end
  end

  # GET /subscriptions/1
  # GET /subscriptions/1.json
  def show
    @subscription = Subscription.find(params[:id])
    @payment_info = Stripe::Customer.retrieve(@subscription.stripe_customer_token)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @subscription }
    end
  end

  # GET /subscriptions/new
  # GET /subscriptions/new.json
  def new
    # If the user already has a subscription, take them to the show page
    redirect_to subscription_path(current_user.subscription) and return if current_user.subscription
    
    @subscription = Subscription.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @subscription }
    end
  end

  # GET /subscriptions/1/edit
  def edit
    @subscription = Subscription.find(params[:id])
  end

  # POST /subscriptions
  # POST /subscriptions.json
  def create
    params[:subscription].delete(:stripe_customer_token)
    @subscription = current_user.build_subscription(params[:subscription])
    
    if @subscription.save_with_payment
      redirect_to subscription_path(@subscription)
    else
      render :new
    end
  end

  # PUT /subscriptions/1
  # PUT /subscriptions/1.json
  def update
    @subscription = Subscription.find(params[:id])

    respond_to do |format|
      if @subscription.update_attributes(params[:subscription])
        format.html { redirect_to @subscription, notice: 'Subscription was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @subscription.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subscriptions/1
  # DELETE /subscriptions/1.json
  def destroy
    @subscription = Subscription.find(params[:id])
    @subscription.destroy

    respond_to do |format|
      format.html { redirect_to subscriptions_url }
      format.json { head :no_content }
    end
  end
end
