package com.google.android.gms.internal;

import android.content.Context;
import android.os.IBinder;
import android.os.Looper;
import com.google.android.gms.common.api.Api.ApiOptions.NoOptions;
import com.google.android.gms.common.api.Api.zzb;
import com.google.android.gms.common.api.GoogleApiClient.ConnectionCallbacks;
import com.google.android.gms.common.api.GoogleApiClient.OnConnectionFailedListener;
import com.google.android.gms.common.internal.zzf;
import com.google.android.gms.fitness.zza;
import java.util.List;

public class zznc extends zzmy<zznm>
{
  public zznc(Context paramContext, Looper paramLooper, zzf paramzzf, GoogleApiClient.ConnectionCallbacks paramConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener paramOnConnectionFailedListener)
  {
    super(paramContext, paramLooper, 61, paramConnectionCallbacks, paramOnConnectionFailedListener, paramzzf);
  }

  protected zznm zzaz(IBinder paramIBinder)
  {
    return zznm.zza.zzaJ(paramIBinder);
  }

  protected String zzcF()
  {
    return "com.google.android.gms.fitness.InternalApi";
  }

  protected String zzcG()
  {
    return "com.google.android.gms.fitness.internal.IGoogleFitInternalApi";
  }

  protected List<String> zzf(List<String> paramList)
  {
    return zza.zzj(paramList);
  }

  public static class zza
    implements Api.zzb<zznc, Api.ApiOptions.NoOptions>
  {
    public int getPriority()
    {
      return 2147483647;
    }

    public zznc zzg(Context paramContext, Looper paramLooper, zzf paramzzf, Api.ApiOptions.NoOptions paramNoOptions, GoogleApiClient.ConnectionCallbacks paramConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener paramOnConnectionFailedListener)
    {
      return new zznc(paramContext, paramLooper, paramzzf, paramConnectionCallbacks, paramOnConnectionFailedListener);
    }
  }
}