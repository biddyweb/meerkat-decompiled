package com.google.android.gms.fitness.data;

import android.os.RemoteException;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.fitness.request.OnDataPointListener;
import java.util.HashMap;
import java.util.Map;

public class zzl extends zzk.zza
{
  private final OnDataPointListener zzZF;

  private zzl(OnDataPointListener paramOnDataPointListener)
  {
    this.zzZF = ((OnDataPointListener)zzx.zzl(paramOnDataPointListener));
  }

  public void zzc(DataPoint paramDataPoint)
    throws RemoteException
  {
    this.zzZF.onDataPoint(paramDataPoint);
  }

  public static class zza
  {
    private static final zza zzZG = new zza();
    private final Map<OnDataPointListener, zzl> zzZH = new HashMap();

    public static zza zzlG()
    {
      return zzZG;
    }

    public zzl zza(OnDataPointListener paramOnDataPointListener)
    {
      synchronized (this.zzZH)
      {
        zzl localzzl = (zzl)this.zzZH.get(paramOnDataPointListener);
        if (localzzl == null)
        {
          localzzl = new zzl(paramOnDataPointListener, null);
          this.zzZH.put(paramOnDataPointListener, localzzl);
        }
        return localzzl;
      }
    }

    public zzl zzb(OnDataPointListener paramOnDataPointListener)
    {
      synchronized (this.zzZH)
      {
        zzl localzzl = (zzl)this.zzZH.get(paramOnDataPointListener);
        return localzzl;
      }
    }

    public zzl zzc(OnDataPointListener paramOnDataPointListener)
    {
      synchronized (this.zzZH)
      {
        zzl localzzl1 = (zzl)this.zzZH.remove(paramOnDataPointListener);
        if (localzzl1 != null)
          return localzzl1;
        zzl localzzl2 = new zzl(paramOnDataPointListener, null);
        return localzzl2;
      }
    }
  }
}