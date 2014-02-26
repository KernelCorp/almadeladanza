ActiveAdmin.register Lesson do

  member_action :make_busy, method: :post do
    lesson = Lesson.find params[:id]
    busy = lesson.no_vacancy? ? false : true
    lesson.update_attribute :no_vacancy, busy
    head :ok
  end

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
