
WAIT_TIMEOUT = (ENV['WAIT_TIMEOUT'] || 30).to_f
STEP_PAUSE = (ENV['STEP_PAUSE'] || 0.5).to_f

require 'calabash-perfecto/steps/additions_manual_steps'
require 'calabash-perfecto/steps/app_steps'
require 'calabash-perfecto/steps/assert_steps'
require 'calabash-perfecto/steps/check_box_steps'
require 'calabash-perfecto/steps/context_menu_steps'
require 'calabash-perfecto/steps/date_picker_steps'
require 'calabash-perfecto/steps/enter_text_steps'
require 'calabash-perfecto/steps/location_steps'
require 'calabash-perfecto/steps/navigation_steps'
require 'calabash-perfecto/steps/press_button_steps'
require 'calabash-perfecto/steps/progress_steps'
require 'calabash-perfecto/steps/rotation_steps'
require 'calabash-perfecto/steps/screenshot_steps'
require 'calabash-perfecto/steps/search_steps'
require 'calabash-perfecto/steps/spinner_steps'
require 'calabash-perfecto/steps/time_picker_steps'
require 'calabash-perfecto/steps/list_steps'

require 'calabash-perfecto/steps/calabash_ios_steps'
