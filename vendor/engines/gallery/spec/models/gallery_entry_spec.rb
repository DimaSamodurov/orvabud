require 'spec_helper'

describe GalleryEntry do

  def reset_gallery_entry(options = {})
    @valid_attributes = {
      :id => 1,
      :title => "RSpec is great for testing too"
    }

    @gallery_entry.destroy! if @gallery_entry
    @gallery_entry = GalleryEntry.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_gallery_entry
  end

  context "validations" do
    
    it "rejects empty title" do
      GalleryEntry.new(@valid_attributes.merge(:title => "")).should_not be_valid
    end

    it "rejects non unique title" do
      # as one gets created before each spec by reset_gallery_entry
      GalleryEntry.new(@valid_attributes).should_not be_valid
    end
    
  end

end