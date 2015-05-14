package com.instabug.library;

import android.app.ProgressDialog;
import com.instabug.library.util.j.a;
import java.io.File;

final class t
  implements j.a
{
  t(h paramh, h.b paramb)
  {
  }

  public final void a(File paramFile)
  {
    if ((h.g(this.b) != null) && (h.g(this.b).isShowing()))
    {
      h.g(this.b).dismiss();
      h.a(this.b, null);
    }
    this.a.a(paramFile);
  }

  public final void a(String paramString)
  {
    if ((h.g(this.b) != null) && (h.g(this.b).isShowing()))
    {
      h.g(this.b).dismiss();
      h.a(this.b, null);
    }
    Instabug.a.a(this.b.q());
    Instabug.a.a("ScreenshotProcessor: " + paramString);
    h.a(this.b, false);
  }
}