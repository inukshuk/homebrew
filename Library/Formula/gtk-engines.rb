require 'formula'

class GtkEngines < Formula
  url 'http://ftp.gnome.org/pub/gnome/sources/gtk-engines/2.20/gtk-engines-2.20.2.tar.bz2'
  homepage 'http://www.gnome.org'
  md5 '5deb287bc6075dc21812130604c7dc4f'
  version '2.20.2'

  depends_on 'gtk+'

  def options
    [
      ['--disable-clearlooks', 'skips clearlooks engine/theme'],
      ['--disable-industrial', 'skips industrial engine/theme'],
      ['--disable-mist', 'skips mist engine/theme'],
      ['--disable-crux', 'skips crux engine/theme'],
      ['--disable-glide', 'skips glide engine'],
      ['--disable-hc', 'skips high contrast engine/theme'],
      ['--disable-redmond', 'skips redmont engine/theme'],
      ['--disable-thinice', 'skips thinice engine/theme'],
      ['--disable-animation', 'complies clearlooks without animation support']
    ]
  end

  def install
    arguments =  %W{--prefix=#{prefix}}
    arguments << '--enable-animation' unless ARGV.include? '--disable-animation'
    arguments << '--disable-dependency-tracking'

    %w{ clearlooks industrial mist crux glide hc redmond thinice animation }.each do |engine|
      arguments << "--disable-#{engine}" if ARGV.include? "--disable-#{engine}"
    end

    system './configure', *arguments
    system "make install"
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
