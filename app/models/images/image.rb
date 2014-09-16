class Image < ActiveRecord::Base

  attr_accessible :path, :type

  has_attached_file :path,
                    :styles => {
                        :small => ["300x400#", :png],
                        :thumb => ["50x50#", :png]
                    },
                    :path => ':rails_root/public/system/images/:style/:filename',
                    :url => '/system/images/:style/:filename'
  do_not_validate_attachment_file_type :path

end