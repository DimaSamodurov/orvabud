Given /^I have no images$/ do
  Image.delete_all
end

Given /^I (only )?have images titled "?([^\"]*)"?$/ do |only, titles|
  Image.delete_all if only
  titles.split(', ').each do |title|
    Image.create(:name => title)
  end
end

Then /^I should have ([0-9]+) images?$/ do |count|
  Image.count.should == count.to_i
end
