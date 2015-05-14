package com.instabug.library.internal.sensor;

import [I;
import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import java.util.ArrayList;
import java.util.Iterator;

public final class a
  implements SensorEventListener
{
  private a a;
  private ArrayList b = new ArrayList();
  private Object c = new Object();
  private float d = 10.0F;
  private int e = 2;

  public final void a(float paramFloat)
  {
    this.d = (100.0F * paramFloat);
  }

  public final void a(a parama)
  {
    this.a = parama;
  }

  public final void onAccuracyChanged(Sensor paramSensor, int paramInt)
  {
  }

  public final void onSensorChanged(SensorEvent paramSensorEvent)
  {
    b localb1 = new b(paramSensorEvent.values[0], paramSensorEvent.values[1], paramSensorEvent.values[2], paramSensorEvent.timestamp);
    int[][] arrayOfInt1;
    synchronized (this.c)
    {
      if (this.b.size() == 0)
        this.b.add(localb1);
      while (true)
      {
        synchronized (this.c)
        {
          int[] arrayOfInt = { 0, 0, 0 };
          arrayOfInt1 = new int[][] { { 0, 0 }, { 0, 0 }, { 0, 0 } };
          Iterator localIterator = this.b.iterator();
          if (!localIterator.hasNext())
            break;
          b localb2 = (b)localIterator.next();
          if ((localb2.a() > this.d) && (arrayOfInt[0] <= 0))
          {
            arrayOfInt[0] = 1;
            [I local[I7 = arrayOfInt1[0];
            local[I7[0] = (1 + local[I7[0]);
          }
          if ((localb2.a() < -this.d) && (arrayOfInt[0] >= 0))
          {
            arrayOfInt[0] = -1;
            [I local[I6 = arrayOfInt1[0];
            local[I6[1] = (1 + local[I6[1]);
          }
          if ((localb2.b() > this.d) && (arrayOfInt[1] <= 0))
          {
            arrayOfInt[1] = 1;
            [I local[I5 = arrayOfInt1[1];
            local[I5[0] = (1 + local[I5[0]);
          }
          if ((localb2.b() < -this.d) && (arrayOfInt[1] >= 0))
          {
            arrayOfInt[1] = -1;
            [I local[I4 = arrayOfInt1[1];
            local[I4[1] = (1 + local[I4[1]);
          }
          if ((localb2.c() > this.d) && (arrayOfInt[2] <= 0))
          {
            arrayOfInt[2] = 1;
            [I local[I3 = arrayOfInt1[2];
            local[I3[0] = (1 + local[I3[0]);
          }
          if ((localb2.c() >= -this.d) || (arrayOfInt[2] < 0))
            continue;
          arrayOfInt[2] = -1;
          [I local[I2 = arrayOfInt1[2];
          local[I2[1] = (1 + local[I2[1]);
        }
        if (localb1.d() - ((b)this.b.get(-1 + this.b.size())).d() > 300L)
          this.b.add(localb1);
      }
    }
    int i = 0;
    for (int j = 0; ; j++)
    {
      int m;
      if (j < 3)
      {
        [I local[I1 = arrayOfInt1[j];
        int k = local[I1.length;
        m = 0;
        if (m >= k)
          continue;
        if (local[I1[m] >= this.e)
        {
          if (i == 0)
            break label564;
          if (this.a != null)
            this.a.a();
          this.b.clear();
        }
      }
      else
      {
        return;
      }
      while (true)
      {
        m++;
        break;
        label564: i = 1;
      }
    }
  }

  public static abstract interface a
  {
    public abstract void a();
  }

  final class b
  {
    private final float a;
    private final float b;
    private final float c;
    private final long d;

    public b(float paramFloat1, float paramFloat2, float paramLong, long arg5)
    {
      this.a = paramFloat1;
      this.b = paramFloat2;
      this.c = paramLong;
      Object localObject;
      this.d = localObject;
    }

    public final float a()
    {
      return this.a;
    }

    public final float b()
    {
      return this.b;
    }

    public final float c()
    {
      return this.c;
    }

    public final long d()
    {
      return this.d;
    }

    public final String toString()
    {
      return "SensorBundle{mXAcc=" + this.a + ", mYAcc=" + this.b + ", mZAcc=" + this.c + ", mTimestamp=" + this.d + '}';
    }
  }
}