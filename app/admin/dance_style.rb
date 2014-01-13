ActiveAdmin.register DanceStyle do

  collection_action :get_coaches do
      @style = DanceStyle.find params[:id]
      @coaches = @style.coaches
      render json: @coaches
  end


  index do
    column :name
    column :preview do |style|
      raw style.description
    end
    default_actions
  end

  show do
    attributes_table do
      row :name
      row :preview do |style|
        raw style.preview
      end
      row :description do |style|
        raw style.description
      end
    end
  end

  form do |f|
    f.inputs "Dance Style Details" do
      f.input :name
      f.input :description
      f.input :preview, input_html: {maxlength: 200, 'data-tinymce' => false}
      f.input :coaches, as: :check_boxes, collection: Coach.all
    end
    f.actions
  end

end
