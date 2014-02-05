class PagesController < ApplicationController
  def home
    if user_signed_in?
      @ihcprotocol = current_user.ihcprotocols.build
      @ibprotocol  = current_user.ibprotocols.build
      @feed_items  = current_user.feed
    end
  end

  def about
  end

  def contact
  end
  
end