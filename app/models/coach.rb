class Coach < User
  attr_accessible :name, :biography, :avatar

  has_attached_file :avatar,
      :path => ":rails_root/public/coaches/:filename",
      :url => "/coaches/:filename"
  has_many :lessons

end