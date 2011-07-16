require 'formula'

class GtkEnginesEquinox < Formula
  url 'http://gnome-look.org/CONTENT/content-files/121881-equinox-1.50.tar.gz'
  homepage ''
  md5 'f5ab68e50e128ee5186265b80d5cf1bd'
  version '1.50'

  def options
    [
      ['--disable-animation', 'compiles equinox without animation support']
    ]
  end
  
  def install
    arguments =  %W{ --prefix=#{prefix} }
    arguments << '--enable-animation' unless ARGV.include? '--disable-animation'
    arguments << '--disable-dependency-tracking'
    arguments << '--disable-debug'
    
    system './configure', *arguments
    chmod 0744, 'install-sh'
    system 'make install'    
  end
  
  def caveats; <<-EOS.gsub(/^\s+/,'')
    Because of the way GTK+ is installed right now, you need to set the
    following environment variables for engines (and themes) to be picked
    up by GTK applications:
    
    GTK_EXE_PREFIX=`brew --prefix`
    GTK_DATA_PREFIX=`brew --prefix`
    EOS
  end

end
