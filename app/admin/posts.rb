ActiveAdmin.register Post do
  controller do
    def index
      scope = current_user.type == 'AdminUser' ? Post.scoped : current_user.posts.scoped
      @collection = scope.page() if params[:q].blank?
      @search = scope.metasearch(clean_search_params(params[:q]))
      render
    end

    def create
      @coach = current_user
      @post = @coach.posts.create! params[:post]
      redirect_to admin_post_path(@post)
    end
  end

  index do
    selectable_column
    column :title
    column :preview do |post|
      raw post.preview
    end
    column :coach
    actions
  end

  show do
    attributes_table do
      row :title
      row :preview do |post|
        raw post.preview
      end
      row :body do |post|
        raw post.body
      end
    end
  end



  form do |f|
    f.inputs do
      f.input :title
      f.input :preview, input_html: {maxlength: 400, 'data-tinymce' => false}
      f.input :body
    end
    f.actions
  end

end
