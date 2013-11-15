class GalleryEventsController < ApplicationController
  def index
    @gallery_events = GalleryEvent.all
    @gallery_events = GalleryEvent.find(params[:id]) if params[:id]
    respond_to do |format|
      format.html
      format.json {render :json => @gallery_events}
    end
  end
end