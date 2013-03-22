class RecipientsController < ApplicationController

  # GET /recipients
  # GET /recipients.json
  def index
    @recipients = current_user.recipients.all
    @recipients_search = current_user.recipients.order(:first_name).order(:last_name).where("first_name like ?", "#{params[:term]}%")

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @recipients_search.map(&:full_name) }
    end


  end

  # GET /recipients/1
  # GET /recipients/1.json
  def show
    @recipient = Recipient.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @recipient }
    end
  end

  # GET /recipients/new
  # GET /recipients/new.json
  def new
    @recipient = Recipient.new
    @address = @recipient.addresses.build
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @recipient }
    end
  end

  # GET /recipients/1/edit
  def edit
    @recipient = Recipient.find(params[:id])
    @address = @recipient.addresses.build

  end

  # POST /recipients
  # POST /recipients.json
  def create    
    @recipient = current_user.recipients.new(params[:recipient])
    
    respond_to do |format|
      if @recipient.save
        format.html {
          flash[:success] = 'Recipient was successfully created.'
          redirect_to @recipient 
        }
        format.json { render json: @recipient, status: :created, location: @recipient }
      else
        format.html { render action: "new" }
        format.json { render json: @recipient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /recipients/1
  # PUT /recipients/1.json
  def update
    @recipient = Recipient.find(params[:id])
    respond_to do |format|
      if @recipient.update_attributes(params[:recipient])
        format.html {
          flash[:success] = 'Recipient was successfully updated.'
          redirect_to @recipient 
        }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @recipient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipients/1
  # DELETE /recipients/1.json
  def destroy
    @recipient = Recipient.find(params[:id])
    @recipient.destroy

    respond_to do |format|
      format.html { redirect_to recipients_url }
      format.json { head :no_content }
    end
  end
end
