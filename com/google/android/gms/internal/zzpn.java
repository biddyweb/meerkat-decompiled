package com.google.android.gms.internal;

import android.os.RemoteException;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.location.LocationServices.zza;
import com.google.android.gms.location.LocationSettingsRequest;
import com.google.android.gms.location.LocationSettingsResult;
import com.google.android.gms.location.SettingsApi;

public class zzpn
  implements SettingsApi
{
  public PendingResult<LocationSettingsResult> checkLocationSettings(GoogleApiClient paramGoogleApiClient, LocationSettingsRequest paramLocationSettingsRequest)
  {
    return zza(paramGoogleApiClient, paramLocationSettingsRequest, null);
  }

  public PendingResult<LocationSettingsResult> zza(GoogleApiClient paramGoogleApiClient, final LocationSettingsRequest paramLocationSettingsRequest, final String paramString)
  {
    return paramGoogleApiClient.zza(new LocationServices.zza(paramGoogleApiClient)
    {
      protected void zza(zzpf paramAnonymouszzpf)
        throws RemoteException
      {
        paramAnonymouszzpf.zza(paramLocationSettingsRequest, this, paramString);
      }

      public LocationSettingsResult zzax(Status paramAnonymousStatus)
      {
        return new LocationSettingsResult(paramAnonymousStatus);
      }
    });
  }
}