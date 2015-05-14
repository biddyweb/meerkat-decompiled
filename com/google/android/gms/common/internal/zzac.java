package com.google.android.gms.common.internal;

import android.content.Context;
import android.os.IBinder;
import android.view.View;
import com.google.android.gms.dynamic.zzd;
import com.google.android.gms.dynamic.zze;
import com.google.android.gms.dynamic.zzg;
import com.google.android.gms.dynamic.zzg.zza;

public final class zzac extends zzg<zzu>
{
  private static final zzac zzQu = new zzac();

  private zzac()
  {
    super("com.google.android.gms.common.ui.SignInButtonCreatorImpl");
  }

  public static View zzb(Context paramContext, int paramInt1, int paramInt2)
    throws zzg.zza
  {
    return zzQu.zzc(paramContext, paramInt1, paramInt2);
  }

  private View zzc(Context paramContext, int paramInt1, int paramInt2)
    throws zzg.zza
  {
    try
    {
      zzd localzzd = zze.zzn(paramContext);
      View localView = (View)zze.zzf(((zzu)zzS(paramContext)).zza(localzzd, paramInt1, paramInt2));
      return localView;
    }
    catch (Exception localException)
    {
      throw new zzg.zza("Could not get button with size " + paramInt1 + " and color " + paramInt2, localException);
    }
  }

  public zzu zzX(IBinder paramIBinder)
  {
    return zzu.zza.zzW(paramIBinder);
  }
}