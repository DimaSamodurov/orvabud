module Admin
  class ImagesController < Admin::BaseController

    crudify :image,
            :title_attribute => 'name', :xhr_paging => true

  end
end
