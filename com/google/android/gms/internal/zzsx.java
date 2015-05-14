package com.google.android.gms.internal;

import android.content.Context;
import android.os.IBinder;
import android.os.Looper;
import com.google.android.gms.common.api.GoogleApiClient.ConnectionCallbacks;
import com.google.android.gms.common.api.GoogleApiClient.OnConnectionFailedListener;
import com.google.android.gms.common.internal.zzk;

public class zzsx extends zzk<zzsv>
{
  public zzsx(Context paramContext, Looper paramLooper, GoogleApiClient.ConnectionCallbacks paramConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener paramOnConnectionFailedListener)
  {
    super(paramContext, paramLooper, 3, paramConnectionCallbacks, paramOnConnectionFailedListener);
  }

  protected String zzcF()
  {
    return "com.google.android.gms.panorama.service.START";
  }

  protected String zzcG()
  {
    return "com.google.android.gms.panorama.internal.IPanoramaService";
  }

  public zzsv zzct(IBinder paramIBinder)
  {
    return zzsv.zza.zzcs(paramIBinder);
  }
}