package com.google.android.gms.internal;

import android.content.Context;
import android.os.IBinder;
import android.os.RemoteException;
import com.google.android.gms.dynamic.zzd;
import com.google.android.gms.dynamic.zze;
import com.google.android.gms.dynamic.zzg;
import com.google.android.gms.dynamic.zzg.zza;

@zzgi
public class zzaw extends zzg<zzbj>
{
  public zzaw()
  {
    super("com.google.android.gms.ads.AdManagerCreatorImpl");
  }

  private zzbi zzb(Context paramContext, zzba paramzzba, String paramString, zzdq paramzzdq)
  {
    try
    {
      zzd localzzd = zze.zzn(paramContext);
      zzbi localzzbi = zzbi.zza.zzg(((zzbj)zzS(paramContext)).zza(localzzd, paramzzba, paramString, paramzzdq, 7095000));
      return localzzbi;
    }
    catch (RemoteException localRemoteException)
    {
      zzhx.zzd("Could not create remote AdManager.", localRemoteException);
      return null;
    }
    catch (zzg.zza localzza)
    {
      zzhx.zzd("Could not create remote AdManager.", localzza);
    }
    return null;
  }

  public zzbi zza(Context paramContext, zzba paramzzba, String paramString, zzdq paramzzdq)
  {
    Object localObject;
    if (zzbe.zzbD().zzA(paramContext))
    {
      localObject = zzb(paramContext, paramzzba, paramString, paramzzdq);
      if (localObject != null);
    }
    else
    {
      zzhx.zzY("Using AdManager from the client jar.");
      localObject = new zzt(paramContext, paramzzba, paramString, paramzzdq, new zzhy(7095000, 7095000, true));
    }
    return localObject;
  }

  protected zzbj zzc(IBinder paramIBinder)
  {
    return zzbj.zza.zzh(paramIBinder);
  }
}