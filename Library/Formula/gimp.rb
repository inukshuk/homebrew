require 'formula'

class Gimp < Formula
  url 'ftp://ftp.gimp.org/pub/gimp/v2.6/gimp-2.6.11.tar.bz2'
  homepage 'http://www.gimp.org/'
  md5 'bb2939fe13e54fc7255cef5d097bb5dd'

  depends_on 'gtk+'
  depends_on 'babl'
  depends_on 'gegl'
  depends_on 'ufraw'
  depends_on 'poppler'
  depends_on 'libexif'
  depends_on 'aalib'
  depends_on 'libwmf'

  def install
    options = %W{
      --disable-debug --disable-dependency-tracking --prefix=#{prefix}
      --disable-python
    }
    
    system './configure', *options
    system 'make install'
  end
end
