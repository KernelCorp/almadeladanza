class Image < ActiveRecord::Base

  attr_accessible :path

  has_attached_file :path,
                    :styles => {
                        :big => ["960x640#", :png],
                        :small => ["300x400#", :png],
                        :thumb => ["50x50#", :png]
                    },
                    :path => ':rails_root/public/system/images/:style/:filename',
                    :url => '/system/images/:style/:filename'

  protected

end