Given /^I have no sections$/ do
  Section.delete_all
end

Given /^I (only )?have sections titled "?([^\"]*)"?$/ do |only, titles|
  Section.delete_all if only
  titles.split(', ').each do |title|
    Section.create(:name => title)
  end
end

Then /^I should have ([0-9]+) sections?$/ do |count|
  Section.count.should == count.to_i
end
