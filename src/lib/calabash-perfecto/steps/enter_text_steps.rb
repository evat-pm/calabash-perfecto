Then /^I enter "([^\"]*)" as "([^\"]*)"$/ do |text, target|
  PM_enter_text_to_field_by_name(text,target)
end


Then /^I enter "([^\"]*)" into (?:input|text) field number (\d+)$/ do |text, index|
#Then /^I enter "([^\"]*)" into input field number (\d+)$/ do |text, number|
  PM_enter_text_to_field_by_num(text,index)
end

Then /^I enter "([^\"]*)" into "([^\"]*)"$/ do |text, name|
  PM_enter_text_to_field_by_name(text,name)
end

Then /^I enter text "([^\"]*)" into field with id "([^\"]*)"$/ do |text, view_id|
  PM_enter_text_to_field_by_id(text,view_id)
end


Then /^I clear "([^\"]*)"$/ do |name|
  PM_enter_text_to_field_by_name("",name)
end

Then /^I clear (?:input|text) field number (\d+)$/ do |index|
  PM_enter_text_to_field_by_num("",index)
end

Then /^I clear input field with id "([^\"]*)"$/ do |view_id|
  PM_enter_text_to_field_by_id("",view_id)
end

