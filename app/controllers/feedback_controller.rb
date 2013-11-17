class FeedbackController < ApplicationController

  def index
    @feedback = Feedback.all
    render layout: 'news_about'
  end

end
