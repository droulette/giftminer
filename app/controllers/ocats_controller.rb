class OcatsController < ApplicationController
  authorize_resource
  # GET /ocats
  # GET /ocats.json
  def index
    @ocats = Ocat.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ocats }
    end
  end

  # GET /ocats/1
  # GET /ocats/1.json
  def show
    @ocat = Ocat.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ocat }
    end
  end

  # GET /ocats/new
  # GET /ocats/new.json
  def new
    @ocat = Ocat.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ocat }
    end
  end

  # GET /ocats/1/edit
  def edit
    @ocat = Ocat.find(params[:id])
  end

  # POST /ocats
  # POST /ocats.json
  def create
    @ocat = Ocat.new(params[:ocat])

    respond_to do |format|
      if @ocat.save
        format.html { redirect_to @ocat, notice: 'Ocat was successfully created.' }
        format.json { render json: @ocat, status: :created, location: @ocat }
      else
        format.html { render action: "new" }
        format.json { render json: @ocat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ocats/1
  # PUT /ocats/1.json
  def update
    @ocat = Ocat.find(params[:id])

    respond_to do |format|
      if @ocat.update_attributes(params[:ocat])
        format.html { redirect_to @ocat, notice: 'Ocat was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ocat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ocats/1
  # DELETE /ocats/1.json
  def destroy
    @ocat = Ocat.find(params[:id])
    @ocat.destroy

    respond_to do |format|
      format.html { redirect_to ocats_url }
      format.json { head :no_content }
    end
  end
end
