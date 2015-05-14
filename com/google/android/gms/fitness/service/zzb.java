package com.google.android.gms.fitness.service;

import android.os.RemoteException;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.fitness.data.DataPoint;
import com.google.android.gms.fitness.data.zzk;
import java.util.Iterator;
import java.util.List;

class zzb
  implements SensorEventDispatcher
{
  private final zzk zzabp;

  zzb(zzk paramzzk)
  {
    this.zzabp = ((zzk)zzx.zzl(paramzzk));
  }

  public void publish(DataPoint paramDataPoint)
    throws RemoteException
  {
    this.zzabp.zzc(paramDataPoint);
  }

  public void publish(List<DataPoint> paramList)
    throws RemoteException
  {
    Iterator localIterator = paramList.iterator();
    while (localIterator.hasNext())
      publish((DataPoint)localIterator.next());
  }
}