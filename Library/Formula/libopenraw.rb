require 'formula'

class Libopenraw < Formula
  url 'http://libopenraw.freedesktop.org/download/libopenraw-0.0.8.tar.gz'
  homepage 'http://libopenraw.freedesktop.org/'
  md5 'fc26f146586a4b601326130bce6ffd88'

  depends_on 'boost'
  depends_on 'gtk+'
  
  def patches
    # fixes gdk-pixbuf path, skips demo
    DATA
  end
  
  def install
    opts = %W{
      --disable-debug --disable-dependency-tracking --prefix=#{prefix}
    }
    system './configure', *opts
    system 'make install'
  end
end
__END__
diff --git a/Makefile.in b/Makefile.in
index e6b2247..e1dfc63 100644
--- a/Makefile.in
+++ b/Makefile.in
@@ -223,7 +223,7 @@ top_build_prefix = @top_build_prefix@
 top_builddir = @top_builddir@
 top_srcdir = @top_srcdir@
 ACLOCAL_AMFLAGS = -I m4
-SUBDIRS = lib gnome doc test testsuite demo tools include
+SUBDIRS = lib gnome doc test tools include
 all: config.h
 	$(MAKE) $(AM_MAKEFLAGS) all-recursive
 
diff --git a/configure b/configure
index 879e554..d6c396a 100755
--- a/configure
+++ b/configure
@@ -17568,7 +17568,7 @@ cat >>confdefs.h <<\_ACEOF
 _ACEOF
 
 		      GTK_VERSION=`$PKG_CONFIG --variable=gtk_binary_version gtk+-2.0`
-		      GDK_PIXBUF_DIR="gtk-2.0/$GTK_VERSION/loaders"
+		      GDK_PIXBUF_DIR="gdk-pixbuf-2.0/$GTK_VERSION/loaders"
 
 		      HAVE_LIBGDKPIXBUF=yes
 fi

