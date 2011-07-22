module NavigationHelpers
  module Refinery
    module Galleries
      def path_to(page_name)
        case page_name
        when /the list of galleries/
          admin_galleries_path

         when /the new gallery form/
          new_admin_gallery_path
        when /the list of sections/
          admin_sections_path

         when /the new section form/
          new_admin_section_path
        when /the list of images/
          admin_images_path

         when /the new image form/
          new_admin_image_path
        else
          nil
        end
      end
    end
  end
end
