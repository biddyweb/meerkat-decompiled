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

public class zzne extends zzmy<zzno>
{
  public zzne(Context paramContext, Looper paramLooper, zzf paramzzf, GoogleApiClient.ConnectionCallbacks paramConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener paramOnConnectionFailedListener)
  {
    super(paramContext, paramLooper, 55, paramConnectionCallbacks, paramOnConnectionFailedListener, paramzzf);
  }

  protected zzno zzaB(IBinder paramIBinder)
  {
    return zzno.zza.zzaL(paramIBinder);
  }

  protected String zzcF()
  {
    return "com.google.android.gms.fitness.SensorsApi";
  }

  protected String zzcG()
  {
    return "com.google.android.gms.fitness.internal.IGoogleFitSensorsApi";
  }

  protected List<String> zzf(List<String> paramList)
  {
    return zza.zzj(paramList);
  }

  static abstract class zza<R extends Result> extends zza.zza<R, zzne>
  {
    public zza(GoogleApiClient paramGoogleApiClient)
    {
      super(paramGoogleApiClient);
    }
  }

  public static class zzb
    implements Api.zzb<zzne, Api.ApiOptions.NoOptions>
  {
    public int getPriority()
    {
      return 2147483647;
    }

    public zzne zzi(Context paramContext, Looper paramLooper, zzf paramzzf, Api.ApiOptions.NoOptions paramNoOptions, GoogleApiClient.ConnectionCallbacks paramConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener paramOnConnectionFailedListener)
    {
      return new zzne(paramContext, paramLooper, paramzzf, paramConnectionCallbacks, paramOnConnectionFailedListener);
    }
  }

  static abstract class zzc extends zzne.zza<Status>
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