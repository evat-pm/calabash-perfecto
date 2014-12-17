Given /^(my|the) app is running$/ do |_|
  #no-op exists for backwards compatibility
end


# Moved to progress_steps
#Then /^I wait to see "([^\"]*)"$/ do |expected_mark|
#Then /^I wait for "([^\"]*)" to appear$/ do |name|
#Then /^I wait for the "([^\"]*)" button to appear$/ do |name|
#Then /^I wait$/ do
#When /^I wait for ([\d\.]+) second(?:s)?$/ do |num_seconds|

# Moved to press_button_steps
#Then /^I (?:press|touch) button number (\d+)$/ do |index|
#Then /^I (?:press|touch) the "([^\"]*)" button$/ do |name|
#Then /^I (?:press|touch) list item number (\d+)$/ do |index|
#Then /^I (?:press|touch) "([^\"]*)"$/ do |name|


# Moved to enter_text_steps.rb
#Then /^I enter "([^\"]*)" into (?:input|text) field number (\d+)$/ do |text, index|
#Then /^I clear (?:input|text) field number (\d+)$/ do |index|

# Moved to navigation steps
#Then /^I go back$/ do
#Then /^I swipe (left|right|up|down)$/ do |dir|
#Then /^I scroll (left|right|up|down)$/ do |dir|

# Moved to screenshot_steps
#Then /^(?:I\s)?take (?:picture|screenshot)$/ do

# Moved to assert steps
#Then /^I should see "([^\"]*)"$/ do |expected_mark|

# -- Touch --#
Then /^I (?:press|touch) on screen (\d+) from the left and (\d+) from the top$/ do |x, y|
  PM_click_on_screen(x,y)
end

Then /^I (?:press|touch) (\d+)% right and (\d+)% down from "([^\"]*)" $/ do |x,y,name|
  raise "This step is not yet implemented on iOS"
end


Then /^I (?:press|touch) (?:input|text) field number (\d+)$/ do |index|
  # Perfecto gives error when trying to "click" a text field
  PM_unsupported()
end


Then /^I (?:press|touch) the "([^\"]*)" (?:input|text) field$/ do |name|
  # Perfecto gives error when trying to "click" a text field
  PM_unsupported()
end

#Note in tables views: this means visible cell index!

Then /^I (?:press|touch) list item "([^\"]*)"$/ do |cell_name|
  PM_unsupported()
end

Then /^I toggle the switch$/ do
  PM_toggle_switch_by_num(1)
end

Then /^I toggle the "([^\"]*)" switch$/ do |name|
  PM_toggle_switch_by_name(name)
end

Then /^I touch (?:the)? user location$/ do
  PM_unsupported()
end

Then /^I (?:touch|press) (?:done|search)$/ do
  PM_unsupported()
end


## -- Entering text -- ##

Then /^I enter "([^\"]*)" into the "([^\"]*)" field$/ do |text_to_type, field_name|
  PM_enter_text_to_field_by_name(text_to_type,field_name)
end

Then /^I enter "([^\"]*)" into the "([^\"]*)" (?:text|input) field$/ do |text_to_type, field_name|
  PM_enter_text_to_field_by_name(text_to_type,field_name)
end

# alias
Then /^I fill in "([^\"]*)" with "([^\"]*)"$/ do |text_field, text_to_type|
  PM_unsupported()
end

Then /^I use the native keyboard to enter "([^\"]*)" into the "([^\"]*)" (?:text|input) field$/ do |text_to_type, field_name|
  PM_unsupported()
end

Then /^I fill in text fields as follows:$/ do |table|
  PM_unsupported()
end

Then /^I use the native keyboard to enter "([^\"]*)" into (?:input|text) field number (\d+)$/ do |text_to_type, index|
  PM_unsupported()
end

When /^I clear "([^\"]*)"$/ do |name|
  PM_unsupported()
  # msg = "When I clear <name>' will be deprecated because it is ambiguous - what should be cleared?"
end

# -- See -- #

Then /^I wait until I don't see "([^\"]*)"$/ do |expected_mark|
  PM_validate_by_text_obj(expected_mark,false,0)
end

Then /^I wait to not see "([^\"]*)"$/ do |expected_mark|
  PM_validate_by_text_obj(expected_mark,false,0)
end

