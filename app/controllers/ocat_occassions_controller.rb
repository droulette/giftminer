class OcatOccassionsController < ApplicationController
  # GET /ocat_occassions
  # GET /ocat_occassions.json
  def index
    @ocat_occassions = OcatOccassion.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ocat_occassions }
    end
  end

  # GET /ocat_occassions/1
  # GET /ocat_occassions/1.json
  def show
    @ocat_occassion = OcatOccassion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ocat_occassion }
    end
  end

  # GET /ocat_occassions/new
  # GET /ocat_occassions/new.json
  def new
    @ocat_occassion = OcatOccassion.new
    @occassions = Occassion.all
    @ocats = Ocat.all
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ocat_occassion }
    end
  end

  # GET /ocat_occassions/1/edit
  def edit
    @ocat_occassion = OcatOccassion.find(params[:id])
    @occassions = Occassion.all
    @ocats = Ocat.all
  end

  # POST /ocat_occassions
  # POST /ocat_occassions.json
  def create
    @ocat_occassion = OcatOccassion.new(params[:ocat_occassion])

    respond_to do |format|
      if @ocat_occassion.save
        format.html { redirect_to @ocat_occassion, notice: 'Ocat occassion was successfully created.' }
        format.json { render json: @ocat_occassion, status: :created, location: @ocat_occassion }
      else
        format.html { render action: "new" }
        format.json { render json: @ocat_occassion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ocat_occassions/1
  # PUT /ocat_occassions/1.json
  def update
    @ocat_occassion = OcatOccassion.find(params[:id])

    respond_to do |format|
      if @ocat_occassion.update_attributes(params[:ocat_occassion])
        format.html { redirect_to @ocat_occassion, notice: 'Ocat occassion was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ocat_occassion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ocat_occassions/1
  # DELETE /ocat_occassions/1.json
  def destroy
    @ocat_occassion = OcatOccassion.find(params[:id])
    @ocat_occassion.destroy

    respond_to do |format|
      format.html { redirect_to ocat_occassions_url }
      format.json { head :no_content }
    end
  end
end
