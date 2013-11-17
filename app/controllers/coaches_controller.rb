class CoachesController < ApplicationController

  def index
    @coaches = Coach.all
    render layout: 'news_about'
  end

end
