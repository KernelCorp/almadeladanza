class DanceStyle < ActiveRecord::Base
  attr_accessible :description, :name, :coach_id

  has_and_belongs_to_many :coaches

end
