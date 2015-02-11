Installation
============
### Prerequisites ###
You need to have Ruby, Devkit, and Android SDK installed.

#### Ruby ####

1. Download & Install the latest x64 Ruby version.
If you are on Windows you can get Ruby from [RubyInstaller.org](http://rubyinstaller.org/downloads/).
2.	Create a new **RUBY_HOME** system variable & Update the **Path** System variable
	- Add **RUBY_HOME** system variable, with value pointing to the directory where it has been installed
	- Add **%RUBY_HOME%\bin** to the path system variable
3. Test the Ruby installation and system variables
	- In command line, run `ruby –v`. It should print "ruby 2.1.5" (or higher).

#### Devkit ####
1. Download & Install DevKit from [here](http://rubyinstaller.org/downloads/).
	- Installation instructions can be found [here](https://github.com/oneclick/rubyinstaller/wiki/Development-Kit)
2. Install the trust certificate from [here](https://gist.github.com/luislavena/f064211759ee0f806c88).
	- Test the certificate installation [here](https://github.com/oneclick/rubyinstaller/wiki/Development-Kit#5-test-installation).

### Installation ####

1. Install *calabash-perfectomobile* by running `gem install calabash-perfectomobile`
2. Install the trust certificate 
	- Copy PerfectoMobileCA.pem and install_cert.rb files located in `<RUBY_HOME directory>\lib\ruby\gems\<rubyVersion>\gems\calabash-perfectomobile-<version>\documents`	(also [here](https://github.com/calabash/calabash-perfectomobile/lib/ruby/gems/2.1.0/gems/calabash-perfectomobile-0.1.0))<br/>
	- Save these files into your ssl_certs directory and cd to it
	- Install the certificate by running `ruby install_cert.rb`
	- Set the **SSL\_CERT\_FILE** system variable to `<ssl_certs directory>\PerfectoMobileCA.pem`

:grey_exclamation: Remember to update your existing ***feature*** folders from the ***calabash-perfectomobile*** gem installation ***feature-skeleton*** subfolder (for example, merge your existing ***env.rb*** file with the new one)

Upgrading
---------
1. Uninstall the *calabash-perfectomobile* gem by running <br/>
	`gem uninstall calabash-perfectomobile`
2. Install the new *calabash-perfectomobile* gem by running <br/>
	`gem install calabash-perfectomobile`
