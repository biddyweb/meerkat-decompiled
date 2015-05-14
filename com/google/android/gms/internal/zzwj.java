package com.google.android.gms.internal;

import android.app.Activity;
import android.os.IBinder;
import android.os.RemoteException;
import com.google.android.gms.common.GooglePlayServicesNotAvailableException;
import com.google.android.gms.common.GooglePlayServicesUtil;
import com.google.android.gms.dynamic.zzc;
import com.google.android.gms.dynamic.zze;
import com.google.android.gms.dynamic.zzg;
import com.google.android.gms.dynamic.zzg.zza;
import com.google.android.gms.wallet.fragment.WalletFragmentOptions;

public class zzwj extends zzg<zzwe>
{
  private static zzwj zzaFa;

  protected zzwj()
  {
    super("com.google.android.gms.wallet.dynamite.WalletDynamiteCreatorImpl");
  }

  public static zzwb zza(Activity paramActivity, zzc paramzzc, WalletFragmentOptions paramWalletFragmentOptions, zzwc paramzzwc)
    throws GooglePlayServicesNotAvailableException
  {
    int i = GooglePlayServicesUtil.isGooglePlayServicesAvailable(paramActivity);
    if (i != 0)
      throw new GooglePlayServicesNotAvailableException(i);
    try
    {
      zzwb localzzwb = ((zzwe)zzuU().zzS(paramActivity)).zza(zze.zzn(paramActivity), paramzzc, paramWalletFragmentOptions, paramzzwc);
      return localzzwb;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeException(localRemoteException);
    }
    catch (zzg.zza localzza)
    {
      throw new RuntimeException(localzza);
    }
  }

  private static zzwj zzuU()
  {
    if (zzaFa == null)
      zzaFa = new zzwj();
    return zzaFa;
  }

  protected zzwe zzcO(IBinder paramIBinder)
  {
    return zzwe.zza.zzcK(paramIBinder);
  }
}