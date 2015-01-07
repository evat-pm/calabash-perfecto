# Default is to use calabash-android, otherwise this env var is set by the calabash-perfectomobile binary 
if ENV["CALABASH_MODE"] == nil
  ENV["CALABASH_MODE"] = 'calabash-android'
end 

require ENV["CALABASH_MODE"]+'/calabash_steps'

