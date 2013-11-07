class LessonsController < ApplicationController
  def index
    @lessons = Lesson.all
    @lessons = Lesson.where(dance_style_id: params[:style_id]) if params[:style_id]
    @lessons = Lesson.day_filter params[:day] if params[:day]
    respond_to do |format|
      format.html render
      format.json render json:  @lessons
    end
  end


end