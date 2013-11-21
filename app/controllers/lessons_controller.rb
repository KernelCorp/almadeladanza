class LessonsController < ApplicationController
  def index
    @lessons = Lesson.all
    @lessons = Lesson.where(dance_style_id: params[:dance_style_id]) if params[:dance_style_id]
    @lessons = Lesson.day_filter params[:day] if params[:day]
    @styles = DanceStyle.all
    respond_to do |format|
      format.html
      format.json {render json: @lessons}
    end
  end

  def show
    @lesson = Lesson.find params[:id]
    render :partial => 'popover_content'
  end

end