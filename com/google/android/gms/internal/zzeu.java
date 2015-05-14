package com.google.android.gms.internal;

import android.app.Activity;
import android.content.Intent;
import android.os.IBinder;
import android.os.RemoteException;
import com.google.android.gms.dynamic.zzd;
import com.google.android.gms.dynamic.zze;
import com.google.android.gms.dynamic.zzg;
import com.google.android.gms.dynamic.zzg.zza;

@zzgi
public final class zzeu extends zzg<zzew>
{
  private static final zzeu zzuL = new zzeu();

  private zzeu()
  {
    super("com.google.android.gms.ads.AdOverlayCreatorImpl");
  }

  public static zzev zzb(Activity paramActivity)
  {
    try
    {
      if (zzc(paramActivity))
      {
        zzhx.zzY("Using AdOverlay from the client jar.");
        return new zzel(paramActivity);
      }
      zzev localzzev = zzuL.zzd(paramActivity);
      return localzzev;
    }
    catch (zzeu.zza localzza)
    {
      zzhx.zzac(localzza.getMessage());
    }
    return null;
  }

  private static boolean zzc(Activity paramActivity)
    throws zzeu.zza
  {
    Intent localIntent = paramActivity.getIntent();
    if (!localIntent.hasExtra("com.google.android.gms.ads.internal.overlay.useClientJar"))
      throw new zzeu.zza("Ad overlay requires the useClientJar flag in intent extras.");
    return localIntent.getBooleanExtra("com.google.android.gms.ads.internal.overlay.useClientJar", false);
  }

  private zzev zzd(Activity paramActivity)
  {
    try
    {
      zzd localzzd = zze.zzn(paramActivity);
      zzev localzzev = zzev.zza.zzv(((zzew)zzS(paramActivity)).zzb(localzzd));
      return localzzev;
    }
    catch (RemoteException localRemoteException)
    {
      zzhx.zzd("Could not create remote AdOverlay.", localRemoteException);
      return null;
    }
    catch (zzg.zza localzza)
    {
      zzhx.zzd("Could not create remote AdOverlay.", localzza);
    }
    return null;
  }

  protected zzew zzu(IBinder paramIBinder)
  {
    return zzew.zza.zzw(paramIBinder);
  }
}