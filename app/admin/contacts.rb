ActiveAdmin.register Contact do


  controller do
    def new
      unless Contact.all.length >= 1
        super
      else
        redirect_to :back
      end
    end
  end

end
