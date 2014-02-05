class PagesController < ApplicationController
  def home
    if user_signed_in?
      @ibprotocol = current_user.ibprotocols.build
      @feed_items  = current_user.feed
    end
  end

  def about
  end

  def contact
  end
  
end