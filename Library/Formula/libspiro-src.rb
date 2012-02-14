require 'formula'

class LibspiroSrc < Formula
  url 'http://switch.dl.sourceforge.net/project/libspiro/libspiro/20071029/libspiro_src-20071029.tar.bz2'
  homepage 'http://www.levien.com/spiro/'
  md5 'ab6aaa50bbd8fa55e78f8b8b0112f6cd'
  version '20071029'

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end
end
