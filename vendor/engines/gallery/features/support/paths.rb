module NavigationHelpers
  module Refinery
    module GalleryEntries
      def path_to(page_name)
        case page_name
        when /the list of gallery_entries/
          admin_gallery_entries_path

         when /the new gallery_entry form/
          new_admin_gallery_entry_path
        when /the list of gallery_entries/
          admin_gallery_entries_path

         when /the new gallery_entry form/
          new_admin_gallery_entry_path
        else
          nil
        end
      end
    end
  end
end
