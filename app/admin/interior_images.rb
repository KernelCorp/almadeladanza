ActiveAdmin.register InteriorImage do

  config.filters = false

  actions :all, except: [:edit]

  collection_action :add_files, method: :post do
    @int_image = InteriorImage.new(path: @raw_file)
    if @int_image.save!
      render json: { success: true, :url => @int_image.path.url(:thumb), :id => @int_image.id }
    else
      render json: { success: false }
    end
  end

  controller do
    before_filter :parse_raw_upload, only: [:add_files]

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

  form :partial => 'admin/images/interior_images_new_form'

  index do
    column :path do |image|
      image_tag image.path.url(:thumb)
    end
    actions
  end

  show do
    attributes_table do
      row :title do |image|
        image.path_file_name
      end
      row :image_view do |image|
        image_tag image.path.url(:original)
      end
    end
  end

  #form do |f|
  #  f.inputs "Interior image" do
  #    f.input :path, as: :file
  #  end
  #  f.actions
  #end

end