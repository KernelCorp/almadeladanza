class Coach < User
  attr_accessible :name, :biography, :avatar, :dance_style_ids

  has_attached_file :avatar,
                    :styles => {
                        :blog => ["120x120#", :png],
                        :small => ["150x150#", :png],
                        :thumb => ["50x50#", :png]
                    },
                    :path => ":rails_root/public/coaches/:style/:filename",
                    :url => "/coaches/:style/:filename"

  has_many :lessons
  has_and_belongs_to_many :dance_styles
  has_many :posts

end