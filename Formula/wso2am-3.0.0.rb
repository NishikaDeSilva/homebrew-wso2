class Wso2am300 < Formula
  desc "WSO2 API Manager 3.0.0"
  homepage "https://wso2.com/api-management/"
  url "https://dl.bintray.com/wso2/binary/wso2am-3.0.0.zip"
  sha256 "80dd6eaf9704eb77f2cba3805113aa40120500e3e31cd0592d89473a65ab0ab2"

  bottle :unneeded

  depends_on :java => "1.8"

  def check_eula_acceptance()
    notread = true
    puts "\nIMPORTANT – READ CAREFULLY:"
    puts "PLEASE REFER THE SOFTWARE LICENSE [https://wso2.com/license/wso2-update/LICENSE.txt] CAREFULLY BEFORE COMPLETING THE INSTALLATION PROCESS AND USING THE SOFTWARE."
    while notread
      print "Do you agree with the WSO2 SOFTWARE LICENSE AGREEMENT? "
      ans = STDIN.gets.chomp
      if ( ans == 'y' || ans == 'Y' )
          notread = false
          puts "\nCotinuing with the installment"
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
    product = "wso2am"
    version = "3.0.0"

    check_eula_acceptance()

    puts "Installing WSO2 API Manager #{version}..."
    bin.install "bin/#{product}-#{version}" => "#{product}-#{version}"
    libexec.install Dir["*"]
    bin.env_script_all_files(libexec/"bin", Language::Java.java_home_env("1.8"))

    puts "Installation is completed."
    puts "\nRun #{product}-#{version} to start WSO2 API Manager #{version}."
    puts "\ncheers!!"
  end
end
