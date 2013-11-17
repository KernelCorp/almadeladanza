ActiveAdmin.register GalleryEvent do

  member_action :add_files, method: :post do
    @gallery_event = GalleryEvent.find params[:id]
    @image = @gallery_event.images.new(path: @raw_file)
    if @image.save!
      render json: { success: true, :url => @image.path.url(:thumb), :id => @image.id }
    else
      render json: { success: false }
    end
  end

  controller do
    before_filter  :parse_raw_upload, :only => [:add_files]
    private
    def parse_raw_upload
      if env['HTTP_X_FILE_UPLOAD'] == 'true'
        @raw_file = env['rack.input']
        @raw_file.class.class_eval { attr_accessor :original_filename, :content_type }
        @raw_file.original_filename = env['HTTP_X_FILE_NAME']
        @raw_file.content_type = env['HTTP_X_MIME_TYPE']
        if @raw_file.class.name == 'Unicorn::TeeInput'
          @raw_file = Paperclip::StringioAdapter.new(@raw_file)
        end
      end
    end
  end

  show do
    attributes_table do
      row :title
      row :date
      render 'admin/images/new_gallery_images'
    end
  end



end
