class PublicationsController < ApplicationController
  def index
    @publications = PublicActivity::Activity.order("created_at desc")
  end
end
