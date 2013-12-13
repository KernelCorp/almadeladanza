ActiveAdmin.register News do

  index do
    column :title
    column :pic do |news|
      image_tag news.pic.url(:thumb)
    end
    column :text
    actions
  end

  show do
    attributes_table do
      row :title
      row :text do |news|
        raw news.text
      end
      row :pic do |news|
        image_tag news.pic.url(:original)
      end
    end
  end

  form do |f|
    f.inputs "News details" do
      f.input :title
      f.input :text
      f.input :pic, as: :file
    end
    f.actions
  end

end