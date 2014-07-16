ActiveAdmin.register Client do
  index do
    column :name
    column :email
    column :phone
    default_actions
  end

  show do |client|
    attributes_table do
      row :name
      row :email
      row :phone
    end
  end


end
