package com.google.android.gms.internal;

import android.content.Context;
import android.os.RemoteException;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.zza.zzb;
import com.google.android.gms.fitness.ConfigApi;
import com.google.android.gms.fitness.request.DataTypeCreateRequest;
import com.google.android.gms.fitness.request.zzl;
import com.google.android.gms.fitness.request.zzp;
import com.google.android.gms.fitness.result.DataTypeResult;

public class zzob
  implements ConfigApi
{
  public PendingResult<DataTypeResult> createCustomDataType(GoogleApiClient paramGoogleApiClient, final DataTypeCreateRequest paramDataTypeCreateRequest)
  {
    return paramGoogleApiClient.zzb(new zzna.zza(paramGoogleApiClient)
    {
      protected void zza(zzna paramAnonymouszzna)
        throws RemoteException
      {
        zzob.zza localzza = new zzob.zza(this, null);
        String str = paramAnonymouszzna.getContext().getPackageName();
        ((zznk)paramAnonymouszzna.zzjb()).zza(new DataTypeCreateRequest(paramDataTypeCreateRequest, localzza, str));
      }

      protected DataTypeResult zzv(Status paramAnonymousStatus)
      {
        return DataTypeResult.zzD(paramAnonymousStatus);
      }
    });
  }

  public PendingResult<Status> disableFit(GoogleApiClient paramGoogleApiClient)
  {
    return paramGoogleApiClient.zzb(new zzna.zzc(paramGoogleApiClient)
    {
      protected void zza(zzna paramAnonymouszzna)
        throws RemoteException
      {
        zzoh localzzoh = new zzoh(this);
        String str = paramAnonymouszzna.getContext().getPackageName();
        ((zznk)paramAnonymouszzna.zzjb()).zza(new zzp(localzzoh, str));
      }
    });
  }

  public PendingResult<DataTypeResult> readDataType(GoogleApiClient paramGoogleApiClient, final String paramString)
  {
    return paramGoogleApiClient.zza(new zzna.zza(paramGoogleApiClient)
    {
      protected void zza(zzna paramAnonymouszzna)
        throws RemoteException
      {
        zzob.zza localzza = new zzob.zza(this, null);
        String str = paramAnonymouszzna.getContext().getPackageName();
        ((zznk)paramAnonymouszzna.zzjb()).zza(new zzl(paramString, localzza, str));
      }

      protected DataTypeResult zzv(Status paramAnonymousStatus)
      {
        return DataTypeResult.zzD(paramAnonymousStatus);
      }
    });
  }

  private static class zza extends zzni.zza
  {
    private final zza.zzb<DataTypeResult> zzHa;

    private zza(zza.zzb<DataTypeResult> paramzzb)
    {
      this.zzHa = paramzzb;
    }

    public void zza(DataTypeResult paramDataTypeResult)
    {
      this.zzHa.zzd(paramDataTypeResult);
    }
  }
}