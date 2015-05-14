package com.instabug.library.util;

import android.os.Build.VERSION;
import android.util.Log;
import com.instabug.library.x;

public final class b
{
  private x a;
  private a b;
  private com.instabug.library.network.restapi.a c;
  private com.instabug.library.internal.device.a d;

  public b(x paramx, com.instabug.library.network.restapi.a parama, com.instabug.library.internal.device.a parama1)
  {
    this.a = paramx;
    this.d = parama1;
    this.c = parama;
  }

  public final void a(a parama)
  {
    this.b = parama;
    try
    {
      this.c.a(this.d.j(), this.a.b(), com.instabug.library.internal.device.a.a(), Integer.toString(Build.VERSION.SDK_INT), this.d.h(), "1.3.2", com.instabug.library.internal.device.a.c(), new c(this));
      return;
    }
    catch (Exception localException)
    {
      new StringBuilder("Failed to create device registration request. Reason is:\n").append(Log.getStackTraceString(localException.getCause()));
    }
  }

  public static abstract interface a
  {
    public abstract void a();
  }
}