package com.instabug.library.internal.storage;

import android.graphics.Bitmap;
import com.instabug.library.Instabug.a;
import com.instabug.library.interactor.a.a;
import java.io.File;
import java.util.ArrayList;

public final class g
  implements p
{
  private a a;
  private e b;
  private com.instabug.library.network.restapi.a c;

  public g(e parame, com.instabug.library.network.restapi.a parama, a parama1)
  {
    this.b = parame;
    this.c = parama;
    this.a = parama1;
  }

  private void a(com.instabug.library.model.a parama, File paramFile, int paramInt, a.a parama1)
  {
    this.c.a(parama, paramFile, paramInt, new j(this, parama1));
  }

  private void c(com.instabug.library.model.a parama, e.a parama1)
  {
    this.b.b(parama, new l(this, parama1));
  }

  private void d(com.instabug.library.model.a parama, e.a parama1)
  {
    this.c.a(parama, new m(this, parama, parama1));
  }

  private void e(com.instabug.library.model.a parama, e.a parama1)
  {
    try
    {
      this.b.d(parama, new n(this, parama1));
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public final ArrayList a()
  {
    return this.b.a();
  }

  final void a(com.instabug.library.model.a parama, e.a parama1)
  {
    if ((parama.k() != null) && (parama.j() == 0))
    {
      Instabug.a.a("Issue has a photo that wasn't uploaded. Saving artifact now.");
      a(parama, new File(parama.k()), 2, new h(this, parama, parama1));
    }
    if ((parama.l() != null) && (parama.i() == 0))
    {
      Instabug.a.a("Issue has an attachment that wasn't uploaded. Saving artifact now.");
      a(parama, new File(parama.l()), 1, new i(this, parama, parama1));
    }
  }

  public final void b(com.instabug.library.model.a parama, e.a parama1)
  {
    if ((parama.e() > 0L) && (parama.h() == 0))
    {
      Instabug.a.a("Issue is cached but hasn't been sent before. Sending Directly.");
      d(parama, parama1);
      return;
    }
    if ((parama.e() > 0L) && (parama.h() != 0))
    {
      Instabug.a.a("Issue is cached and was already uploaded. Checking for artifacts..");
      a(parama, parama1);
      return;
    }
    Bitmap localBitmap = parama.b();
    if (localBitmap != null)
    {
      this.a.a(localBitmap, new k(this, parama, parama1));
      return;
    }
    c(parama, parama1);
  }
}