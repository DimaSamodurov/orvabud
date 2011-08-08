class Gallery::EntriesController < ApplicationController

  before_filter :find_all_gallery_entries
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @gallery_entry in the line below:
    @sections = GallerySection.all
    present(@page)
  end

  def show
    @gallery_entry = GalleryEntry.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @gallery_entry in the line below:
    present(@page)
  end

protected

  def find_all_gallery_entries
    @gallery_entries = GalleryEntry.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/gallery_entries").first
  end

end
