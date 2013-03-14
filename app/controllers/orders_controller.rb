class OrdersController < InheritedResources::Base

  def index
    @orders = current_user.orders.sorteddesc.all
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @orders }
    end


  end

  def show
    @order = Order.find(params[:id])
    @product = @order.product
    @occasion = @order.occasion
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
    if params[:order][:address_line_1].blank? and
      params[:order][:address_line_2].blank? and
      params[:order][:city].blank? and
      params[:order][:state].blank? and
      params[:order][:zip_code].blank? 
      if params[:order][:address_id]
        address = Address.find(params[:order][:address_id])
        params[:order][:address_line_1] = address.address_line_1
        params[:order][:address_line_2] = address.address_line_2
        params[:order][:city] = address.city
        params[:order][:state] = address.state
        params[:order][:zip_code] = address.zip_code
      end
    end
    @payment_info = Stripe::Customer.retrieve(current_user.subscription.stripe_customer_token)
    @occasion = Occasion.find(params[:order][:occasion_id])
    @product = Product.find(params[:order][:product_id])
    @order = current_user.orders.build(params[:order])
    respond_to do |format|
      if @order.save
        format.html {
          # flash[:success] = 'Order was successfully created.'
          if @order.user.subscription
            redirect_to(order_path(@order), :notice => 'Thank you for your business')
          else
            redirect_to edit_order_path(@order)
          end
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
        format.html {
          flash[:success] = 'Order was successfully updated.'
          redirect_to occasion_path(@order.occasion_id) 
        }
        format.json { head :no_content }
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
