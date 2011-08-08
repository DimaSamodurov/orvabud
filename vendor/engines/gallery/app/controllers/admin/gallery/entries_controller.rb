class Admin::Gallery::EntriesController < Admin::BaseController

  crudify :gallery_entry, :xhr_paging => true

  def index
    if params[:gallery_section_id]
      @sections = GallerySection.where(:id => params[:gallery_section_id])
    else
      @sections = GallerySection.all
    end
  end

  def new
    @gallery_entry = GalleryEntry.new(:gallery_section_id => params[:gallery_section_id])
  end

  def reorder
    find_all_gallery_entries
  end

  # Based upon http://github.com/matenia/jQuery-Awesome-Nested-Set-Drag-and-Drop
  def update_positions
    previous = nil
    # The list doesn't come to us in the correct order. Frustration.
    0.upto((newlist ||= params[:ul]).length - 1) do |index|
      hash = newlist[index.to_s]
      next if hash['id'].blank?
      moved_item_id = hash['id'].split('gallery_entry_').last
      @current_gallery_entry = GalleryEntry.where(:id => moved_item_id).first

      if @current_gallery_entry.respond_to?(:move_to_root)
        if previous.present?
          @current_gallery_entry.move_to_right_of(GalleryEntry.where(:id => previous).first)
        else
          @current_gallery_entry.move_to_root
        end
      else
        @current_gallery_entry.update_attribute(:position, index)
      end

      if hash['children'].present?
        update_child_positions(hash, @current_gallery_entry)
      end

      previous = moved_item_id
    end

    GalleryEntry.rebuild! if GalleryEntry.respond_to?(:rebuild!)
    render :nothing => true
  end

  def update_child_positions(node, gallery_entry)
    0.upto(node['children'].length - 1) do |child_index|
      child = node['children'][child_index.to_s]
      child_id = child['id'].split('gallery_entry_').last
      child_gallery_entry = GalleryEntry.where(:id => child_id).first
      child_gallery_entry.move_to_child_of(gallery_entry)

      if child['children'].present?
        update_child_positions(child, child_gallery_entry)
      end
    end
  end  
end
