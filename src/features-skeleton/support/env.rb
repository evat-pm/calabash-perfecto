
# Default is to use calabash-android, otherwise this env var is set by the calabash-perfecto binary 
if ENV["CALABASH_MODE"] == nil
  ENV["CALABASH_MODE"] = 'calabash-android'
end 

require ENV["CALABASH_MODE"]+'/cucumber'
  
## Perfecto Parameters 
# All of which may be overriden by :
# - environment variables 
# - command line arguments

# Default app file (for installing the app on the device)
#$PerfectoAppFile = "<APK_OR_IPA_FILE>"
# Application name (for starting the app)
#$PerfectoAppName = "<YOUR_APP_NAME>"
# Where to upload the apk/ipa file to (directory in repository)
$PerfectoUploadLocation = "PUBLIC:calabash"

# Connection credentials 
#$PerfectoCloud = "<YOUR_PERFECTO_CLOUD_HERE>"
#$PerfectoUser = "<YOUR_PERFECTO_CLOUD_USER_HERE>"
#$PerfectoPassword= "<YOUR_PERFECTO_CLOUD_PASSWORD_HERE>"
#$PerfectoDevice = "<YOUR_PERFECTO_DEVICE_ID_HERE>"

# Should the app be re-installed before every scenario ?
$PerfectoReinstallEveryTest = false

# Directory where reports should be downloaded to
$PerfectoReportDir = "<YOUR_REPORT_DIR>"

# Default timeout for commands 
$defaultTimeout=2
