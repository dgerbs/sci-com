class IbprotocolsController < ApplicationController
  before_filter :authenticate_user!

  def index
    if params[:antibody_id].present?
      @antibody = Antibody.find(params[:antibody_id])
      @ibprotocols = @antibody.ibprotocols
    elsif params[:user_id].present?
      @user = User.find(params[:user_id])
      @ibprotocols = Ibprotocol.where(user: @user)
    end
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
        @ibprotocol.create_activity :create, owner: current_user
        format.html { redirect_to @ibprotocol }
        format.js
      else
        @feed_items = []
        format.html { render :new }
      end
    end
  end

  def update
    @ibprotocol = current_user.ibprotocols.find(params[:id])

    respond_to do |format|
      if @ibprotocol.update_attributes(ib_params)
        format.html { redirect_to @ibprotocol }
        format.js
      else
        render :edit
      end
    end
  end

  def destroy
    @ibprotocol = current_user.ibprotocols.find(params[:id])
    @antibody = Antibody.find(params[:id])
    @ibprotocol.create_activity :destroy, owner: current_user
    @ibprotocol.destroy

    respond_to do |format|
      format.html { redirect_to @antibody }
      format.js
    end
  end

  protected

    def ib_params
      params.require(:ibprotocol).permit(:cell_tissue, :lysis, :sonication, :sample_size, :sample_loading, :gel, 
                                         :electrophoresis, :membrane, :transfer, :blocking, :primary_description, 
                                         :first_wash, :secondary_description, :second_wash, :detection, :information, :blot)
    end

end