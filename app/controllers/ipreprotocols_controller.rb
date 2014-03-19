class IpreprotocolsController < ApplicationController
  before_filter :authenticate_user!

  def index
    if params[:antibody_id].present?
      @antibody = Antibody.find(params[:antibody_id])
      @ipreprotocols = @antibody.ipreprotocols
    elsif params[:user_id].present?
      @user = User.find(params[:user_id])
      @ipreprotocols = Ipreprotocol.where(user: @user)
    end
  end

  def show
    @ipreprotocol = Ipreprotocol.find(params[:id])
  end

  def new
    @ipreprotocol = current_user.ipreprotocols.new
    @antibody = Antibody.find(params[:antibody_id])
    
    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit
    @ipreprotocol = current_user.ipreprotocols.find(params[:id])
  end

  def create
    @ipreprotocol = current_user.ipreprotocols.new(ipre_params)
    @antibody = Antibody.find(params[:antibody_id])

    @ipreprotocol.antibody = @antibody

    respond_to do |format|
      if @ipreprotocol.save
        @ipreprotocol.create_activity :create, owner: current_user
        format.html { redirect_to @antibody }
        format.js
      else
        format.html { render :new }
      end
    end
  end

  def update
    @ipreprotocol = current_user.ipreprotocols.find(params[:id])

    respond_to do |format|
      if @ipreprotocol.update_attributes(ipre_params)
        format.html { redirect_to @ipreprotocol }
        format.js
      else
        render :edit
      end
    end
  end

  def destroy
    @ipreprotocol = current_user.ipreprotocols.find(params[:id])
    @antibody = Antibody.find(params[:id])
    @ipreprotocol.create_activity :destroy, owner: current_user
    @ipreprotocol.destroy

    respond_to do |format|
      format.html { redirect_to @antibody }
      format.js
    end
  end

  protected

    def ipre_params
      params.require(:ipreprotocol).permit(:cell, :lysis, :sonication, :sample_concentration, :preclearing, :primary_description, 
                                           :ab_capture, :first_wash, :sample_prep, :gel, :electrophoresis, :membrane, :transfer, 
                                           :blocking, :secondary_description, :second_wash, :tertiary_description, :third_wash, 
                                           :detection, :information, :blot)
    end

end