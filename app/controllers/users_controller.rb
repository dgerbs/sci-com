class UsersController < ApplicationController
  before_filter :authenticate_user!

  def show
    @user = User.find(params[:id])

    @ihcprotocols  = @user.ihcprotocols.paginate(page: params[:page]).per_page(10)
    @ibprotocols   = @user.ibprotocols.paginate(page: params[:page]).per_page(10)
    @ifprotocols   = @user.ifprotocols.paginate(page: params[:page]).per_page(10)
    @ipreprotocols = @user.ipreprotocols.paginate(page: params[:page]).per_page(10)
    @flowprotocols = @user.flowprotocols.paginate(page: params[:page]).per_page(10)

    respond_to do |format|
      format.html
      format.js
    end
  end

  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.followed_users.paginate(page: params[:page]).per_page(20)
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page]).per_page(20)
    render 'show_follow'
  end

end