require 'formula'

class Crfxx < Formula
  url 'http://downloads.sourceforge.net/project/crfpp/crfpp/0.54/CRF%2B%2B-0.54.tar.gz?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fcrfpp%2Ffiles%2Fcrfpp%2F0.54%2F'
  homepage 'http://crfpp.sourceforge.net/'
  md5 'a3c12c99b25e06d18147d50f0f92e8d3'
  version '0.54'

  def install
    flags = %W{
      --disable-debug --disable-dependency-tracking --prefix=#{prefix}
    }

    system './configure', *flags 
    system 'make install'
  end
end
