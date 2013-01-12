class ProductsController < ApplicationController
  before_filter :authenticate_user!
  # GET /products
  # GET /products.json
  def index
    @products = Product.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])
    @product_cat = @product.product_cats

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @product = Product.new
    @cat= ProductCat.new
    @product_cat= ProductCat.all
   
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
    @product_cat= ProductCat.all
  end

  # POST /products
  # POST /products.json
  def create
    debugger
    product_cat_ids = params['product'].delete('product_cat_ids')
    
    @product = Product.new(params[:product])
    @product_cat= ProductCat.all
    @cat= ProductCat.new
    

    
    respond_to do |format|
      if @product.save
        
        product_cat_ids.each do |product_cat_id|
          @category_product_link = @product.category_product_links.build({:product_cat_id => product_cat_id})
          @category_product_link.save
        end if product_cat_ids
        
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    @product = Product.find(params[:id])
    @product_cat= ProductCat.all
    @category_product_links= CategoryProductLink.all
    
    @product_cat_ids = Array.new
     
    @product.category_product_links.each do |x|
        @product_cat_ids.push(x.product_cat_id)
        unless params['product']['product_cat_ids'] && params['product']['product_cat_ids'].include?(x.product_cat_id)
          x.destroy
        end
    end
         
    params['product']['product_cat_ids'].each do |product_cat_id|
      if !@product_cat_ids.include?(product_cat_id)
        @category_product_link = @product.category_product_links.build({:product_cat_id => product_cat_id})
        @category_product_link.save
      end       
    end if params['product']['product_cat_ids']

    
    params['product'].delete('product_cat_ids')    
    
    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end
end
