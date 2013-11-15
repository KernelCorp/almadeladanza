class Contact < ActiveRecord::Base
  attr_accessible :phone, :email, :address
end