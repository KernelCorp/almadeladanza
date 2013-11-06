class Image < ActiveRecord::Base
  before_create :set_file_name

  attr_accessible :path

  has_attached_file :path,
                    :styles => {
                        :thumb => ["50x50#", :png]
                    },
                    :path => ':rails_root/public/system/images/:style/:filename',
                    :url => '/system/images/:style/:filename'

  protected

  def set_file_name
    begin
      name = SecureRandom.uuid
    end while not Image.where(:path_file_name => name).empty?
    self.path.instance_write(:file_name, name)
  end
end