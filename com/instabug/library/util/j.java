package com.instabug.library.util;

import com.instabug.library.internal.storage.a;
import java.io.File;

public final class j
{
  private a a;

  public j(a parama)
  {
    this.a = parama;
  }

  public final void a(h paramh, a parama)
  {
    paramh.a(new k(this, parama));
    paramh.execute(new Void[0]);
  }

  public static abstract interface a
  {
    public abstract void a(File paramFile);

    public abstract void a(String paramString);
  }
}