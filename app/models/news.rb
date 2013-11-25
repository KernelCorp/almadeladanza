class News < ActiveRecord::Base
  attr_accessible :text, :title, :pic

  has_attached_file :pic,
                    :styles => {
                        :thumb => ["50x50#", :png]
                    },
                    :path => ':rails_root/public/system/images/:style/:filename',
                    :url => '/system/images/:style/:filename'

end
