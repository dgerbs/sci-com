class AntibodiesController < ApplicationController
  before_filter :authenticate_user!, except: [:index]

  def index
    @antibodies = Antibody.all

    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @antibody = Antibody.find(params[:id])

    if user_signed_in?
      @ihcprotocols = @antibody.ihcprotocols
      @ibprotocols  = @antibody.ibprotocols
      @ifprotocols  = @antibody.ifprotocols
    else
      @antibody
    end
  end

  def new
    @antibody = Antibody.new

    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @antibody = Antibody.new(antibody_params)
    if @antibody.save
      respond_to do |format|
        format.html { redirect_to root_path, notice: 'Antibody successfully created.' }
        format.js
      end
    else
      render :new
    end
  end

  def edit
    if user_signed_in?
      @antibody = Antibody.find(params[:id])
    else
      render :edit
    end
  end

  def update
    @antibody = Antibody.find(params[:id])
    if @antibody.update(antibody_params)
      redirect_to @antibody, notice: 'Antibody successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @antibody = Antibody.find(params[:id])
    if @antibody.destroy
      redirect_to @antibody
    else
      render @antibody
    end
  end

  protected
  
    def antibody_params
      params.require(:antibody).permit(:target, :antibody, :vendor, :product, :isotype)
    end
end
