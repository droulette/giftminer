class OccasionsController < ApplicationController
  before_filter :authenticate_user!
  authorize_resource
  # GET /occasions
  # GET /occasions.json
  def index
    @occasions = current_user.occasions.sorteddesc.all

    @products = Product.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @occasions }
    end
  end

  # GET /occasions/1
  # GET /occasions/1.json
  def show
    @occasion = Occasion.find(params[:id])
    @products = Product.all
    @productcats = ProductCat.all
    @gift_types = GiftType.all
    @order = Order.new
    @subscription = Subscription.new
    if @my_recommendation = @occasion.product_recommendations.first
      @recommendation = current_user.recommendations.find_by_product_id_and_occasion_id(@my_recommendation.id,@occasion.id) || current_user.recommendations.build(:product_id => @my_recommendation.id, :occasion_id => @occasion.id)
    end

    if @my_recommendation
      @product = Product.find(@my_recommendation.id)
    end
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @occasion }
    end
  end

  # GET /occasions/new
  # GET /occasions/new.json
  def new
    @occasion = Occasion.new
    @ocats = Ocat.all
    @products = Product.all
    @productcats = ProductCat.all
    @category_product_link = CategoryProductLink.all
    @gift_types = GiftType.all
    @occasion.date ||= params[:date]
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @occasion }
    end
  end

  # GET /occasions/1/edit
  def edit
    @occasion = Occasion.find(params[:id])
    @ocats = Ocat.all
    @gift_types = GiftType.all
  end

  # POST /occasions
  # POST /occasions.json
  def create

    params[:occasion][:price_min] = params[:occasion][:price_min].to_d * 100
    params[:occasion][:price_max] = params[:occasion][:price_max].to_d * 100

    @occasion = current_user.occasions.build(params[:occasion])
    @gift_types = GiftType.all
    
    # if you pass recipient_name in before the @occasion-object is initialized,
    # it won't be initialized correctly because there is no user_id
    @occasion.recipient_name = params[:occasion][:recipient_name]
    
    @ocats = Ocat.all



    
    respond_to do |format|
      if @occasion.save
        format.html {
          flash[:success] = 'Occasion was successfully created.'
          redirect_to @occasion 
        }
        format.json { render json: @occasion, status: :created, location: @occasion }
      else
        format.html { render action: "new" }
        format.json { render json: @occasion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /occasions/1
  # PUT /occasions/1.json
  def update
    @occasion = Occasion.find(params[:id])
    @ocats = Ocat.all
    @gift_types = GiftType.all

    params[:occasion][:price_min] = params[:occasion][:price_min].gsub('$','').to_d * 100
    params[:occasion][:price_max] = params[:occasion][:price_max].gsub('$','').to_d * 100
    respond_to do |format|
      if @occasion.update_attributes(params[:occasion])
        format.html {
          flash[:success] = 'Occasion was successfully updated.'
          redirect_to @occasion 
        }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @occasion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /occasions/1
  # DELETE /occasions/1.json
  def destroy
    @occasion = Occasion.find(params[:id])
    @occasion.destroy

    respond_to do |format|
      format.html { redirect_to occasions_url }
      format.json { head :no_content }
    end
  end
end
