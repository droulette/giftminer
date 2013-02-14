class RecommendationsController < ApplicationController
  before_filter :authenticate_user!
  authorize_resource
  def index
    @users=User.all
    @products=Product.all
    @recs=Recommendation.all
    @occasions=Occasion.all
  end
  
  def show
    @recommendation = Recommendation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @recommendation }
    end
  end


  def new
    @recommendation = Recommendation.new
    @users=User.all
    @products=Product.all
    @occasions=Occasion.all
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @recommendation }
    end
  end

  # GET /products/1/edit
  def edit
    @recommendation = Recommendation.find(params[:id])
    @users=User.all
    @products=Product.all
    @occasions=Occasion.all
  end

  # POST /products
  # POST /products.json
  def create
    @recommendation = current_user.recommendations.build(params[:recommendation])
    @users=User.all
    @products=Product.all
    @occasions=Occasion.all

    respond_to do |format|
      if @recommendation.save
        format.html { redirect_to occasion_path(@recommendation.occasion_id)}
        format.json { render json: @recommendation, status: :created, location: @recommendation }
      else
        format.html { render action: "new" }
        format.json { render json: @recommendation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    @recommendation = Recommendation.find(params[:id])
    @users=User.all
    @products=Product.all
    @occasions=Occasion.all
    respond_to do |format|
      if @recommendation.update_attributes(params[:recommendation])
        format.html { redirect_to occasion_path(@recommendation.occasion_id) }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @recommendation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @recommendation = Recommendation.find(params[:id])
    @recommendation.destroy

    respond_to do |format|
      format.html { redirect_to recommendations_url }
      format.json { head :no_content }
    end
  end
end
