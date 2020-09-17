# -------------------------------------------------------------------------
# Copyright (c) 2020, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
# -------------------------------------------------------------------------

class Wso2ad100 < Formula
    desc "WSO2 Analytics Dashboard 1.0.0"
    homepage "https://docs.wso2.com/display/SP440"
    url "https://dl.bintray.com/wso2/binary/wso2ad-brew-1.0.0.zip"
    sha256 "4bb09c16b25601d47563c64bd0e7fbe4bbc3dd41ef66fa557895b94f619e314c"

    bottle :unneeded

    depends_on :java => "11"

    def check_wsl_acceptance()
        notread = true
        puts "\nIMPORTANT – READ CAREFULLY:"
        puts "PLEASE REFER THE SOFTWARE LICENSE [https://wso2.com/license/wso2-update/LICENSE.txt] CAREFULLY BEFORE COMPLETING THE INSTALLATION PROCESS AND USING THE SOFTWARE."
        while notread
          print "Do you agree with the WSO2 SOFTWARE LICENSE AGREEMENT ? [Y/n]: "
          ans = STDIN.gets.chomp
          if ( ans == 'y' || ans == 'Y' )
              notread = false
              puts "\nContinuing with the installment"
          elsif ( ans == 'n' || ans == 'N'  )
              notread = false
              puts "\nInstallation Aborted !"
              exit(0)
          else
              puts "\nPlease enter Y if you agrees with EULA. Otherwise enter N"
              notread = true
          end
        end
    end

    def install
        product = "wso2ad"
        version = "1.0.0"

        check_wsl_acceptance()

        puts "Installing WSO2 Analytics Dashboard #{version}..."
        bin.install "bin/#{product}-#{version}-portal" => "#{product}-#{version}-portal"
        bin.install "bin/#{product}-#{version}-monitor" => "#{product}-#{version}-monitor"

        libexec.install Dir["*"]
        bin.env_script_all_files(libexec/"bin", Language::Java.java_home_env("11"))

        puts "Installation is completed."
        puts "IMPORTANT: After WSO2 Analytics Dashboard #{version} is successfully installed, Instigate any improvements on top of a released WSO2 product version by running the Updates tool."
        puts "\nRun the following command to update the WSO2 Analytics Dashboard #{version}.\n"
        puts "\t/usr/local/Cellar/#{product}-#{version}/#{version}/libexec/bin/update_darwin"
        puts "\nRun the following commands to start the WSO2 Analytics Dashboard #{version}.\n"
        puts "\tPortal: #{product}-#{version}-portal"
        puts "\tMonitoring: #{product}-#{version}-monitor"
        puts "\ncheers!!"
    end

end