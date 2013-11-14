ActiveAdmin.register InteriorImage do

  config.filters = false

  actions :all, except: [:edit]

  index do
    column :path do |image|
      image_tag image.path.url(:thumb)
    end
    actions
  end

  show do
    attributes_table do
      row :title do |image|
        image.path_file_name
      end
      row :image_view do |image|
        image_tag image.path.url(:original)
      end
    end
  end

  form do |f|
    f.inputs "Interior image" do
      f.input :path, as: :file
    end
    f.actions
  end

end