module Admin
  class Gallery::SectionsController < Admin::BaseController

    crudify :gallery_section, :xhr_paging => true, :title_attribute => 'name'

  end
end
