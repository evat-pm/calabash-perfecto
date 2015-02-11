# Modified by Perfecto Mobile Ltd.

def calabash_run(app_path = nil)
  
  require 'calabash-perfectomobile/helpers'
  env = ""

  STDOUT.sync = true
  arguments = ARGV - ["--no-build"]
  cmd = "#{RbConfig.ruby} -S cucumber #{arguments.join(" ")} #{env}"
  log cmd
  exit_code = system(cmd)

  sleep(1)
  exit_code
end