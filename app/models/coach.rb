class Coach < User
  attr_accessible :name, :biography, :avatar, :dance_style_ids

  has_attached_file :avatar,
      :path => ":rails_root/public/coaches/:filename",
      :url => "/coaches/:filename"
  has_many :lessons
  has_and_belongs_to_many :dance_styles



end