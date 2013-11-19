class Coach < User
  attr_accessible :name, :biography, :avatar, :dance_style_ids

  has_attached_file :avatar,
                    :styles => {
                        :medium => ["200x200#", :png],
                        :blog => ["120x120#", :png],
                        :small => ["150x150#", :png],
                        :thumb => ["50x50#", :png]
                    },
                    :path => ":rails_root/public/system/coaches/:style/:filename",
                    :url => "/system/coaches/:style/:filename"

  has_many :lessons
  has_and_belongs_to_many :dance_styles
  has_many :posts

end