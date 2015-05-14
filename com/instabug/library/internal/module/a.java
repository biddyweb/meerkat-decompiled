package com.instabug.library.internal.module;

import android.app.Application;
import android.hardware.SensorManager;
import com.instabug.library.internal.storage.e;
import com.instabug.library.internal.storage.g;
import com.instabug.library.internal.storage.q;
import com.instabug.library.invoker.c.a;
import com.instabug.library.x;

public final class a
{
  private final Application a;
  private com.instabug.library.a b;
  private c c;
  private d d;

  public a(Application paramApplication)
  {
    this.a = paramApplication;
  }

  public final com.instabug.library.a a()
  {
    if (this.b == null)
      this.b = new com.instabug.library.a();
    return this.b;
  }

  public final com.instabug.library.invoker.c a(c.a parama)
  {
    return new com.instabug.library.invoker.c(new com.instabug.library.internal.sensor.a(), parama, (SensorManager)this.a.getSystemService("sensor"));
  }

  public final d b()
  {
    if (this.d == null)
    {
      Application localApplication = this.a;
      c localc = c();
      com.instabug.library.a locala = a();
      com.instabug.library.internal.storage.db.d locald = com.instabug.library.internal.storage.db.d.a(localApplication);
      com.instabug.library.internal.storage.a locala1 = new com.instabug.library.internal.storage.a(localApplication);
      x localx = new x();
      com.instabug.library.internal.device.a locala2 = new com.instabug.library.internal.device.a(localApplication);
      e locale = new e(new com.instabug.library.internal.storage.d(locald));
      this.d = new d(locald, locala1, localx, locale, q.a(new g(locale, localc.a(), locala1)), com.instabug.library.model.b.a(localx, locala, locala2), locala2);
    }
    return this.d;
  }

  public final c c()
  {
    if (this.c == null)
      this.c = new c(this.a);
    return this.c;
  }

  public final com.instabug.library.util.crash.a d()
  {
    com.instabug.library.interactor.a locala = new com.instabug.library.interactor.a(b().f());
    b localb = new b(this, Thread.getDefaultUncaughtExceptionHandler());
    return new com.instabug.library.util.crash.a(locala, b(), localb);
  }
}