class FlowprotocolsController < ApplicationController
  before_filter :authenticate_user!

  def index
    if params[:antibody_id].present?
      @antibody = Antibody.find(params[:antibody_id])
      @flowprotocols = @antibody.flowprotocols
    elsif params[:user_id].present?
      @user = User.find(params[:user_id])
      @flowprotocols = Flowprotocol.where(user: @user)
    end
  end

  def show
    @flowprotocol = Flowprotocol.find(params[:id])
  end

  def new
    @flowprotocol = current_user.flowprotocols.new
    @antibody = Antibody.find(params[:antibody_id])
    
    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit
    @flowprotocol = current_user.flowprotocols.find(params[:id])
  end

  def create
    @flowprotocol = current_user.flowprotocols.new(flow_params)
    @antibody = Antibody.find(params[:antibody_id])

    @flowprotocol.antibody = @antibody

    respond_to do |format|
      if @flowprotocol.save
        @flowprotocol.create_activity :create, owner: current_user
        format.html { redirect_to @flowprotocol }
        format.js
      else
        @feed_items = []
        format.html { render :new }
      end
    end
  end

  def update
    @flowprotocol = current_user.flowprotocols.find(params[:id])

    respond_to do |format|
      if @flowprotocol.update_attributes(flow_params)
        format.html { redirect_to @flowprotocol }
        format.js
      else
        render :edit
      end
    end
  end

  def destroy
    @flowprotocol = current_user.flowprotocols.find(params[:id])
    @antibody = Antibody.find(params[:id])
    @flowprotocol.create_activity :destroy, owner: current_user
    @flowprotocol.destroy

    respond_to do |format|
      format.html { redirect_to @antibody }
      format.js
    end
  end

  protected

    def flow_params
      params.require(:flowprotocol).permit(:cell, :fixation, :incubation, :permeabilization, :cell_number, :first_wash,
                                           :immunostain_vol, :primary_description, :second_wash, :secondary_description,
                                           :third_wash, :final_vol, :information, :blot)
    end

end