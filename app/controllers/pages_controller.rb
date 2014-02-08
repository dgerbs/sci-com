class PagesController < ApplicationController

  def home
    if user_signed_in?
      @publications = PublicActivity::Activity.order("created_at desc").where(owner_type: "User", owner_id: current_user.followed_users.map {|u| u.id}).all
    else
    end
  end

  def about
  end

  def contact
  end
  
end