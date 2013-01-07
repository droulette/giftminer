class OccassionsController < ApplicationController
  before_filter :authenticate_user!
  # GET /occassions
  # GET /occassions.json
  def index
    @occassions = current_user.occassions.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @occassions }
    end
  end

  # GET /occassions/1
  # GET /occassions/1.json
  def show
    @occassion = Occassion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @occassion }
    end
  end

  # GET /occassions/new
  # GET /occassions/new.json
  def new
    @occassion = Occassion.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @occassion }
    end
  end

  # GET /occassions/1/edit
  def edit
    @occassion = Occassion.find(params[:id])
  end

  # POST /occassions
  # POST /occassions.json
  def create
    @occassion = current_user.occassions.build(params[:occassion])

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
