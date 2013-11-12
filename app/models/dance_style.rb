class DanceStyle < ActiveRecord::Base
  attr_accessible :description, :name, :coach_ids

  has_and_belongs_to_many :coaches

end
