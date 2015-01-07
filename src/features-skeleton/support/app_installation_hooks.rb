# Default is to use calabash-android, otherwise this env var is set by the calabash-perfectomobile binary 
if ENV["CALABASH_MODE"] == nil
  ENV["CALABASH_MODE"] = 'calabash-android'
end 

require ENV["CALABASH_MODE"]+'/management/app_installation'

if ENV["CALABASH_MODE"] == 'calabash-perfectomobile'
  require ENV["CALABASH_MODE"]+'/perfectomobile_helper'
end 
  

AfterConfiguration do |config|
	FeatureNameMemory.feature_name = nil
end

Before do |scenario|
  @scenario_is_outline = (scenario.class == Cucumber::Ast::OutlineTable::ExampleRow)
  if @scenario_is_outline 
    scenario = scenario.scenario_outline 
  end 

  feature_name = scenario.feature.title
  if FeatureNameMemory.feature_name != feature_name \
      or ENV["RESET_BETWEEN_SCENARIOS"] == "1"
    if ENV["RESET_BETWEEN_SCENARIOS"] == "1"
      log "New scenario - reinstalling apps"
    else
      log "First scenario in feature - reinstalling apps"
    end
    
    
   ##################################################
   # If using calabash-android on local device
   ##################################################
     
    if ENV["CALABASH_MODE"] == 'calabash-android'    
        uninstall_apps
        install_app(ENV["TEST_APP_PATH"])
        install_app(ENV["APP_PATH"])
    end
    
  
    FeatureNameMemory.feature_name = feature_name
	FeatureNameMemory.invocation = 1
  else
    FeatureNameMemory.invocation += 1
  end
end

FeatureNameMemory = Class.new
class << FeatureNameMemory
  @feature_name = nil
  attr_accessor :feature_name, :invocation
end
