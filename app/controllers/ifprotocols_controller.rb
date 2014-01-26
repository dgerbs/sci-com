class IfprotocolsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @ifprotocols = Ifprotocol.all
  end

  def show
    @ifprotocol = Ifprotocol.find(params[:id])
  end

  def new
    @ifprotocol = current_user.ifprotocols.new
    @antibody = Antibody.find(params[:antibody_id])
    
    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit
    @ifprotocol = current_user.ifprotocols.find(params[:id])
  end

  def create
    @ifprotocol = current_user.ifprotocols.new(if_params)
    @antibody = Antibody.find(params[:antibody_id])

    @ifprotocol.antibody = @antibody

    respond_to do |format|
      if @ifprotocol.save
        format.html { redirect_to @antibody, notice: "Immunofluorescence application successfully created!"}
        format.js
      else
        format.html { render :new }
      end
    end
  end

  def update
    @ifprotocol = current_user.ifprotocols.find(params[:id])

    respond_to do |format|
      if @ifprotocol.update_attributes(ib_params)
        format.html { redirect_to @ifprotocol, notice: "Immunofluorescence application successfully updated." }
        format.js
      else
        render :edit
      end
    end
  end

  def destroy
    @ifprotocol = current_user.ifprotocols.find(params[:id]).destroy
    @antibody = Antibody.find(params[:id])

    respond_to do |format|
      format.html { redirect_to @antibody, notice: "Immunofluorescence application successfully destroyed." }
      format.js
    end
  end

  protected

    def if_params
      params.require(:ifprotocol).permit(:cell, :fixation, :first_wash, :blocking, :primary_description, :second_wash, 
                                         :secondary_description, :thid_wash, :coverslip, :information)
    end

end