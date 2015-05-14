package com.instabug.library.util;

import android.graphics.Bitmap;
import com.instabug.library.Instabug.a;

final class k
  implements h.a
{
  k(j paramj, j.a parama)
  {
  }

  public final void a(Bitmap paramBitmap)
  {
    Instabug.a.a("ScreenshotProvider: Screenshot captured. Saving to file..");
    j.a(this.b, paramBitmap, this.a);
  }

  public final void a(String paramString, Exception paramException)
  {
    Instabug.a.a("ScreenshotProvider: Screenshot capture failed: " + paramString);
    if (paramException != null)
      Instabug.a.a("com.instabug.library", paramException);
    this.a.a(paramString);
  }
}