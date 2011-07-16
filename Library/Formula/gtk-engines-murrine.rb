require 'formula'

class GtkEnginesMurrine < Formula
  url 'http://ftp.acc.umu.se/pub/GNOME/sources/murrine/0.98/murrine-0.98.1.1.tar.bz2'
  homepage 'http://www.cimitan.com/murrine/engine'
  md5 'ea2eeb5f83b0b9d730e7f49693a77bcc'
  version '0.98.1.1'
  
  depends_on 'intltool'
  depends_on 'pixman'
  depends_on 'gtk+'

  def options
    [
      ['--disable-animation', 'compile murrine without animation support'],
      ['--disable-rgba', 'compile murrine without rgba support']      
    ]
  end
  
  def install
    arguments =  %W{--prefix=#{prefix}}
    arguments << '--enable-animation' unless ARGV.include? '--disable-animation'
    arguments << '--disable-rgba' if ARGV.include? '--disable-rgba'
    
    ENV['LIBS'] = '-lpixman-1.0'
    
    system './configure', *arguments
    system 'make install'
  end
end
