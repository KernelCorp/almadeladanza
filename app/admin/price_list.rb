ActiveAdmin.register PriceList do
  config.filters = false
  actions :all, :except => [:destroy, :new, :create]

  index do
    column :id
    column :created_at
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :id
      row :content do |list|
        raw list.content
      end
      row :created_at
      row :updated_at
    end
  end
end
