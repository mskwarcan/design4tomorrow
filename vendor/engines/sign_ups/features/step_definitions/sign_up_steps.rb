Given /^I have no sign_ups$/ do
  SignUp.delete_all
end

Given /^I (only )?have sign_ups titled "?([^\"]*)"?$/ do |only, titles|
  SignUp.delete_all if only
  titles.split(', ').each do |title|
    SignUp.create(:name => title)
  end
end

Then /^I should have ([0-9]+) sign_ups?$/ do |count|
  SignUp.count.should == count.to_i
end
