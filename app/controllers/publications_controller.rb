class PublicationsController < ApplicationController
  
  def index
    @publications = PublicActivity::Activity.order("created_at desc").where(owner_type: "User", owner_id: current_user.followed_users.map {|u| u.id}).all
  end
end
