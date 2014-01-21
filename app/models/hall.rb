class Hall < ActiveRecord::Base
  attr_accessible :name
  has_many :lessons, dependent: :destroy
end