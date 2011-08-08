class GalleryEntry < ActiveRecord::Base

  acts_as_indexed :fields => [:title]

  belongs_to :image
  belongs_to :gallery_section

  default_scope order('position')
end
