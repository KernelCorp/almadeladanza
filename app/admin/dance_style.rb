ActiveAdmin.register DanceStyle do

  collection_action :get_coaches do
      @style = DanceStyle.find params[:id]
      @coaches = @style.coaches
      render json: @coaches
  end


  index do
    column :name
    column :description
    default_actions
  end

  form do |f|
    f.inputs "Dance Style Details" do
      f.input :name
      f.input :description
      f.input :preview, input_html: {maxlength: 70}
      f.input :coaches, as: :check_boxes, collection: Coach.all
    end
    f.actions
  end

end
