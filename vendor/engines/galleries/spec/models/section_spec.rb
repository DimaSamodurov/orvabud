require 'spec_helper'

describe Section do

  def reset_section(options = {})
    @valid_attributes = {
      :id => 1,
      :name => "RSpec is great for testing too"
    }

    @section.destroy! if @section
    @section = Section.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_section
  end

  context "validations" do
    
    it "rejects empty name" do
      Section.new(@valid_attributes.merge(:name => "")).should_not be_valid
    end

    it "rejects non unique name" do
      # as one gets created before each spec by reset_section
      Section.new(@valid_attributes).should_not be_valid
    end
    
  end

end