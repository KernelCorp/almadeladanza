class Post < ActiveRecord::Base
  attr_accessible :title, :preview, :body, :coach_id
  validates :preview, :length => {:maximum => 400}
  belongs_to :coach
end