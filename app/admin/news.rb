ActiveAdmin.register News do

  index do
    column :title
    column :text
    actions
  end

  show do
    attributes_table do
      row :title
      row :text do |news|
        raw news.text
      end
    end
  end

  form do |f|
    f.inputs "News details" do
      f.input :title
      f.input :text
    end
    f.actions
  end

end