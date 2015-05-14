package com.google.android.gms.internal;

import android.content.Context;
import android.os.DeadObjectException;
import android.os.IBinder;
import android.os.Looper;
import com.google.android.gms.common.api.GoogleApiClient.ConnectionCallbacks;
import com.google.android.gms.common.api.GoogleApiClient.OnConnectionFailedListener;
import com.google.android.gms.common.internal.zzk;

public class zzjh extends zzk<zzje>
{
  public zzjh(Context paramContext, Looper paramLooper, GoogleApiClient.ConnectionCallbacks paramConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener paramOnConnectionFailedListener)
  {
    super(paramContext, paramLooper, 19, paramConnectionCallbacks, paramOnConnectionFailedListener);
  }

  protected zzje zzK(IBinder paramIBinder)
  {
    return zzje.zza.zzI(paramIBinder);
  }

  protected String zzcF()
  {
    return "com.google.android.gms.icing.LIGHTWEIGHT_INDEX_SERVICE";
  }

  protected String zzcG()
  {
    return "com.google.android.gms.appdatasearch.internal.ILightweightAppDataSearch";
  }

  public zzje zzgY()
    throws DeadObjectException
  {
    return (zzje)zzjb();
  }
}