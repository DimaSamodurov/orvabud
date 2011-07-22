module Admin
  class SectionsController < Admin::BaseController

    crudify :section,
            :title_attribute => 'name', :xhr_paging => true

  end
end
