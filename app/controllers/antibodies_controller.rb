class AntibodiesController < ApplicationController
  before_filter :authenticate_user!, except: :index

  def index
    @antibodies = Antibody.text_search(params[:query]).page(params[:page]).per_page(12).find_with_reputation(:votes, :all, order: "votes desc")
  end

  def show
    @antibody = Antibody.find(params[:id])

    @ihcprotocols  = @antibody.ihcprotocols.paginate(page: params[:page]).per_page(10)
    @ibprotocols   = @antibody.ibprotocols.paginate(page: params[:page]).per_page(10)
    @ifprotocols   = @antibody.ifprotocols.paginate(page: params[:page]).per_page(10)
    @ipreprotocols = @antibody.ipreprotocols.paginate(page: params[:page]).per_page(10)
    @flowprotocols = @antibody.flowprotocols.paginate(page: params[:page]).per_page(10)

    respond_to do |format|
      format.html
      format.js
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
      @antibody.create_activity :create, owner: current_user
      respond_to do |format|
        format.html { redirect_to root_path }
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
      redirect_to @antibody
    else
      render :edit
    end
  end

  def destroy
    @antibody = Antibody.find(params[:id])
    @antibody.create_activity :destroy, owner: current_user
    @antibody.destroy
     
    respond_to do |format|
      format.html { redirect_to @antibodies }
      format.js
    end
  end

   def vote
    value = params[:type] == "up" ? 1 : -1
    @antibody = Antibody.find(params[:id])
    @antibody.add_or_update_evaluation(:votes, value, current_user)
    redirect_to :back, alert: "Thank you for your vote!"
  end

  protected
  
    def antibody_params
      params.require(:antibody).permit(:target, :antibody, :vendor, :product, :isotype)
    end
end
