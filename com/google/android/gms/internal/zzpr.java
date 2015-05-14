package com.google.android.gms.internal;

import android.os.RemoteException;
import com.google.android.gms.common.api.Api.zzc;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.location.places.AddPlaceRequest;
import com.google.android.gms.location.places.AutocompleteFilter;
import com.google.android.gms.location.places.AutocompletePredictionBuffer;
import com.google.android.gms.location.places.GeoDataApi;
import com.google.android.gms.location.places.PlaceBuffer;
import com.google.android.gms.location.places.Places;
import com.google.android.gms.location.places.zzi;
import com.google.android.gms.location.places.zzi.zza;
import com.google.android.gms.location.places.zzi.zzc;
import com.google.android.gms.maps.model.LatLngBounds;
import java.util.Arrays;
import java.util.List;

public class zzpr
  implements GeoDataApi
{
  private static final String TAG = zzpr.class.getSimpleName();

  public PendingResult<PlaceBuffer> addPlace(GoogleApiClient paramGoogleApiClient, final AddPlaceRequest paramAddPlaceRequest)
  {
    return paramGoogleApiClient.zzb(new zzi.zzc(Places.zzanT, paramGoogleApiClient)
    {
      protected void zza(zzps paramAnonymouszzps)
        throws RemoteException
      {
        paramAnonymouszzps.zza(new zzi(this, paramAnonymouszzps.getContext()), paramAddPlaceRequest);
      }
    });
  }

  public PendingResult<AutocompletePredictionBuffer> getAutocompletePredictions(GoogleApiClient paramGoogleApiClient, final String paramString, final LatLngBounds paramLatLngBounds, final AutocompleteFilter paramAutocompleteFilter)
  {
    return paramGoogleApiClient.zza(new zzi.zza(Places.zzanT, paramGoogleApiClient)
    {
      protected void zza(zzps paramAnonymouszzps)
        throws RemoteException
      {
        paramAnonymouszzps.zza(new zzi(this), paramString, paramLatLngBounds, paramAutocompleteFilter);
      }
    });
  }

  public PendingResult<PlaceBuffer> getPlaceById(GoogleApiClient paramGoogleApiClient, final String[] paramArrayOfString)
  {
    int i = 1;
    if ((paramArrayOfString != null) && (paramArrayOfString.length >= i));
    while (true)
    {
      zzx.zzO(i);
      return paramGoogleApiClient.zza(new zzi.zzc(Places.zzanT, paramGoogleApiClient)
      {
        protected void zza(zzps paramAnonymouszzps)
          throws RemoteException
        {
          List localList = Arrays.asList(paramArrayOfString);
          paramAnonymouszzps.zza(new zzi(this, paramAnonymouszzps.getContext()), localList);
        }
      });
      int j = 0;
    }
  }
}