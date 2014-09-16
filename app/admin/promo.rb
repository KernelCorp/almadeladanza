ActiveAdmin.register Promo do
  form do |f|
    f.inputs do
      f.input :image, as: :file
    end
    f.actions
  end
end
