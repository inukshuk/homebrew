require 'formula'

class GtkChtheme < Formula
  url 'http://plasmasturm.org/code//gtk-chtheme/gtk-chtheme-0.3.1.tar.bz2'
  homepage 'http://plasmasturm.org/code//gtk-chtheme/'
  md5 'f688053bf26dd6c4f1cd0bf2ee33de2a'
  version '0.3.1'

  depends_on 'gtk+'
  
  def patches
    DATA
  end

  def install
    inreplace 'Metadata', /PREFIX\s+=\s+\/usr/, "PREFIX = #{prefix}"

    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end
end

__END__
diff --git a/util.c b/util.c
index aefcd94..b706061 100644
--- a/util.c
+++ b/util.c
@@ -19,7 +19,7 @@ Foundation, 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 
 GtkWidget* unfocussable(GtkWidget *w)
 {
-	GTK_WIDGET_UNSET_FLAGS(w, GTK_CAN_FOCUS);
+ gtk_widget_set_can_focus(w, FALSE);
 	return w;
 }
 
