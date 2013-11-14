class NewsController < ApplicationController

  def index
    @news = News.all
    render
  end

  def show
    @news = News.all
    render
  end


end
