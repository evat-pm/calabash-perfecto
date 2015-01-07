
WAIT_TIMEOUT = (ENV['WAIT_TIMEOUT'] || 30).to_f
STEP_PAUSE = (ENV['STEP_PAUSE'] || 0.5).to_f

require 'calabash-perfectomobile/steps/additions_manual_steps'
require 'calabash-perfectomobile/steps/app_steps'
require 'calabash-perfectomobile/steps/assert_steps'
require 'calabash-perfectomobile/steps/check_box_steps'
require 'calabash-perfectomobile/steps/context_menu_steps'
require 'calabash-perfectomobile/steps/date_picker_steps'
require 'calabash-perfectomobile/steps/enter_text_steps'
require 'calabash-perfectomobile/steps/location_steps'
require 'calabash-perfectomobile/steps/navigation_steps'
require 'calabash-perfectomobile/steps/press_button_steps'
require 'calabash-perfectomobile/steps/progress_steps'
require 'calabash-perfectomobile/steps/rotation_steps'
require 'calabash-perfectomobile/steps/screenshot_steps'
require 'calabash-perfectomobile/steps/search_steps'
require 'calabash-perfectomobile/steps/spinner_steps'
require 'calabash-perfectomobile/steps/time_picker_steps'
require 'calabash-perfectomobile/steps/list_steps'

require 'calabash-perfectomobile/steps/calabash_ios_steps'
