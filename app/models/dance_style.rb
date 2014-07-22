class DanceStyle < ActiveRecord::Base
  include FriendlyId
  attr_accessible :description, :preview, :name, :coach_ids
  friendly_id :name, use: :slugged

  has_and_belongs_to_many :coaches
  has_many :lessons, dependent: :destroy

end
