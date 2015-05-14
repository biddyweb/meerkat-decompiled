package com.instabug.library.internal.storage;

import com.instabug.library.Instabug.a;
import com.instabug.library.model.a;

final class f
  implements Runnable
{
  f(e parame, a parama, e.a parama1)
  {
  }

  public final void run()
  {
    e.a(this.c).a(this.a);
    Instabug.a.a("Crash saved in local DB cache");
    this.b.a(this.a);
  }
}