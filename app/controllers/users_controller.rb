class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])

    @ihcprotocols  = current_user.ihcprotocols
    @ibprotocols   = current_user.ibprotocols
    @ifprotocols   = current_user.ifprotocols
    @ipreprotocols = current_user.ipreprotocols

    respond_to do |format|
      format.html
      format.js
    end
  end

  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.followed_users
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follow'
  end

end