class GalleryImage < Image
  belongs_to :gallery_event
  has_attached_file :path,
                    :styles => {
                        :large => ["500x320#", :png],
                        :small => ["150x115#", :png],
                        :thumb => ["50x50#", :png]
                    },
                    :path => ':rails_root/public/system/images/:style/:filename',
                    :url => '/system/images/:style/:filename'
end