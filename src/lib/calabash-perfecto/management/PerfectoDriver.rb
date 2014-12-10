#require 'net/http'
#
#
#def initialize
#  # parameters arrive from the env.rb in the project
#      @device = PerfectoDevice
#      @user = PerfectoUser
#      @pass = PerfectoPass
#
#  end
#  
#  def exeID
#    puts     "2 execId #{@runID} ,#{@device} ,#{PerfectoPass} "
#    
#  end
#  
#def PerfectoMap(query, method_name, *method_args)
# 
#   #this function get the parameters from the map and find the Perfecto Command
#  # executed from oprtions.map
#  puts " *** PerfectoMAP *** #{query} **  #{method_name} "
#  
#     for i in 0...method_args.length
#        puts "The parameters are #{method_args[i]}"
#     end
#      
#     ################################33
#     ## MAP  
#     ##################################
#     # query = {text CONTAINS[c] 'Hello World, AndroidDemoProject'} 
#     # in Perfecto ==  validate test
#     #######
#     # query =   touch   method_name=   Button id:'button1' 
#     # perfecto press on the object with id button1
#     # Then I press the Hello button >>> calabsh found the object ID before the MAP
#     ###########\
#     ##  editset  *** touch **  android.widget.EditText id:'user'
#     ##
#     
#   
#     if (query.include? "{text CONTAINS")
#      s =  query.index('\'');
#      e =  query.index('\'',s+1);
#      findSTR = query[s+1..e-1]
#      puts "validate text for  #{findSTR} in Perfecto system "
#  #   pm_rc = validateText(URI::encode(findSTR))  
#  #   pm_rc = JSON.parse(pm_rc)
#  
#   #  get1 = pm_rc['reason']
#   #  get2 = pm_rc['description']
# 
#   #  puts "**got   #{get1} from Perfecto system becouse #{get2}"
# 
#    # raise("find !")
#     return "ok" 
#     end 
#
#  # if return true = the command been executed in PM otherwie will contine to standart calabash process
#  return   "false"   
# end 
#   
#  
#  
#  def startPerfectoMobileCloud  
#      
#    puts "*****************Connect to Perfecto cloud **************************"
#       uri = URI.parse('https://demo.perfectomobile.com/services/executions?user=uzie@perfectomobile.com&password=Perfecto1&operation=start')
#       
#       
#             Net::HTTP.start(uri.host, uri.port,:use_ssl => uri.scheme == 'https') do |http|
#               request = Net::HTTP::Get.new uri
#       
#                 response = http.request request # Net::HTTPResponse object
#                 val =  response.body
#                 matches = val.split(/:" */)[1] 
#                 @runID  = matches.split(/" */)[0]
#                 
#     end
#   
#    end
#
#    def home()
#      runCommand("handset","open","")
#    end
#    
#        
#    def gotoUrl(url)
#      param = "&param.url=#{url}&param.automation=native"
#      runCommand("browser","goto",param)  
#
#      end 
#      
#      
#      def validateText(text)
#        puts " PM VALIDATE TEXT"
#        param = "&param.timeout=20&param.content=#{text}"
#        runCommand("checkpoint","text",param)  
#
#          
#      end
#      
#      def buttonclick(text)
#        param = "&param.label=#{text}"
#        runCommand("button-text","click",param)  
#      end
#
#      def setEditBox(name, text)
#        param = "&param.label=#{name}&param.text=#{text}"
#        runCommand("edit-text","set",param)  
#      end
#
#       def startApp(appName)
#        param = "&param.name=#{appName}"
#        runCommand("application","open",param)  
#      end
#    
#    
#      ## execute all the command
##    def runCommand(command, subcommand, param)
##     execCmd=  "https://demo.perfectomobile.com/services/executions/#{@runID}?user=#{@user}&password=#{@pass}&operation=command&command=#{command}&subcommand=#{subcommand}&param.handsetId=#{@device}#{param}"
##     
##     puts execCmd
##      uri = URI.parse(execCmd)
##      puts "************execCmd #{execCmd}" 
##   
##                  Net::HTTP.start(uri.host, uri.port,:use_ssl => uri.scheme == 'https') do |http|
##                    request = Net::HTTP::Get.new uri
##            
##                      response = http.request request # Net::HTTPResponse object
##                      val =  response.body
##                    # puts "************PM ANSWER #{val}"
##                    return   val     
##
##                  end
##   end
#   
#   ## close the script 
#   def close()
#     runCommand("handset","close","")
#
#     execCmd=  "https://demo.perfectomobile.com/services/executions/#{@runID}?user=#{@user}&password=#{@pass}&operation=end"
#         
#         puts execCmd
#          uri = URI.parse(execCmd)
#                           
#                      Net::HTTP.start(uri.host, uri.port,:use_ssl => uri.scheme == 'https') do |http|
#                        request = Net::HTTP::Get.new uri
#                
#                          response = http.request request # Net::HTTPResponse object
#                          val =  response.body
#                          puts "PM ANSWER #{val}" 
#           
#                      end
#                      
# end
#      
