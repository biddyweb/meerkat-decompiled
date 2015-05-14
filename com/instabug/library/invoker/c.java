package com.instabug.library.invoker;

import android.hardware.SensorManager;
import android.os.Handler;
import com.instabug.library.internal.sensor.a;
import com.instabug.library.internal.sensor.a.a;

public final class c
{
  private a a;
  private Handler b = new Handler();
  private a c;
  private int d = 0;
  private SensorManager e;
  private Runnable f = new d(this);
  private a.a g = new e(this);

  public c(a parama, a parama1, SensorManager paramSensorManager)
  {
    this.a = parama;
    this.c = parama1;
    this.e = paramSensorManager;
    parama.a(this.g);
  }

  public final void a(float paramFloat)
  {
    this.a.a(paramFloat);
  }

  public final void a(boolean paramBoolean)
  {
    if (paramBoolean)
    {
      a locala2 = this.a;
      SensorManager localSensorManager2 = this.e;
      if (localSensorManager2 != null)
        localSensorManager2.registerListener(locala2, localSensorManager2.getDefaultSensor(1), 1);
    }
    a locala1;
    SensorManager localSensorManager1;
    do
    {
      return;
      locala1 = this.a;
      localSensorManager1 = this.e;
    }
    while (localSensorManager1 == null);
    localSensorManager1.unregisterListener(locala1);
  }

  public static abstract interface a
  {
    public abstract void a();
  }
}