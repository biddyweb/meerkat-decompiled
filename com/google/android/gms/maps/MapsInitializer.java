package com.google.android.gms.maps;

import android.content.Context;
import android.os.RemoteException;
import com.google.android.gms.common.GooglePlayServicesNotAvailableException;
import com.google.android.gms.maps.internal.zzc;
import com.google.android.gms.maps.model.BitmapDescriptorFactory;
import com.google.android.gms.maps.model.RuntimeRemoteException;

public final class MapsInitializer
{
  public static int initialize(Context paramContext)
  {
    com.google.android.gms.common.internal.zzx.zzl(paramContext);
    try
    {
      zzc localzzc = com.google.android.gms.maps.internal.zzx.zzac(paramContext);
      zza(localzzc);
      return 0;
    }
    catch (GooglePlayServicesNotAvailableException localGooglePlayServicesNotAvailableException)
    {
      return localGooglePlayServicesNotAvailableException.errorCode;
    }
  }

  public static void zza(zzc paramzzc)
  {
    try
    {
      CameraUpdateFactory.zza(paramzzc.zzqA());
      BitmapDescriptorFactory.zza(paramzzc.zzqB());
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }
}