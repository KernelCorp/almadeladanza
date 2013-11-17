class GalleryEventsController < ApplicationController
  def index
    @gallery_events = GalleryEvent.all
    @gallery_events = Array.new(GalleryEvent.where(id: params[:id])) if !params[:id].blank?

    json_params = Array.new

    @gallery_events.each do |event|
      event.images.each do |image|
        img_hash = {
            src: image.path.url(:small),
            data_image_large: image.path.url(:large)
        }
        json_params.push img_hash
      end
    end

    respond_to do |format|
      format.html
      format.json {render :json => json_params}
    end
  end
end