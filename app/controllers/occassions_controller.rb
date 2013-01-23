class OccassionsController < ApplicationController
  before_filter :authenticate_user!
  # GET /occassions
  # GET /occassions.json
  def index
    @occassions = current_user.occassions.sorteddesc.upcoming.all
    @products = Product.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @occassions }
    end
  end

  # GET /occassions/1
  # GET /occassions/1.json
  def show
    @occassion = Occassion.find(params[:id])

    # @my_recommendations= []
    # @ocats_name = @occassion.ocats.collect{|ocat| ocat.category }
    # @product_cats = ProductCat.all
    # @recent_product = Product.all.last
    # if @occassion.price_range == 'under $25' and @occassion.type_of_gift.downcase == 'silly' and (@ocats_name.include?('Birthday') or @ocats_name.include?('anniversary'))
      # @product_cats.each do |product_cat|
        # if product_cat.name == ('Food')
          # product_cat.products.each do |product|
            # @my_recommendations.push(product.name)
          # end
        # end
      # end
    # elsif @occassion.price_range == 'under $25'
      # @product_cats.each do |product_cat|
        # if product_cat.name == ('Electronics')
          # product_cat.products.each do |product|
            # @my_recommendations.push(product.name)
          # end
        # end
      # end
    # elsif @occassion.price_range == "$25.01-$100" or @occassion.price_range == "$100.01-$250"
      # @product_cats.each do |product_cat|
        # if product_cat.name == ('Clothes')
          # product_cat.products.each do |product|
            # @my_recommendations.push(product.name)
          # end
        # end
      # end
    # else @my_recommendations.push(@recent_product.name)
#       
    # end
# 

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @occassion }
    end
  end

  # GET /occassions/new
  # GET /occassions/new.json
  def new
    @occassion = Occassion.new
    @ocats = Ocat.all
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @occassion }
    end
  end

  # GET /occassions/1/edit
  def edit
    @occassion = Occassion.find(params[:id])
    @ocats = Ocat.all
  end

  # POST /occassions
  # POST /occassions.json
  def create
    @occassion = current_user.occassions.build(params[:occassion])
    @ocats = Ocat.all
    
    respond_to do |format|
      if @occassion.save
        format.html { redirect_to @occassion, notice: 'Occassion was successfully created.' }
        format.json { render json: @occassion, status: :created, location: @occassion }
      else
        format.html { render action: "new" }
        format.json { render json: @occassion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /occassions/1
  # PUT /occassions/1.json
  def update

    @occassion = Occassion.find(params[:id])

    respond_to do |format|
      if @occassion.update_attributes(params[:occassion])
        format.html { redirect_to @occassion, notice: 'Occassion was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @occassion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /occassions/1
  # DELETE /occassions/1.json
  def destroy
    @occassion = Occassion.find(params[:id])
    @occassion.destroy

    respond_to do |format|
      format.html { redirect_to occassions_url }
      format.json { head :no_content }
    end
  end
end
