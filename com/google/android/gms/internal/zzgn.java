package com.google.android.gms.internal;

import android.content.Context;
import android.os.DeadObjectException;
import android.os.IBinder;
import com.google.android.gms.common.api.GoogleApiClient.ConnectionCallbacks;
import com.google.android.gms.common.api.GoogleApiClient.OnConnectionFailedListener;
import com.google.android.gms.common.internal.zzk;

@zzgi
public class zzgn extends zzk<zzgs>
{
  final int zzrQ;

  public zzgn(Context paramContext, GoogleApiClient.ConnectionCallbacks paramConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener paramOnConnectionFailedListener, int paramInt)
  {
    super(paramContext, paramContext.getMainLooper(), 8, paramConnectionCallbacks, paramOnConnectionFailedListener);
    this.zzrQ = paramInt;
  }

  protected zzgs zzF(IBinder paramIBinder)
  {
    return zzgs.zza.zzG(paramIBinder);
  }

  protected String zzcF()
  {
    return "com.google.android.gms.ads.service.START";
  }

  protected String zzcG()
  {
    return "com.google.android.gms.ads.internal.request.IAdRequestService";
  }

  public zzgs zzdL()
    throws DeadObjectException
  {
    return (zzgs)super.zzjb();
  }
}