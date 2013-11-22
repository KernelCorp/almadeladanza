class CoachesController < ApplicationController

  def index
    @coaches = Coach.all
    render layout: 'news_about'
  end

  def show
    @coach = Coach.find params[:id]
    @coaches = Coach.all
    render
  end

end
