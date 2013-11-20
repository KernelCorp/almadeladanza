class InteriorImage < Image

  has_attached_file :path,
                    :styles => {
                        :big => ["960x640#", :png],
                        :small => ["300x400#", :png],
                        :thumb => ["50x50#", :png]
                    },
                    :path => ':rails_root/public/system/interior_images/:style/:filename',
                    :url => '/system/interior_images/:style/:filename'


end