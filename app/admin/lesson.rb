ActiveAdmin.register Lesson do


  controller do
    def destroy
      @lesson = Lesson.find params[:id]
      @lesson.destroy
      head :ok
    end

    def create
      @lesson = Lesson.create! params[:lesson]
      render json: @lesson
    end

    def index
      redirect_to new_admin_lesson_path
    end
  end

  form partial: 'lessons_form'

end
