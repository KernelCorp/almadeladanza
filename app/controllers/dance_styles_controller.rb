class DanceStylesController < ApplicationController

  def index
    @styles = DanceStyle.all
    render
  end



end
