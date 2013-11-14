class InteriorImagesController < ApplicationController

  def index
    @images = InteriorImage.all
    render
  end

end
