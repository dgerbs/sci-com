class IfprotocolsController < ApplicationController
  before_filter :authenticate_user!

  def index
    if params[:antibody_id].present?
      @antibody = Antibody.find(params[:antibody_id])
      @ifprotocols = @antibody.ifprotocols
    elsif params[:user_id].present?
      @user = User.find(params[:user_id])
      @ifprotocols = Ifprotocol.where(user: @user)
    end
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
        @ifprotocol.create_activity :create, owner: current_user
        format.html { redirect_to @antibody }
        format.js
      else
        format.html { render :new }
      end
    end
  end

  def update
    @ifprotocol = current_user.ifprotocols.find(params[:id])

    respond_to do |format|
      if @ifprotocol.update_attributes(if_params)
        format.html { redirect_to @ifprotocol }
        format.js
      else
        render :edit
      end
    end
  end

  def destroy
    @ifprotocol = current_user.ifprotocols.find(params[:id])
    @antibody = Antibody.find(params[:id])
    @ifprotocol.create_activity :destroy, owner: current_user
    @ifprotocol.destroy

    respond_to do |format|
      format.html { redirect_to @antibody }
      format.js
    end
  end

  protected

    def if_params
      params.require(:ifprotocol).permit(:cell, :fixation, :first_wash, :blocking, :primary_description, :second_wash, 
                                         :secondary_description, :third_wash, :coverslip, :information, :blot)
    end

end