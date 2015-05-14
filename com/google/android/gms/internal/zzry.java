package com.google.android.gms.internal;

import android.content.Context;
import android.os.IBinder;
import android.os.Looper;
import com.google.android.gms.common.api.GoogleApiClient.ConnectionCallbacks;
import com.google.android.gms.common.api.GoogleApiClient.OnConnectionFailedListener;
import com.google.android.gms.common.internal.zzf;
import com.google.android.gms.common.internal.zzk;

class zzry extends zzk<zzrv>
{
  zzry(Context paramContext, Looper paramLooper, GoogleApiClient.ConnectionCallbacks paramConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener paramOnConnectionFailedListener, zzf paramzzf)
  {
    super(paramContext, paramLooper, 62, paramConnectionCallbacks, paramOnConnectionFailedListener, paramzzf);
  }

  protected String zzcF()
  {
    return "com.google.android.gms.nearby.messages.service.NearbyMessagesService.START";
  }

  protected String zzcG()
  {
    return "com.google.android.gms.nearby.messages.internal.INearbyMessagesService";
  }

  protected zzrv zzcm(IBinder paramIBinder)
  {
    return zzrv.zza.zzcl(paramIBinder);
  }

  public boolean zzjd()
  {
    return true;
  }
}