
# Default is to use calabash-android, otherwise this env var is set by the calabash-perfectomobile binary 
if ENV["CALABASH_MODE"] == nil
  ENV["CALABASH_MODE"] = 'calabash-android'
end 

require ENV["CALABASH_MODE"]+'/cucumber'
  
## Perfecto Mobile Parameters 
# All of which may be overriden by :
# - environment variables 
# - command line arguments

# Default app file (for installing the app on the device)
#$PMAppFile = "<APK_OR_IPA_FILE>"
# Application name (for starting the app)
#$PMAppName = "<YOUR_APP_NAME>"
# Where to upload the apk/ipa file to (directory in repository)
$PMUploadLocation = "PUBLIC:calabash"

# Connection credentials 
#$PMCloud = "<YOUR_PM_CLOUD_HERE>"
#$PMUser = "<YOUR_PM_CLOUD_USER_HERE>"
#$PMPassword= "<YOUR_PM_CLOUD_PASSWORD_HERE>"
#$PMDevice = "<YOUR_PM_DEVICE_ID_HERE>"

# Should the app be re-installed before running the tests (feature file/s) ?
#$PMReinstallBeforeTests = false
# In case that $PMReinstallBeforeTests is true (or you passed -i in the command line)
# - Should the app be re-installed before running each scenario ?
$PMReinstallBetweenScenarios = false

# Directory where reports should be downloaded to
#$PMReportDir = "<YOUR_REPORT_DIR>"

# Default timeout for commands 
$defaultTimeout=2
