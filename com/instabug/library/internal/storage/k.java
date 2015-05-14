package com.instabug.library.internal.storage;

import android.graphics.Bitmap;
import com.instabug.library.model.a;
import java.io.File;

final class k
  implements a.b
{
  k(g paramg, a parama, e.a parama1)
  {
  }

  public final void a(Bitmap paramBitmap, File paramFile)
  {
    this.a.b(paramFile.getAbsolutePath());
    paramBitmap.recycle();
    g.b(this.c, this.a, this.b);
  }

  public final void a(String paramString)
  {
    this.b.a(paramString);
  }
}