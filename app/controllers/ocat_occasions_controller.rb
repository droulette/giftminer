class OcatOccasionsController < ApplicationController
  # GET /ocat_occasions
  # GET /ocat_occasions.json
  authorize_resource
  def index
    @ocat_occasions = OcatOccasion.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ocat_occasions }
    end
  end

  # GET /ocat_occasions/1
  # GET /ocat_occasions/1.json
  def show
    @ocat_occasion = OcatOccasion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ocat_occasion }
    end
  end

  # GET /ocat_occasions/new
  # GET /ocat_occasions/new.json
  def new
    @ocat_occasion = OcatOccasion.new
    @occasions = Occasion.all
    @ocats = Ocat.all
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ocat_occasion }
    end
  end

  # GET /ocat_occasions/1/edit
  def edit
    @ocat_occasion = OcatOccasion.find(params[:id])
    @occasions = Occasion.all
    @ocats = Ocat.all
  end

  # POST /ocat_occasions
  # POST /ocat_occasions.json
  def create
    @ocat_occasion = OcatOccasion.new(params[:ocat_occasion])

    respond_to do |format|
      if @ocat_occasion.save
        format.html { redirect_to @ocat_occasion, notice: 'Ocat occasion was successfully created.' }
        format.json { render json: @ocat_occasion, status: :created, location: @ocat_occasion }
      else
        format.html { render action: "new" }
        format.json { render json: @ocat_occasion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ocat_occasions/1
  # PUT /ocat_occasions/1.json
  def update
    @ocat_occasion = OcatOccasion.find(params[:id])

    respond_to do |format|
      if @ocat_occasion.update_attributes(params[:ocat_occasion])
        format.html { redirect_to @ocat_occasion, notice: 'Ocat occasion was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ocat_occasion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ocat_occasions/1
  # DELETE /ocat_occasions/1.json
  def destroy
    @ocat_occasion = OcatOccasion.find(params[:id])
    @ocat_occasion.destroy

    respond_to do |format|
      format.html { redirect_to ocat_occasions_url }
      format.json { head :no_content }
    end
  end
end
