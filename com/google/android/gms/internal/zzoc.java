package com.google.android.gms.internal;

import android.content.Context;
import android.os.RemoteException;
import android.util.Log;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.zza.zzb;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.fitness.HistoryApi;
import com.google.android.gms.fitness.data.DataSet;
import com.google.android.gms.fitness.data.DataSource;
import com.google.android.gms.fitness.request.DataDeleteRequest;
import com.google.android.gms.fitness.request.DataReadRequest;
import com.google.android.gms.fitness.request.zze;
import com.google.android.gms.fitness.result.DataReadResult;
import java.util.List;

public class zzoc
  implements HistoryApi
{
  private PendingResult<Status> zza(GoogleApiClient paramGoogleApiClient, final DataSet paramDataSet, final boolean paramBoolean)
  {
    zzx.zzb(paramDataSet, "Must set the data set");
    if (!paramDataSet.getDataPoints().isEmpty());
    for (boolean bool = true; ; bool = false)
    {
      zzx.zza(bool, "Cannot use an empty data set");
      zzx.zzb(paramDataSet.getDataSource().zzlz(), "Must set the app package name for the data source");
      return paramGoogleApiClient.zza(new zznb.zzc(paramGoogleApiClient)
      {
        protected void zza(zznb paramAnonymouszznb)
          throws RemoteException
        {
          zzoh localzzoh = new zzoh(this);
          String str = paramAnonymouszznb.getContext().getPackageName();
          ((zznl)paramAnonymouszznb.zzjb()).zza(new zze(paramDataSet, localzzoh, str, paramBoolean));
        }
      });
    }
  }

  public PendingResult<Status> deleteData(GoogleApiClient paramGoogleApiClient, final DataDeleteRequest paramDataDeleteRequest)
  {
    return paramGoogleApiClient.zza(new zznb.zzc(paramGoogleApiClient)
    {
      protected void zza(zznb paramAnonymouszznb)
        throws RemoteException
      {
        zzoh localzzoh = new zzoh(this);
        String str = paramAnonymouszznb.getContext().getPackageName();
        ((zznl)paramAnonymouszznb.zzjb()).zza(new DataDeleteRequest(paramDataDeleteRequest, localzzoh, str));
      }
    });
  }

  public PendingResult<Status> insertData(GoogleApiClient paramGoogleApiClient, DataSet paramDataSet)
  {
    return zza(paramGoogleApiClient, paramDataSet, false);
  }

  public PendingResult<DataReadResult> readData(GoogleApiClient paramGoogleApiClient, final DataReadRequest paramDataReadRequest)
  {
    return paramGoogleApiClient.zza(new zznb.zza(paramGoogleApiClient)
    {
      protected void zza(zznb paramAnonymouszznb)
        throws RemoteException
      {
        zzoc.zza localzza = new zzoc.zza(this, null);
        String str = paramAnonymouszznb.getContext().getPackageName();
        ((zznl)paramAnonymouszznb.zzjb()).zza(new DataReadRequest(paramDataReadRequest, localzza, str));
      }

      protected DataReadResult zzw(Status paramAnonymousStatus)
      {
        return DataReadResult.zza(paramAnonymousStatus, paramDataReadRequest);
      }
    });
  }

  private static class zza extends zzng.zza
  {
    private final zza.zzb<DataReadResult> zzHa;
    private int zzaam = 0;
    private DataReadResult zzaan = null;

    private zza(zza.zzb<DataReadResult> paramzzb)
    {
      this.zzHa = paramzzb;
    }

    public void zza(DataReadResult paramDataReadResult)
    {
      try
      {
        Log.v("Fitness", "Received batch result");
        if (this.zzaan == null)
          this.zzaan = paramDataReadResult;
        while (true)
        {
          this.zzaam = (1 + this.zzaam);
          if (this.zzaam == this.zzaan.zzmn())
            this.zzHa.zzd(this.zzaan);
          return;
          this.zzaan.zzb(paramDataReadResult);
        }
      }
      finally
      {
      }
    }
  }
}