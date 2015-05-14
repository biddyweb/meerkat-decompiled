package com.google.android.gms.internal;

import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.fitness.BleApi;
import com.google.android.gms.fitness.data.BleDevice;
import com.google.android.gms.fitness.request.BleScanCallback;
import com.google.android.gms.fitness.request.StartBleScanRequest;
import com.google.android.gms.fitness.result.BleDevicesResult;

public class zzoi
  implements BleApi
{
  private static final Status zzaaH = new Status(5007);

  public PendingResult<Status> claimBleDevice(GoogleApiClient paramGoogleApiClient, BleDevice paramBleDevice)
  {
    return new zznx(zzaaH);
  }

  public PendingResult<Status> claimBleDevice(GoogleApiClient paramGoogleApiClient, String paramString)
  {
    return new zznx(zzaaH);
  }

  public PendingResult<BleDevicesResult> listClaimedBleDevices(GoogleApiClient paramGoogleApiClient)
  {
    return new zznx(BleDevicesResult.zzB(zzaaH));
  }

  public PendingResult<Status> startBleScan(GoogleApiClient paramGoogleApiClient, StartBleScanRequest paramStartBleScanRequest)
  {
    return new zznx(zzaaH);
  }

  public PendingResult<Status> stopBleScan(GoogleApiClient paramGoogleApiClient, BleScanCallback paramBleScanCallback)
  {
    return new zznx(zzaaH);
  }

  public PendingResult<Status> unclaimBleDevice(GoogleApiClient paramGoogleApiClient, BleDevice paramBleDevice)
  {
    return new zznx(zzaaH);
  }

  public PendingResult<Status> unclaimBleDevice(GoogleApiClient paramGoogleApiClient, String paramString)
  {
    return new zznx(zzaaH);
  }
}