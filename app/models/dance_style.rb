class DanceStyle < ActiveRecord::Base
  attr_accessible :description, :preview, :name, :coach_ids

  has_and_belongs_to_many :coaches
  has_many :lessons, dependent: :destroy

end
