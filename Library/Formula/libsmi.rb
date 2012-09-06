require 'formula'

class Libsmi < Formula
  url 'ftp://ftp.ibr.cs.tu-bs.de/pub/local/libsmi/libsmi-0.4.8.tar.gz'
  homepage 'http://www.ibr.cs.tu-bs.de/projects/libsmi/'
  sha1 '77c512ccbdd29667d152398b0dcde533aed57b49'

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make install"
  end
end
