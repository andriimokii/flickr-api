class StaticPagesController < ApplicationController
  def index
    @photos = get_photos
  end

  private

  def get_photos
    flickr = Flickr.new
    return flickr.photos.search(user_id: params[:user_id]) if params[:user_id].present?

    flickr.photos.getRecent
  end
end
