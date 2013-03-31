class OrdersController < InheritedResources::Base

  def index
    @orders = current_user.orders.sorteddesc.all.paginate(page: params[:page], :per_page => 10)
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @orders }
    end
  end

  def show
    @order = Order.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order }
    end
  end

  def new
    @order = current_user.orders.build({:product_id=>params[:product_id],:occasion_id=>params[:occasion_id]})
    
    if current_user.subscription
      @payment_info = Stripe::Customer.retrieve(current_user.subscription.stripe_customer_token)
    end
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order }
    end
  end

  def edit
    @order = Order.find(params[:id])
    @subscription = Subscription.new
  end

  def create

    if params[:order][:name].blank? and
      params[:order][:address_line_1].blank? and
      params[:order][:address_line_2].blank? and
      params[:order][:city].blank? and
      params[:order][:state].blank? and
      params[:order][:zip_code].blank? 
      if params[:order][:address_id]
        address = Address.find(params[:order][:address_id])
        params[:order][:name] = address.recipient.full_name
        params[:order][:address_line_1] = address.address_line_1
        params[:order][:address_line_2] = address.address_line_2
        params[:order][:city] = address.city
        params[:order][:state] = address.state
        params[:order][:zip_code] = address.zip_code
      end
    end
                
    if current_user.subscription
      @payment_info = Stripe::Customer.retrieve(current_user.subscription.stripe_customer_token)
    end
    
    @order = current_user.orders.build(params[:order])

    respond_to do |format|
      if @order.save
        # Create the charge on Stripe's servers - this will charge the user's card
        begin
          data = {
            :amount => @order.total, # amount in cents, again
            :currency => "usd",
            :description => @order.user.email
          }
          
          if current_user.subscription
            data.merge!({:customer => current_user.subscription.stripe_customer_token})
          elsif @order.stripe_card_token
            data.merge!({:card => @order.stripe_card_token})
          end
          
          charge = Stripe::Charge.create(data)
          
          @order.subscription_id = current_user.subscription.id if current_user.subscription
          @order.stripe_charge_id = charge.id
          @order.save
        rescue Stripe::CardError => e
          # The card has been declined
          logger.error "Stripe error while charging card: #{e.message}"
          current_user.subscription.destroy if current_user.subscription
          redirect_to(edit_order_path(@order), :warning => 'We could not charge your credit card, please enter your payment information again.') and return 
        end

        format.html {
          redirect_to(order_path(@order), :notice => 'Thank you for your business')
        }
        format.json { render json: @order, status: :created, location: @order }
      else
        format.html { render action: "new" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        # Create the charge on Stripe's servers - this will charge the user's card
        begin
          data = {
            :amount => @order.total, # amount in cents, again
            :currency => "usd",
            :description => @order.user.email
          }
          
          if current_user.subscription
            data.merge!({:customer => current_user.subscription.stripe_customer_token})
          elsif @order.stripe_card_token
            data.merge!({:card => @order.stripe_card_token})
          end

          charge = Stripe::Charge.create(data)
          
          @order.subscription_id = current_user.subscription.id if current_user.subscription
          @order.stripe_charge_id = charge.id
          @order.save
        rescue Stripe::CardError => e
          # The card has been declined
          
          current_user.subscription.destroy if current_user.subscription
          redirect_to(edit_order_path(@order), :warning => 'We could not charge your credit card, please enter your payment information again.') and return 
        end

        format.html {
          redirect_to(order_path(@order), :notice => 'Thank you for your business')
        }
        format.json { render json: @order, status: :created, location: @order }
      else
        format.html { render action: "edit" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end

end
