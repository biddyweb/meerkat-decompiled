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
public final class zzfu extends zzg<zzfq>
{
  private static final zzfu zzvw = new zzfu();

  private zzfu()
  {
    super("com.google.android.gms.ads.InAppPurchaseManagerCreatorImpl");
  }

  private static boolean zzc(Activity paramActivity)
    throws zzfu.zza
  {
    Intent localIntent = paramActivity.getIntent();
    if (!localIntent.hasExtra("com.google.android.gms.ads.internal.purchase.useClientJar"))
      throw new zzfu.zza("InAppPurchaseManager requires the useClientJar flag in intent extras.");
    return localIntent.getBooleanExtra("com.google.android.gms.ads.internal.purchase.useClientJar", false);
  }

  public static zzfp zze(Activity paramActivity)
  {
    try
    {
      if (zzc(paramActivity))
      {
        zzhx.zzY("Using AdOverlay from the client jar.");
        return new zzff(paramActivity);
      }
      zzfp localzzfp = zzvw.zzf(paramActivity);
      return localzzfp;
    }
    catch (zzfu.zza localzza)
    {
      zzhx.zzac(localzza.getMessage());
    }
    return null;
  }

  private zzfp zzf(Activity paramActivity)
  {
    try
    {
      zzd localzzd = zze.zzn(paramActivity);
      zzfp localzzfp = zzfp.zza.zzA(((zzfq)zzS(paramActivity)).zzc(localzzd));
      return localzzfp;
    }
    catch (RemoteException localRemoteException)
    {
      zzhx.zzd("Could not create remote InAppPurchaseManager.", localRemoteException);
      return null;
    }
    catch (zzg.zza localzza)
    {
      zzhx.zzd("Could not create remote InAppPurchaseManager.", localzza);
    }
    return null;
  }

  protected zzfq zzE(IBinder paramIBinder)
  {
    return zzfq.zza.zzB(paramIBinder);
  }
}