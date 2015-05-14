package com.google.android.gms.internal;

import android.content.Context;
import android.os.IBinder;
import android.os.Looper;
import com.google.android.gms.common.api.GoogleApiClient.ConnectionCallbacks;
import com.google.android.gms.common.api.GoogleApiClient.OnConnectionFailedListener;
import com.google.android.gms.common.internal.zzf;
import com.google.android.gms.common.internal.zzk;

class zzso extends zzk<zzsn>
{
  public zzso(Context paramContext, Looper paramLooper, GoogleApiClient.ConnectionCallbacks paramConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener paramOnConnectionFailedListener, zzf paramzzf)
  {
    super(paramContext, paramLooper, 49, paramConnectionCallbacks, paramOnConnectionFailedListener, paramzzf);
  }

  protected String zzcF()
  {
    return "com.google.android.gms.nearby.sharing.service.NearbySharingService.START";
  }

  protected String zzcG()
  {
    return "com.google.android.gms.nearby.sharing.internal.INearbySharingService";
  }

  protected zzsn zzcq(IBinder paramIBinder)
  {
    return zzsn.zza.zzcp(paramIBinder);
  }

  public boolean zzjd()
  {
    return true;
  }
}