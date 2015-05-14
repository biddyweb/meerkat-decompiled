package com.google.android.gms.internal;

import android.content.Context;
import android.os.DeadObjectException;
import android.os.IBinder;
import com.google.android.gms.common.api.GoogleApiClient.ConnectionCallbacks;
import com.google.android.gms.common.api.GoogleApiClient.OnConnectionFailedListener;
import com.google.android.gms.common.internal.zzk;

@zzgi
public class zzdd extends zzk<zzde>
{
  final int zzrQ;

  public zzdd(Context paramContext, GoogleApiClient.ConnectionCallbacks paramConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener paramOnConnectionFailedListener, int paramInt)
  {
    super(paramContext, paramContext.getMainLooper(), 46, paramConnectionCallbacks, paramOnConnectionFailedListener);
    this.zzrQ = paramInt;
  }

  protected String zzcF()
  {
    return "com.google.android.gms.ads.gservice.START";
  }

  protected String zzcG()
  {
    return "com.google.android.gms.ads.internal.gservice.IGservicesValueService";
  }

  public zzde zzcH()
    throws DeadObjectException
  {
    return (zzde)super.zzjb();
  }

  protected zzde zzo(IBinder paramIBinder)
  {
    return zzde.zza.zzq(paramIBinder);
  }
}