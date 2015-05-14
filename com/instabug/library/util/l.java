package com.instabug.library.util;

import android.graphics.Bitmap;
import com.instabug.library.internal.storage.a.b;
import java.io.File;

final class l
  implements a.b
{
  l(j paramj, j.a parama)
  {
  }

  public final void a(Bitmap paramBitmap, File paramFile)
  {
    paramBitmap.recycle();
    this.a.a(paramFile);
  }

  public final void a(String paramString)
  {
    this.a.a(paramString);
  }
}