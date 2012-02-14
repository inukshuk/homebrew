require 'formula'

class ZendFramework < Formula
  url 'http://framework.zend.com/releases/ZendFramework-1.11.8/ZendFramework-1.11.8.tar.gz'
  homepage 'http://framework.zend.com/'
  md5 '7dbc1d8fa891b04651e2038b0af08bea'
  version '1.11.8'

  depends_on 'php'

  def install
    prefix.install Dir['*']
    rm "#{bin}/zf.bat"
    mv "#{bin}/zf.sh", "#{bin}/zf"
    chmod 0644, "#{bin}/zf"
    inreplace "#{bin}/zf" do |s|
      s.gsub! /^\s*SELF_LINK_TMP=.*while.*done\s*$/m, ''
    end
    chmod 0444, "#{bin}/zf"
  end

  def caveats; <<-EOS
If this is your first install, you might want to add
#{prefix}/library to the include_path in your
#{etc}/php.ini:

include_path = ".:#{prefix}/library

If you want to use the extra Zend extra components
you might want to add #{prefix}/extras/library
too:

include_path = ".:#{prefix}/library:#{prefix}/extra/library"
    EOS
  end

end
