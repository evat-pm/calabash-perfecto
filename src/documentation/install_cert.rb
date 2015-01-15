require 'net/http'
 	
# create a path to the file "C:\temp\cacert.pem"
cacert_file = File.join(%w{C: temp cacert.pem})
 
Net::HTTP.start("curl.haxx.se") do |http|
  resp = http.get("/ca/cacert.pem")
  if resp.code == "200"
    open(cacert_file, "wb") { |file| file.write(resp.body) }
    puts "\n\nTo complete this step (assuming your ruby installation is in <RUBY_DIRECTORY> ) :"
    puts "- copy c:\\temp\\cacert.pem file to <RUBY_DIRECTORY>\\cacert.pem\n"
    puts "- set SSL_CERT_FILE to <RUBY_DIRECTORY>\\cacert.pem"
    puts "* To make this a permanent setting, add it to Environment Variables"
    puts "  under Control Panel -> Advanced -> Environment Variables"
  else
    abort "\n\n>>>> A cacert.pem bundle could not be downloaded."
  end
end
