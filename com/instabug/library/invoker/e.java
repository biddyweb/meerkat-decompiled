package com.instabug.library.invoker;

import android.os.Handler;
import com.instabug.library.internal.sensor.a.a;

final class e
  implements a.a
{
  e(c paramc)
  {
  }

  public final void a()
  {
    c.a(this.a);
    if (c.b(this.a) == 3)
    {
      c.d(this.a).postDelayed(c.c(this.a), 3000L);
      c.e(this.a).a();
    }
  }
}