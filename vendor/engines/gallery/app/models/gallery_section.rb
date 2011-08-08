class GallerySection < ActiveRecord::Base

  acts_as_indexed :fields => [:name]

  has_many :gallery_entries, :order => 'position'

  default_scope order('position')
end
