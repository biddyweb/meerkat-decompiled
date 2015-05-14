package com.instabug.library.internal.storage;

import android.content.Context;
import android.graphics.Bitmap;
import com.instabug.library.internal.storage.db.AsyncTasks.d;
import java.io.File;

public final class a
{
  private Context a;

  public a(Context paramContext)
  {
    this.a = paramContext;
  }

  public static void a(String paramString)
  {
    new com.instabug.library.internal.storage.db.AsyncTasks.c().execute(new String[] { paramString });
  }

  public final void a(Bitmap paramBitmap, b paramb)
  {
    new b(this, this.a, "", paramb, paramBitmap).execute(new Bitmap[] { paramBitmap });
  }

  public final void a(String paramString, a parama)
  {
    new c(this, parama).execute(new String[] { paramString });
  }

  public static abstract interface a
  {
    public abstract void a();

    public abstract void a(Bitmap paramBitmap);
  }

  public static abstract interface b
  {
    public abstract void a(Bitmap paramBitmap, File paramFile);

    public abstract void a(String paramString);
  }
}