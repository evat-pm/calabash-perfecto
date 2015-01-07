Then /^I (?:press|touch) the "([^\"]*)" button$/ do |name|
#Then /^I press the "([^\"]*)" button$/ do |buttonText|
  PM_button_click_by_text(name)
end

Then /^I (?:press|touch) button number (\d+)$/ do |index|
#Then /^I press button number (\d+)$/ do |buttonNumber|
  PM_button_click_by_number(index)
end

Then /^I press image button number (\d+)$/ do |buttonNumber|
  PM_image_button_click_by_number(buttonNumber)
end

Then /^I press view with id "([^\"]*)"$/ do |view_id|
  PM_unsupported()
end

Then /^I (?:press|touch) "([^\"]*)"$/ do |name|
#Then /^I press "([^\"]*)"$/ do |identifier|
  PM_element_click_by_id(name)
end

Then /^I click on screen (\d+)% from the left and (\d+)% from the top$/ do |x, y|
  PM_click_on_screen(x,y)
end

Then /^I touch the "([^\"]*)" text$/ do |text|
  PM_obj_click_by_text(text)
end

Then /^I (?:press|touch) list item number (\d+)$/ do |index|
#Then /^I press list item number (\d+)$/ do |line_index|
  PM_unsupported()
end

Then /^I long press list item number (\d+)$/ do |line_index|
  PM_unsupported()
end

Then(/^I select "(.*?)" radio button$/) do |text|
   PM_radiobutton_click_by_text(text)
end

Then(/^"(.*?)" radio button should be selected$/) do |text|
  PM_radiobutton_verify_is_clicked(text,true)
end


Then(/^"(.*?)" radio button should not be selected$/) do |text|
  PM_radiobutton_verify_is_clicked(text,false)
end
