package com.instabug.library;

import android.app.Activity;
import com.instabug.library.internal.theming.a;
import java.io.File;

final class j
  implements h.b
{
  j(h paramh)
  {
  }

  public final void a(File paramFile)
  {
    Instabug.a.a(this.a.q());
    h.a(this.a, false);
    Activity localActivity = h.c(this.a);
    Class localClass = h.x();
    if (h.h(this.a) == Instabug.SdkThemeSource.CALLER_THEME);
    for (a locala = h.d(this.a); ; locala = null)
    {
      h.a(localActivity, localClass, locala, h.e(this.a), paramFile);
      return;
    }
  }
}