class Client < ActiveRecord::Base
  attr_accessible :email, :name, :phone, :lesson_id

  belongs_to :lesson

end
