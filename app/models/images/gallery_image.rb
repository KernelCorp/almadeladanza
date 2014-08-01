class GalleryImage < Image

  belongs_to :gallery_event

  has_attached_file :path,
                    :styles => {
                        :large => ["500x320#", :png],
                        :small => ["150x115#", :png],
                        :thumb => ["50x50#", :png]
                    },
                    :path => ':rails_root/public/system/gallery_images/:style/:filename',
                    :url => '/system/gallery_images/:style/:filename'
  validates_attachment_content_type :path, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end