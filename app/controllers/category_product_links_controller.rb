class CategoryProductLinksController < ApplicationController
  # GET /category_product_links
  # GET /category_product_links.json
  authorize_resource
  def index
    @category_product_links = CategoryProductLink.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @category_product_links }
    end
  end

  # GET /category_product_links/1
  # GET /category_product_links/1.json
  def show
    @category_product_link = CategoryProductLink.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @category_product_link }
    end
  end

  # GET /category_product_links/new
  # GET /category_product_links/new.json
  def new
    @category_product_link = CategoryProductLink.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @category_product_link }
    end
  end

  # GET /category_product_links/1/edit
  def edit
    @category_product_link = CategoryProductLink.find(params[:id])
  end

  # POST /category_product_links
  # POST /category_product_links.json
  def create
    @category_product_link = CategoryProductLink.new(params[:category_product_link])

    respond_to do |format|
      if @category_product_link.save
        format.html { redirect_to @category_product_link, notice: 'Category product link was successfully created.' }
        format.json { render json: @category_product_link, status: :created, location: @category_product_link }
      else
        format.html { render action: "new" }
        format.json { render json: @category_product_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /category_product_links/1
  # PUT /category_product_links/1.json
  def update
    @category_product_link = CategoryProductLink.find(params[:id])

    respond_to do |format|
      if @category_product_link.update_attributes(params[:category_product_link])
        format.html { redirect_to @category_product_link, notice: 'Category product link was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @category_product_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /category_product_links/1
  # DELETE /category_product_links/1.json
  def destroy
    @category_product_link = CategoryProductLink.find(params[:id])
    @category_product_link.destroy

    respond_to do |format|
      format.html { redirect_to category_product_links_url }
      format.json { head :no_content }
    end
  end
end
