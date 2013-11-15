class NewsController < ApplicationController

  def index
    @news = News.all
    render
  end

  def show
    @news = News.all
    @one = News.find params[:id]
    render layout: 'news_about'
  end


end