Then /^I wait to see a navigation bar titled "([^\"]*)"$/ do |expected_mark|
  PM_unsupported()
end

Then /^I wait for the "([^\"]*)" (?:input|text) field$/ do |placeholder_or_view_mark|
  PM_unsupported()
end

Then /^I wait for (\d+) (?:input|text) field(?:s)?$/ do |count|
  PM_unsupported()
end

Then /^I wait and wait$/ do
  PM_wait(4)
end

Then /^I wait and wait and wait...$/ do
  PM_wait(10)
end


Then /^I swipe (left|right|up|down) on number (\d+)$/ do |dir, index|
  PM_unsupported()
end

Then /^I swipe (left|right|up|down) on number (\d+) at x (\d+) and y (\d+)$/ do |dir, index, x, y|
  PM_unsupported()
end

Then /^I swipe (left|right|up|down) on "([^\"]*)"$/ do |dir, mark|
  PM_unsupported()
end

Then /^I swipe on cell number (\d+)$/ do |index|
  PM_unsupported()
end


##pinch##
Then /^I pinch to zoom (in|out)$/ do |in_out|
  PM_unsupported()
end

Then /^I pinch to zoom (in|out) on "([^\"]*)"$/ do |in_out, name|
  PM_unsupported()
end


Then /^I scroll (left|right|up|down) on "([^\"]*)"$/ do |dir,name|
  PM_unsupported()
end



### Playback ###
Then /^I playback recording "([^\"]*)"$/ do |filename|
  PM_unsupported()
end

Then /^I playback recording "([^\"]*)" on "([^\"]*)"$/ do |filename, name|
  PM_unsupported()
end

Then /^I playback recording "([^\"]*)" on "([^\"]*)" with offset (\d+),(\d+)$/ do |filename, name, x, y|
  PM_unsupported()
end

Then /^I reverse playback recording "([^\"]*)"$/ do |filename|
  PM_unsupported()
end

Then /^I reverse playback recording "([^\"]*)" on "([^\"]*)"$/ do |filename, name|
  PM_unsupported()
end

Then /^I reverse playback recording "([^\"]*)" on "([^\"]*)" with offset (\d+),(\d+)$/ do |filename, name, x, y|
  PM_unsupported()
end


### Device orientation ###
Then /^I rotate device (left|right)$/ do |dir|
  PM_unsupported()
end

Then /^I send app to background for (\d+) seconds$/ do |secs|
  PM_unsupported()
end

### Assertions ###


Then /^I should see a "([^\"]*)" button$/ do |expected_mark|
  PM_button_find_by_text(expected_mark,true)
end
Then /^I should not see a "([^\"]*)" button$/ do |expected_mark|
  PM_button_find_by_text(expected_mark,false)
end

Then /^I don't see the "([^\"]*)"$/ do |text|
  macro %Q|I should not see "#{text}"|
end

Then /^I see the "([^\"]*)"$/ do |text|
  macro %Q|I should see "#{text}"|
end

Then /^I (?:should)? see text starting with "([^\"]*)"$/ do |text|
  PM_validate_by_text_start(text,true)
end

Then /^I (?:should)? see text ending with "([^\"]*)"$/ do |text|
  PM_validate_by_text_end(text,true)
end

Then /^I see (\d+) (?:input|text) field(?:s)?$/ do |count|
  PM_unsupported()
end

Then /^I should see a "([^\"]*)" (?:input|text) field$/ do |expected_mark|
  PM_validate_textfield_by_name(expected_mark,true)
end

Then /^I should not see a "([^\"]*)" (?:input|text) field$/ do |expected_mark|
  PM_validate_textfield_by_name(expected_mark,false)
end


Then /^I should see a map$/ do
  PM_unsupported()
end

Then /^I should see (?:the)? user location$/ do
  PM_unsupported()
end

### Date Picker ###

# time_str can be in any format that Time can parse
Then(/^I change the date picker time to "([^"]*)"$/) do |time_str|
  PM_unsupported()
end

# date_str can be in any format that Date can parse
Then(/^I change the date picker date to "([^"]*)"$/) do |date_str|
  PM_unsupported()
end

# date_str can be in any format that Date can parse
Then(/^I change the date picker date to "([^"]*)" at "([^"]*)"$/) do |date_str, time_str|
  PM_unsupported()
end
