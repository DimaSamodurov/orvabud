Given /^I have no gallery_entries$/ do
  GalleryEntry.delete_all
end

Given /^I (only )?have gallery_entries titled "?([^\"]*)"?$/ do |only, titles|
  GalleryEntry.delete_all if only
  titles.split(', ').each do |title|
    GalleryEntry.create(:title => title)
  end
end

Then /^I should have ([0-9]+) gallery_entr[y|ies]+?$/ do |count|
  GalleryEntry.count.should == count.to_i
end
