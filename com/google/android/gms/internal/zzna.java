package com.google.android.gms.internal;

import android.content.Context;
import android.os.IBinder;
import android.os.Looper;
import com.google.android.gms.common.api.Api.ApiOptions.NoOptions;
import com.google.android.gms.common.api.Api.zzb;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.GoogleApiClient.ConnectionCallbacks;
import com.google.android.gms.common.api.GoogleApiClient.OnConnectionFailedListener;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.zza.zza;
import com.google.android.gms.common.internal.zzf;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.fitness.Fitness;
import com.google.android.gms.fitness.zza;
import java.util.List;

public class zzna extends zzmy<zznk>
{
  public zzna(Context paramContext, Looper paramLooper, zzf paramzzf, GoogleApiClient.ConnectionCallbacks paramConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener paramOnConnectionFailedListener)
  {
    super(paramContext, paramLooper, 60, paramConnectionCallbacks, paramOnConnectionFailedListener, paramzzf);
  }

  protected zznk zzax(IBinder paramIBinder)
  {
    return zznk.zza.zzaH(paramIBinder);
  }

  protected String zzcF()
  {
    return "com.google.android.gms.fitness.ConfigApi";
  }

  protected String zzcG()
  {
    return "com.google.android.gms.fitness.internal.IGoogleFitConfigApi";
  }

  protected List<String> zzf(List<String> paramList)
  {
    return zza.zzj(paramList);
  }

  static abstract class zza<R extends Result> extends zza.zza<R, zzna>
  {
    public zza(GoogleApiClient paramGoogleApiClient)
    {
      super(paramGoogleApiClient);
    }
  }

  public static class zzb
    implements Api.zzb<zzna, Api.ApiOptions.NoOptions>
  {
    public int getPriority()
    {
      return 2147483647;
    }

    public zzna zze(Context paramContext, Looper paramLooper, zzf paramzzf, Api.ApiOptions.NoOptions paramNoOptions, GoogleApiClient.ConnectionCallbacks paramConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener paramOnConnectionFailedListener)
    {
      return new zzna(paramContext, paramLooper, paramzzf, paramConnectionCallbacks, paramOnConnectionFailedListener);
    }
  }

  static abstract class zzc extends zzna.zza<Status>
  {
    zzc(GoogleApiClient paramGoogleApiClient)
    {
      super();
    }

    protected Status zzb(Status paramStatus)
    {
      if (!paramStatus.isSuccess());
      for (boolean bool = true; ; bool = false)
      {
        zzx.zzO(bool);
        return paramStatus;
      }
    }
  }
}