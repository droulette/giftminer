class OrdersController < InheritedResources::Base

  def index
    @orders = current_user.orders.sorteddesc.all
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @orders }
    end


  end

  def show
    @recipient = Order.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order }
    end
  end

  def new
    @order = Order.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order }
    end
  end

  def edit
    @order = Order.find(params[:id])
  end

  def create
    @order = current_user.orders.new(params[:order])

    respond_to do |format|
      if @order.save
        format.html {
          flash[:success] = 'Order was successfully created.'
          redirect_to occasion_path(@order.occasion_id)
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
