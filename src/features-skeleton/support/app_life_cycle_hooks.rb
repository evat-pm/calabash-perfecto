
# Default is to use calabash-android, otherwise this env var is set by the calabash-perfecto binary 
if ENV["CALABASH_MODE"] == nil
  ENV["CALABASH_MODE"] = 'calabash-android'
end 

require ENV["CALABASH_MODE"]+'/management/adb'
require ENV["CALABASH_MODE"]+'/operations'
  
if ENV["CALABASH_MODE"] == 'calabash-perfecto'
  require ENV["CALABASH_MODE"]+'/perfectoHelper'
end 
  


Before do |scenario|
  if ENV["CALABASH_MODE"] == 'calabash-perfecto'    
    beforePerfecto
  end
  if ENV["CALABASH_MODE"] == 'calabash-android'   
    start_test_server_in_background
  end
end

After do |scenario|
  if ENV["CALABASH_MODE"] == 'calabash-perfecto'    
    afterPerfecto
  end
 
  if ENV["CALABASH_MODE"] == 'calabash-android'    
    if scenario.failed?
      screenshot_embed
    end
    shutdown_test_server
  end

  
end
