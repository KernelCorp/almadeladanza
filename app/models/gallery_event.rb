class GalleryEvent < ActiveRecord::Base
  attr_accessible :title, :date
  has_many :images, :class_name => 'GalleryImage'
end