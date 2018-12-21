class Flutter < Formula
  require "net/http"
  desc "Homebrew shell for Flutter stable"
  homepage "https://flutter.io"
  url "https://github.com/flutter/flutter.git", :branch => "stable"
  version "1.0.0"
  bottle :unneeded

  def install
    uri = URI("http://www.cip.cc")
    res = Net::HTTP.get_response(uri)
    # Body
    respbody = res.body.force_encoding("utf-8")
    addcn = respbody.include?("中国".force_encoding("utf-8"))
    if addcn == true
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
      If you're located in China, please follow：
        https://github.com/flutter/flutter/wiki/Using-Flutter-in-China

      After installed , please set `PUB_HOSTED_URL` & `FLUTTER_STORAGE_BASE_URL`

      You may wish to add the flutter-ROOT install location to your PATH:
        echo 'export PATH="/usr/local/opt/flutter/bin:$PATH"' >> ~/.zshrc

      Run the following command to see if there are any platform dependencies you need to complete the setup:
        flutter doctor

    EOS
  end

  test do
    system "false"
  end
end
