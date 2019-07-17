class Flutter < Formula
  require "nokogiri"
  require "open-uri"
  desc "Homebrew shell for Flutter"
  homepage "https://flutter.io"

  stable do
    url "https://github.com/flutter/flutter.git", :branch => "stable"
    version "stable"
  end

  devel do
    url "https://github.com/flutter/flutter.git", :branch => "dev"
    version "dev"
  end

  bottle :unneeded

  def install
    document = Nokogiri::HTML.parse(open("http://www.cip.cc"))
    ipaddress = document.xpath("//div[contains(@class, 'data')]//pre").text.force_encoding("utf-8")
    ipaddress_cn = ipaddress.include?("中国".force_encoding("utf-8"))
    ipaddress_macao = ipaddress.include?("澳门".force_encoding("utf-8"))
    ipaddress_hk = ipaddress.include?("香港".force_encoding("utf-8"))
    ipaddress_taiwan = ipaddress.include?("台湾".force_encoding("utf-8"))

    if (ipaddress_cn == true) && (ipaddress_macao == false) && (ipaddress_hk == false) && (ipaddress_taiwan == false)
      opoo "You are located in China"
      ENV["PUB_HOSTED_URL"] = "https://pub.flutter-io.cn"
      ENV["FLUTTER_STORAGE_BASE_URL"] = "https://storage.flutter-io.cn"
    end

    system "./bin/flutter"
    allfiles = File.join(buildpath, "**", "{*,.*}")
    mv Dir.glob(allfiles), Dir.glob(prefix), :force => true
  end

  def post_install
    rm File.join(HOMEBREW_PREFIX, "bin", "flutter.bat")
    chmod_R "+rwx", File.join(prefix, "bin")
  end

  def caveats
    <<~EOS
      Remove the proxy settings for command-line before you begin.

      Run the following command to install stable channel:
        brew install flutter

      Run the following command to install dev channel:
        brew install --devel flutter

      If you want to change channel,please run the following command:
        brew uninstall --force flutter
        rm -rf "$(brew --cache)/flutter--git"
        brew install (--devel) flutter

      If you're located in China, please follow：
        https://github.com/flutter/flutter/wiki/Using-Flutter-in-China

      After installed , please set `PUB_HOSTED_URL` & `FLUTTER_STORAGE_BASE_URL`

      You may wish to add the flutter-ROOT install location to your PATH:
        echo 'export PATH="/usr/local/opt/flutter/bin:$PATH"' >> ~/.zshrc

      You can use the following command to show flutter version:
        flutter --version

      Run the following command to see if there are any platform dependencies you need to complete the setup:
        flutter doctor

      Run the following command to upgrade flutter:
        brew reinstall (--devel) flutter
    EOS
  end

  test do
    system "false"
  end
end
