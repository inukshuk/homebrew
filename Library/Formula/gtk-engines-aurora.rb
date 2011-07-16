require 'formula'

class GtkEnginesAurora < Formula
  url 'http://gnome-look.org/CONTENT/content-files/56438-aurora-1.5.1.tar.bz2'
  homepage ''
  md5 '5eeea57c5938306ad7ccfc7cd71d009d'
  version '1.5.1'

  def options
    [
      ['--disable-animation', 'compiles aurora without animation support']
    ]
  end
  
  def install
    mkdir_p "#{share}/themes"
    system "tar xjf Aurora.tar.bz2 -C #{share}/themes/"

    system 'tar xzf aurora-gtk-engine-1.5.tar.gz'
    cd 'aurora-1.5'
    
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
