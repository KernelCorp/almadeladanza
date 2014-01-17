class GalleryEvent < ActiveRecord::Base
  attr_accessible :title, :date
  validates_presence_of :date
  validates_presence_of :title

  has_many :images, :class_name => 'GalleryImage'

end