package com.google.android.gms.internal;

import android.app.PendingIntent;
import android.content.Context;
import android.os.RemoteException;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.zza.zzb;
import com.google.android.gms.fitness.SensorsApi;
import com.google.android.gms.fitness.data.zzk;
import com.google.android.gms.fitness.data.zzl;
import com.google.android.gms.fitness.data.zzl.zza;
import com.google.android.gms.fitness.request.DataSourcesRequest;
import com.google.android.gms.fitness.request.OnDataPointListener;
import com.google.android.gms.fitness.request.SensorRequest;
import com.google.android.gms.fitness.request.zzac;
import com.google.android.gms.fitness.request.zzae;
import com.google.android.gms.fitness.result.DataSourcesResult;

public class zzof
  implements SensorsApi
{
  private PendingResult<Status> zza(GoogleApiClient paramGoogleApiClient, final zzk paramzzk, final PendingIntent paramPendingIntent, final zza paramzza)
  {
    return paramGoogleApiClient.zzb(new zzne.zzc(paramGoogleApiClient)
    {
      protected void zza(zzne paramAnonymouszzne)
        throws RemoteException
      {
        zzof.zzc localzzc = new zzof.zzc(this, paramzza, null);
        String str = paramAnonymouszzne.getContext().getPackageName();
        ((zzno)paramAnonymouszzne.zzjb()).zza(new zzae(paramzzk, paramPendingIntent, localzzc, str));
      }

      protected Status zzb(Status paramAnonymousStatus)
      {
        return paramAnonymousStatus;
      }
    });
  }

  private PendingResult<Status> zza(GoogleApiClient paramGoogleApiClient, final SensorRequest paramSensorRequest, final zzk paramzzk, final PendingIntent paramPendingIntent)
  {
    return paramGoogleApiClient.zza(new zzne.zzc(paramGoogleApiClient)
    {
      protected void zza(zzne paramAnonymouszzne)
        throws RemoteException
      {
        zzoh localzzoh = new zzoh(this);
        String str = paramAnonymouszzne.getContext().getPackageName();
        ((zzno)paramAnonymouszzne.zzjb()).zza(new zzac(paramSensorRequest, paramzzk, paramPendingIntent, localzzoh, str));
      }

      protected Status zzb(Status paramAnonymousStatus)
      {
        return paramAnonymousStatus;
      }
    });
  }

  public PendingResult<Status> add(GoogleApiClient paramGoogleApiClient, SensorRequest paramSensorRequest, PendingIntent paramPendingIntent)
  {
    return zza(paramGoogleApiClient, paramSensorRequest, null, paramPendingIntent);
  }

  public PendingResult<Status> add(GoogleApiClient paramGoogleApiClient, SensorRequest paramSensorRequest, OnDataPointListener paramOnDataPointListener)
  {
    return zza(paramGoogleApiClient, paramSensorRequest, zzl.zza.zzlG().zza(paramOnDataPointListener), null);
  }

  public PendingResult<DataSourcesResult> findDataSources(GoogleApiClient paramGoogleApiClient, final DataSourcesRequest paramDataSourcesRequest)
  {
    return paramGoogleApiClient.zza(new zzne.zza(paramGoogleApiClient)
    {
      protected void zza(zzne paramAnonymouszzne)
        throws RemoteException
      {
        zzof.zzb localzzb = new zzof.zzb(this, null);
        String str = paramAnonymouszzne.getContext().getPackageName();
        ((zzno)paramAnonymouszzne.zzjb()).zza(new DataSourcesRequest(paramDataSourcesRequest, localzzb, str));
      }

      protected DataSourcesResult zzy(Status paramAnonymousStatus)
      {
        return DataSourcesResult.zzC(paramAnonymousStatus);
      }
    });
  }

  public PendingResult<Status> remove(GoogleApiClient paramGoogleApiClient, PendingIntent paramPendingIntent)
  {
    return zza(paramGoogleApiClient, null, paramPendingIntent, null);
  }

  public PendingResult<Status> remove(GoogleApiClient paramGoogleApiClient, final OnDataPointListener paramOnDataPointListener)
  {
    zzl localzzl = zzl.zza.zzlG().zzb(paramOnDataPointListener);
    if (localzzl == null)
      return new zznx(Status.zzNo);
    return zza(paramGoogleApiClient, localzzl, null, new zza()
    {
      public void zzlN()
      {
        zzl.zza.zzlG().zzc(paramOnDataPointListener);
      }
    });
  }

  private static abstract interface zza
  {
    public abstract void zzlN();
  }

  private static class zzb extends zznh.zza
  {
    private final zza.zzb<DataSourcesResult> zzHa;

    private zzb(zza.zzb<DataSourcesResult> paramzzb)
    {
      this.zzHa = paramzzb;
    }

    public void zza(DataSourcesResult paramDataSourcesResult)
    {
      this.zzHa.zzd(paramDataSourcesResult);
    }
  }

  private static class zzc extends zznv.zza
  {
    private final zza.zzb<Status> zzHa;
    private final zzof.zza zzaaB;

    private zzc(zza.zzb<Status> paramzzb, zzof.zza paramzza)
    {
      this.zzHa = paramzzb;
      this.zzaaB = paramzza;
    }

    public void zzi(Status paramStatus)
    {
      if ((this.zzaaB != null) && (paramStatus.isSuccess()))
        this.zzaaB.zzlN();
      this.zzHa.zzd(paramStatus);
    }
  }
}