class Coach < User
  attr_accessible :name, :biography, :avatar, :dance_style_ids

  has_attached_file :avatar,
      :path => ":rails_root/public/coaches/:filename",
      :url => "/coaches/:filename"



end