package com.instabug.library;

import com.instabug.library.internal.storage.e.a;
import com.instabug.library.model.a;

final class l
  implements e.a
{
  l(h paramh)
  {
  }

  public final void a(a parama)
  {
    Instabug.a.a("reportCaughtException: Your exception has been reported");
  }

  public final void a(String paramString)
  {
    Instabug.a.a("reportCaughtException: " + paramString);
  }
}