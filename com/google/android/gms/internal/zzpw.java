package com.google.android.gms.internal;

import android.os.RemoteException;
import com.google.android.gms.common.api.Api.zzc;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.location.places.PlaceDetectionApi;
import com.google.android.gms.location.places.PlaceFilter;
import com.google.android.gms.location.places.PlaceLikelihoodBuffer;
import com.google.android.gms.location.places.PlaceReport;
import com.google.android.gms.location.places.Places;
import com.google.android.gms.location.places.zzi;
import com.google.android.gms.location.places.zzi.zzd;
import com.google.android.gms.location.places.zzi.zzg;

public class zzpw
  implements PlaceDetectionApi
{
  public PendingResult<PlaceLikelihoodBuffer> getCurrentPlace(GoogleApiClient paramGoogleApiClient, final PlaceFilter paramPlaceFilter)
  {
    return paramGoogleApiClient.zza(new zzi.zzd(Places.zzanU, paramGoogleApiClient)
    {
      protected void zza(zzpx paramAnonymouszzpx)
        throws RemoteException
      {
        paramAnonymouszzpx.zza(new zzi(this, paramAnonymouszzpx.getContext()), paramPlaceFilter);
      }
    });
  }

  public PendingResult<Status> reportDeviceAtPlace(GoogleApiClient paramGoogleApiClient, final PlaceReport paramPlaceReport)
  {
    return paramGoogleApiClient.zzb(new zzi.zzg(Places.zzanU, paramGoogleApiClient)
    {
      protected void zza(zzpx paramAnonymouszzpx)
        throws RemoteException
      {
        paramAnonymouszzpx.zza(new zzi(this), paramPlaceReport);
      }
    });
  }
}