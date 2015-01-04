 require 'calabash-perfecto/PerfectoActions'
 
# This flag will be raised after first install
$PerfectoInstallFlag = false 

# This flag will be raised after params have already been loaded
$PerfectoLoadedParamsFlag = false 

 def beforePerfecto()
 
   debug( "***********beforePerfecto() ")
   
   getPerfectoParams
 
   # Before Perfecto
   # connect to the cloud and start execution ( get execID)
   startPerfectoMobileCloud
         
   #puts "##   openDevice" 
   openDevice

   #puts "##   installAP" 
   installPerfecto
   
    #puts "##  startApp"
   startApp
   
  end


def afterPerfecto()
  
    puts "Closing device ... "
    runCommand("handset","close","",true)

    urlStr=  "https://#{$PerfectoCloud}/services/executions/#{@runID}?user=#{$PerfectoUser}&password=#{$PerfectoPassword}&operation=end"
    uri = URI.parse ("#{urlStr}")
         
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
  

  def getPerfectoParams
    debug ("Getting params ...")
    # If not yet loaded parameters - load now
    if !$PerfectoLoadedParamsFlag 
      # Install on every test ?
      if ENV["PERFECTO_PARAM_INSTALL"] != nil
        $PerfectoReinstallEveryTest = true      
      end
      if ENV["PERFECTO_PARAM_APPNAME"] != nil
        $PerfectoAppName = ENV["PERFECTO_PARAM_APPNAME"]
      end
      if ENV["PERFECTO_UPLOAD_LOCATION"] != nil
        $PerfectoUploadLocation = ENV["PERFECTO_UPLOAD_LOCATION"]
      end
      if ENV["PERFECTO_PARAM_CLOUD"] != nil
        $PerfectoCloud = ENV["PERFECTO_PARAM_CLOUD"]
      end
      if ENV["PERFECTO_PARAM_USER"] != nil
        $PerfectoUser = ENV["PERFECTO_PARAM_USER"]
      end
      if ENV["PERFECTO_PARAM_PASSWORD"] != nil
        $PerfectoPassword = ENV["PERFECTO_PARAM_PASSWORD"]
      end
      if ENV["PERFECTO_PARAM_DEVICE"] != nil
        $PerfectoDevice = ENV["PERFECTO_PARAM_DEVICE"]
      end
      if ENV["PERFECTO_REPORT_DIR"] != nil
        $PerfectoReportDir = ENV["PERFECTO_REPORT_DIR"]
      end
      # path to apk/iap file
      $PerfectoAppFile = ENV["PERFECTO_APP_FILE"]
      # Done loading params - don't do it again
      $PerfectoLoadedParamsFlag = true;
    end
 end
  
 def installPerfecto
   # User requests to reinstall each scenario --> set value of install flag to false
   if $PerfectoReinstallEveryTest
     $PerfectoInstallFlag = false;
   end
  
   # User requests to install and install had not yet been performed --> install
   if !$PerfectoInstallFlag and $PerfectoReinstallEveryTest
     upload_and_install_app($PerfectoAppFile)
     $PerfectoInstallFlag = true;
   end
 end
  
  def upload_and_install_app(file) 
    
    puts "Uninstalling ..."
    # Do not raise error because application may not be installed
    encodedAppName = CGI.escape("#{$PerfectoAppName}") 
    runCommand("application", "uninstall", "&param.name=#{encodedAppName}" , false)
   
    puts "Uploading ..."
    # UPLOAD
    # TODO - file name + apk/ipa 
    appFileNoPath = getAppFileNoPath(file)
    encodedAppFileNoPath = URI::encode(appFileNoPath) 
    encodedKey = "#{$PerfectoUploadLocation}/"+encodedAppFileNoPath
    debug( "Uploading to "+encodedKey) 
    url = "https://#{$PerfectoCloud}/services/repositories/media/#{encodedKey}?operation=upload&user=#{$PerfectoUser}&password=#{$PerfectoPassword}&overwrite=true";
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
    runCommand("application", "install", "&param.instrument=noinstrument&param.file=" + encodedKey , true)
    # Close perfecto and execution
    puts "Install  successful"
    sleep(5)
  end
  
  def getAppFileNoPath(file)
    fileparts = file.split("\\")
    return fileparts.last
  end
  
def downloadReport
  downloadRep = "https://#{$PerfectoCloud}/services/reports/#{@repID}?operation=download&user=#{$PerfectoUser}&password=#{$PerfectoPassword}&format=pdf";
  debug("Download report repID:#{@repID}")
  repSuffix = @repID.split("/").last
  repSuffix = repSuffix.split(".").first
  reportFile = "#{$PerfectoReportDir}\\pmRep_#{repSuffix}.pdf" 
  debug("Download report repID:#{@repID} to #{reportFile}")
  require 'open-uri'
  open(reportFile, 'wb') do |file|
    file << open("#{downloadRep}").read
  end
end  
