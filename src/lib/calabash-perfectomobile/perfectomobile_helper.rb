 require 'calabash-perfectomobile/perfectomobile_helper'
 
# This flag will be raised after first install
$PMInstallFlag = false 

# This flag will be raised after params have already been loaded
$PMLoadedParamsFlag = false 

 def beforePM()
 
   debug( "***********beforePM() ")
   
   getPMParams
 
   # Before PM
   # connect to the cloud and start execution ( get execID)
   startPMCloud
         
   #puts "##   openDevice" 
   openDevice

   #puts "##   installAP" 
   installPM
   
    #puts "##  startApp"
   startApp
   
  end


def afterPM()
  
    puts "Closing device ... "
    PM_runCommand("handset","close","",true)

    urlStr=  "https://#{$PMCloud}/services/executions/#{@runID}?user=#{$PMUser}&password=#{$PMPassword}&operation=end"
    uri = URI.parse("#{urlStr}")
         
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new uri
       
    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)
      
    val =  response.body
    
    #download rep
    downloadReport
         
end
  

  def getPMParams
    debug ("Getting params ...")
    # If not yet loaded parameters - load now
    if !$PMLoadedParamsFlag 
      # Install on every test ?
      if ENV["CALABASH_PERFECTO_MOBILE_INSTALL"] != nil
        $PMReinstallBeforeTests = true      
      end
      if ENV["CALABASH_PERFECTO_MOBILE_APP_NAME"] != nil
        $PMAppName = ENV["CALABASH_PERFECTO_MOBILE_APP_NAME"]
      end
      if ENV["CALABASH_PERFECTO_MOBILE_UPLOAD_LOCATION"] != nil
        $PMUploadLocation = ENV["CALABASH_PERFECTO_MOBILE_UPLOAD_LOCATION"]
      end
      if ENV["CALABASH_PERFECTO_MOBILE_MOBILECLOUD"] != nil
        $PMCloud = ENV["CALABASH_PERFECTO_MOBILE_MOBILECLOUD"]
      end
      if ENV["CALABASH_PERFECTO_MOBILE_USER"] != nil
        $PMUser = ENV["CALABASH_PERFECTO_MOBILE_USER"]
      end
      if ENV["CALABASH_PERFECTO_MOBILE_PASSWORD"] != nil
        $PMPassword = ENV["CALABASH_PERFECTO_MOBILE_PASSWORD"]
      end
      if ENV["CALABASH_PERFECTO_MOBILE_DEVICE"] != nil
        $PMDevice = ENV["CALABASH_PERFECTO_MOBILE_DEVICE"]
      end
      if ENV["CALABASH_PERFECTO_MOBILE_REPORT_DIR"] != nil
        $PMReportDir = ENV["CALABASH_PERFECTO_MOBILE_REPORT_DIR"]
      end
      # path to apk/iap file
      $PMAppFile = ENV["CALABASH_PERFECTO_MOBILE_APP_FILE"]
      # Done loading params - don't do it again
      $PMLoadedParamsFlag = true;
    end
 end
  
 def installPM
    
   # User requests to install and install had not yet been performed --> install
   if !$PMInstallFlag and $PMReinstallBeforeTests
     upload_and_install_app($PMAppFile)
     # User requests to reinstall each scenario --> set value of install flag to false
     if !$PMReinstallBetweenScenarios
       $PMInstallFlag = true;
     end
   end
 end
  
  def upload_and_install_app(file) 
    
    puts "Uninstalling ..."
    # Do not raise error because application may not be installed
    encodedAppName = CGI.escape("#{$PMAppName}") 
    PM_runCommand("application", "uninstall", "&param.name=#{encodedAppName}" , false)
   
    puts "Uploading ..."
    # UPLOAD
    # TODO - file name + apk/ipa 
    appFileNoPath = getAppFileNoPath(file)
    encodedAppFileNoPath = URI::encode(appFileNoPath) 
    encodedKey = "#{$PMUploadLocation}/"+encodedAppFileNoPath
    debug( "Uploading to "+encodedKey) 
    url = "https://#{$PMCloud}/services/repositories/media/#{encodedKey}?operation=upload&user=#{$PMUser}&password=#{$PMPassword}&overwrite=true";
    debug( url)
     
    uri = URI.parse(url)
    Net::HTTP.start(uri.host, uri.port,:use_ssl => uri.scheme == 'https') do |http|
        request = Net::HTTP::Put.new(uri.request_uri)
        request.body_stream=File.open(file)
        request["Content-Type"] = "multipart/form-data"
        request.add_field('Content-Length', File.size(file))
        response = http.request request # Net::HTTPResponse object
    end

    #INSTALL
    puts "Installing ..."
    PM_runCommand("application", "install", "&param.instrument=noinstrument&param.file=" + encodedKey , true)
    puts "Install completed successfully"
    sleep(5)
  end
  
  def getAppFileNoPath(file)
    fileparts = file.split("\\")
    return fileparts.last
  end
  
def downloadReport
 downloadRep = "https://#{$PMCloud}/services/reports/#{@repID}?operation=download&user=#{$PMUser}&password=#{$PMPassword}&format=pdf";
 debug("Download report repID:#{@repID}")
 repSuffix = @repID.split("/").last
 repSuffix = repSuffix.split(".").first
 if (!$PMReportDir.empty?) and not ($PMReportDir.end_with? "/" or $PMReportDir.end_with? "\\")
  separator = "/"
     if $PMReportDir.include? "\\"
       separator = "\\"
     end
   $PMReportDir = $PMReportDir + separator
 end
 reportFile = "#{$PMReportDir}pmReport_#{repSuffix}.pdf" 
 debug("Download report repID:#{@repID} to #{reportFile}")
 require 'open-uri'
 open(reportFile, 'wb') do |file|
   file << open("#{downloadRep}").read
 end
end
