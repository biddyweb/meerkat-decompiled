package com.instabug.library.util.crash;

import com.instabug.library.Instabug.a;
import com.instabug.library.interactor.a.a;

final class b
  implements a.a
{
  b(a parama, Thread paramThread, Throwable paramThrowable)
  {
  }

  public final void a()
  {
    Instabug.a.a("Crash persisted for upload at next startup");
    a.a(this.c).a(this.a, this.b);
  }

  public final void a(String paramString)
  {
    Instabug.a.a("Exception handlling Error: " + paramString);
    a.a(this.c).a(this.a, this.b);
  }
}