package com.google.android.gms.fitness.request;

import android.os.RemoteException;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.fitness.data.BleDevice;
import java.util.HashMap;
import java.util.Map;

public class zza extends zzt.zza
{
  private final BleScanCallback zzaaI;

  private zza(BleScanCallback paramBleScanCallback)
  {
    this.zzaaI = ((BleScanCallback)zzx.zzl(paramBleScanCallback));
  }

  public void onDeviceFound(BleDevice paramBleDevice)
    throws RemoteException
  {
    this.zzaaI.onDeviceFound(paramBleDevice);
  }

  public void onScanStopped()
    throws RemoteException
  {
    this.zzaaI.onScanStopped();
  }

  public static class zza
  {
    private static final zza zzaaJ = new zza();
    private final Map<BleScanCallback, zza> zzaaK = new HashMap();

    public static zza zzlO()
    {
      return zzaaJ;
    }

    public zza zza(BleScanCallback paramBleScanCallback)
    {
      synchronized (this.zzaaK)
      {
        zza localzza = (zza)this.zzaaK.get(paramBleScanCallback);
        if (localzza == null)
        {
          localzza = new zza(paramBleScanCallback, null);
          this.zzaaK.put(paramBleScanCallback, localzza);
        }
        return localzza;
      }
    }

    public zza zzb(BleScanCallback paramBleScanCallback)
    {
      synchronized (this.zzaaK)
      {
        zza localzza1 = (zza)this.zzaaK.get(paramBleScanCallback);
        if (localzza1 != null)
          return localzza1;
        zza localzza2 = new zza(paramBleScanCallback, null);
        return localzza2;
      }
    }
  }
}