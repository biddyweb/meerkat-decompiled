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

public class zznb extends zzmy<zznl>
{
  public zznb(Context paramContext, Looper paramLooper, zzf paramzzf, GoogleApiClient.ConnectionCallbacks paramConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener paramOnConnectionFailedListener)
  {
    super(paramContext, paramLooper, 57, paramConnectionCallbacks, paramOnConnectionFailedListener, paramzzf);
  }

  protected zznl zzay(IBinder paramIBinder)
  {
    return zznl.zza.zzaI(paramIBinder);
  }

  protected String zzcF()
  {
    return "com.google.android.gms.fitness.HistoryApi";
  }

  protected String zzcG()
  {
    return "com.google.android.gms.fitness.internal.IGoogleFitHistoryApi";
  }

  protected List<String> zzf(List<String> paramList)
  {
    return zza.zzj(paramList);
  }

  static abstract class zza<R extends Result> extends zza.zza<R, zznb>
  {
    public zza(GoogleApiClient paramGoogleApiClient)
    {
      super(paramGoogleApiClient);
    }
  }

  public static class zzb
    implements Api.zzb<zznb, Api.ApiOptions.NoOptions>
  {
    public int getPriority()
    {
      return 2147483647;
    }

    public zznb zzf(Context paramContext, Looper paramLooper, zzf paramzzf, Api.ApiOptions.NoOptions paramNoOptions, GoogleApiClient.ConnectionCallbacks paramConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener paramOnConnectionFailedListener)
    {
      return new zznb(paramContext, paramLooper, paramzzf, paramConnectionCallbacks, paramOnConnectionFailedListener);
    }
  }

  static abstract class zzc extends zznb.zza<Status>
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