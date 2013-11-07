ActiveAdmin.register Coach do
  index do
    column :name
    column :email
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    default_actions
  end

  show do |coach|
    attributes_table do
      row :avatar do
        image_tag coach.avatar.url(:thumb)
      end
      row :name
      row :email
      row :biography do
        raw coach.biography
      end
    end
  end

  filter :email

  form do |f|
    f.inputs "Coach Details" do
      f.input :name
      f.input :biography
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :avatar, :as => :file
    end
    f.actions
  end
end
