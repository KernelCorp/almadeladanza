ActiveAdmin.register PriceList do
  config.filters = false
  actions :all, :except => [:destroy, :new, :create]
end
