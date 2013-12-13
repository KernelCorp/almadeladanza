class AdminUser < User
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :avatar, :name
  has_attached_file :avatar,
                    :styles => {
                        :medium => ["200x200#", :png],
                        :blog => ["120x120#", :png],
                        :small => ["150x150#", :png],
                        :thumb => ["50x50#", :png]
                    },
                    :path => ":rails_root/public/system/coaches/:style/:filename",
                    :url => "/system/coaches/:style/:filename"

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  has_many :posts, :foreign_key => :coach_id

end