package com.google.android.gms.internal;

import android.content.Context;
import android.os.RemoteException;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.zza.zzb;
import com.google.android.gms.fitness.BleApi;
import com.google.android.gms.fitness.data.BleDevice;
import com.google.android.gms.fitness.request.BleScanCallback;
import com.google.android.gms.fitness.request.StartBleScanRequest;
import com.google.android.gms.fitness.request.zzar;
import com.google.android.gms.fitness.request.zzav;
import com.google.android.gms.fitness.request.zzb;
import com.google.android.gms.fitness.request.zzu;
import com.google.android.gms.fitness.result.BleDevicesResult;

public class zzoa
  implements BleApi
{
  public PendingResult<Status> claimBleDevice(GoogleApiClient paramGoogleApiClient, final BleDevice paramBleDevice)
  {
    return paramGoogleApiClient.zzb(new zzmz.zzc(paramGoogleApiClient)
    {
      protected void zza(zzmz paramAnonymouszzmz)
        throws RemoteException
      {
        zzoh localzzoh = new zzoh(this);
        String str = paramAnonymouszzmz.getContext().getPackageName();
        ((zznj)paramAnonymouszzmz.zzjb()).zza(new zzb(paramBleDevice.getAddress(), paramBleDevice, localzzoh, str));
      }
    });
  }

  public PendingResult<Status> claimBleDevice(GoogleApiClient paramGoogleApiClient, final String paramString)
  {
    return paramGoogleApiClient.zzb(new zzmz.zzc(paramGoogleApiClient)
    {
      protected void zza(zzmz paramAnonymouszzmz)
        throws RemoteException
      {
        zzoh localzzoh = new zzoh(this);
        String str = paramAnonymouszzmz.getContext().getPackageName();
        ((zznj)paramAnonymouszzmz.zzjb()).zza(new zzb(paramString, null, localzzoh, str));
      }
    });
  }

  public PendingResult<BleDevicesResult> listClaimedBleDevices(GoogleApiClient paramGoogleApiClient)
  {
    return paramGoogleApiClient.zza(new zzmz.zza(paramGoogleApiClient)
    {
      protected void zza(zzmz paramAnonymouszzmz)
        throws RemoteException
      {
        zzoa.zza localzza = new zzoa.zza(this, null);
        String str = paramAnonymouszzmz.getContext().getPackageName();
        ((zznj)paramAnonymouszzmz.zzjb()).zza(new zzu(localzza, str));
      }

      protected BleDevicesResult zzu(Status paramAnonymousStatus)
      {
        return BleDevicesResult.zzB(paramAnonymousStatus);
      }
    });
  }

  public PendingResult<Status> startBleScan(GoogleApiClient paramGoogleApiClient, final StartBleScanRequest paramStartBleScanRequest)
  {
    return paramGoogleApiClient.zza(new zzmz.zzc(paramGoogleApiClient)
    {
      protected void zza(zzmz paramAnonymouszzmz)
        throws RemoteException
      {
        zzoh localzzoh = new zzoh(this);
        String str = paramAnonymouszzmz.getContext().getPackageName();
        ((zznj)paramAnonymouszzmz.zzjb()).zza(new StartBleScanRequest(paramStartBleScanRequest, localzzoh, str));
      }
    });
  }

  public PendingResult<Status> stopBleScan(GoogleApiClient paramGoogleApiClient, final BleScanCallback paramBleScanCallback)
  {
    return paramGoogleApiClient.zza(new zzmz.zzc(paramGoogleApiClient)
    {
      protected void zza(zzmz paramAnonymouszzmz)
        throws RemoteException
      {
        zzoh localzzoh = new zzoh(this);
        String str = paramAnonymouszzmz.getContext().getPackageName();
        ((zznj)paramAnonymouszzmz.zzjb()).zza(new zzar(paramBleScanCallback, localzzoh, str));
      }
    });
  }

  public PendingResult<Status> unclaimBleDevice(GoogleApiClient paramGoogleApiClient, BleDevice paramBleDevice)
  {
    return unclaimBleDevice(paramGoogleApiClient, paramBleDevice.getAddress());
  }

  public PendingResult<Status> unclaimBleDevice(GoogleApiClient paramGoogleApiClient, final String paramString)
  {
    return paramGoogleApiClient.zzb(new zzmz.zzc(paramGoogleApiClient)
    {
      protected void zza(zzmz paramAnonymouszzmz)
        throws RemoteException
      {
        zzoh localzzoh = new zzoh(this);
        String str = paramAnonymouszzmz.getContext().getPackageName();
        ((zznj)paramAnonymouszzmz.zzjb()).zza(new zzav(paramString, localzzoh, str));
      }
    });
  }

  private static class zza extends zzoj.zza
  {
    private final zza.zzb<BleDevicesResult> zzHa;

    private zza(zza.zzb<BleDevicesResult> paramzzb)
    {
      this.zzHa = paramzzb;
    }

    public void zza(BleDevicesResult paramBleDevicesResult)
    {
      this.zzHa.zzd(paramBleDevicesResult);
    }
  }
}