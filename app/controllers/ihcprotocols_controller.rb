class IhcprotocolsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @ihcprotocols = Ihcprotocol.all
  end

  def show
    @ihcprotocol = Ihcprotocol.find(params[:id])
  end

  def new
    @ihcprotocol = current_user.ihcprotocols.new
    @antibody = Antibody.find(params[:antibody_id])
    
    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit
    @ihcprotocol = current_user.ihcprotocols.find(params[:id])
  end

  def create
    @ihcprotocol = current_user.ihcprotocols.new(ihc_params)
    @antibody = Antibody.find(params[:antibody_id])

    @ihcprotocol.antibody = @antibody

    respond_to do |format|
      if @ihcprotocol.save
        @ihcprotocol.create_activity :create, owner: current_user
        format.html { redirect_to @antibody }
        format.js
      else
        @feed_items = []
        format.html { render :new }
      end
    end
  end

  def update
    @ihcprotocol = current_user.ihcprotocols.find(params[:id])

    respond_to do |format|
      if @ihcprotocol.update_attributes(ihc_params)
        format.html { redirect_to @ihcprotocol }
        format.js
      else
        render :edit
      end
    end
  end

  def destroy
    @ihcprotocol = current_user.ihcprotocols.find(params[:id])
    @antibody = Antibody.find(params[:id])
    @ihcprotocol.create_activity :destroy, owner: current_user
    @ihcprotocol.destroy

    respond_to do |format|
      format.html { redirect_to @antibody }
      format.js
    end
  end

  protected

    def ihc_params
      params.require(:ihcprotocol).permit(:tissue, :fixation, :first_wash, :methpero, :second_wash, :blocking, 
                                                   :primary_description, :third_wash, :signal, :fourth_wash, :dehydration, 
                                                   :mounting, :information)
    end

end