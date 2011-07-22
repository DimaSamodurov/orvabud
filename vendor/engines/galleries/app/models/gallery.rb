class Gallery < ActiveRecord::Base

  acts_as_indexed :fields => [:description]

  validates :description, :presence => true, :uniqueness => true
  
  belongs_to :image
end
