module Admin
  class GalleriesController < Admin::BaseController

    crudify :gallery,
            :title_attribute => 'description', :xhr_paging => true

  end
end
