class DanceStylesController < ApplicationController

  def index
    @styles = DanceStyle.all
    render
  end

  # def show
  #   @style = DanceStyle.find params[:id]
  #   @styles = DanceStyle.all
  #   render
  # end

end
