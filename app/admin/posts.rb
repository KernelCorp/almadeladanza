ActiveAdmin.register Post do
  controller do
    def index
      scope = current_user.posts.scoped
      @collection = scope.page() if params[:q].blank?
      @search = scope.metasearch(clean_search_params(params[:q]))
      render
    end
  end

  index do
    selectable_column
    column :title
    column :preview
    column :body do |post|
      raw post.body
    end
    actions
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :preview
      f.input :body
    end
    f.actions
  end

end
