class IbprotocolsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @ibprotocols = Ibprotocol.all
  end

  def show
    @ibprotocol = Ibprotocol.find(params[:id])
  end

  def new
    @ibprotocol = current_user.ibprotocols.new
    @antibody = Antibody.find(params[:antibody_id])
    
    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit
    @ibprotocol = current_user.ibprotocols.find(params[:id])
  end

  def create
    @ibprotocol = current_user.ibprotocols.new(ib_params)
    @antibody = Antibody.find(params[:antibody_id])

    @ibprotocol.antibody = @antibody

    respond_to do |format|
      if @ibprotocol.save
        format.html { redirect_to @antibody, notice: "Immunoblot application successfully created!"}
        format.js
      else
        format.html { render :new }
      end
    end
  end

  def update
    @ibprotocol = current_user.ibprotocols.find(params[:id])

    respond_to do |format|
      if @ibprotocol.update_attributes(ib_params)
        format.html { redirect_to @ibprotocol, notice: "Immunoblot application successfully updated." }
        format.js
      else
        render :edit
      end
    end
  end

  def destroy
    @ibprotocol = current_user.ibprotocols.find(params[:id]).destroy
    @antibody = Antibody.find(params[:id])

    respond_to do |format|
      format.html { redirect_to @antibody, notice: "Immunoblot application successfully destroyed." }
      format.js
    end
  end

  protected

    def ib_params
      params.require(:ibprotocol).permit(:cell_tissue, :lysis, :sonication, :sample_size, :sample_loading, :gel, 
                                         :electrophoresis, :membrane, :transfer, :blocking, :primary_description, 
                                         :first_wash, :secondary_description, :second_wash, :detection, :information)
    end

end