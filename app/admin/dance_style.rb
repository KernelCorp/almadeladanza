ActiveAdmin.register DanceStyle do

  index do
    column :name
    column :description
    default_actions
  end

  form do |f|
    f.inputs "Dance Style Details" do
      f.input :name
      f.input :description
      f.input :coaches, as: :check_boxes, collection: Coach.all
    end
    f.actions
  end

end
