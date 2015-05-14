package pl.charmas.android.reactivelocation;

import android.app.PendingIntent;
import android.content.Context;
import android.location.Address;
import android.location.Location;
import android.support.annotation.Nullable;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.location.ActivityRecognitionResult;
import com.google.android.gms.location.GeofencingRequest;
import com.google.android.gms.location.LocationRequest;
import com.google.android.gms.location.LocationServices;
import com.google.android.gms.location.LocationSettingsRequest;
import com.google.android.gms.location.LocationSettingsResult;
import com.google.android.gms.location.SettingsApi;
import com.google.android.gms.location.places.AutocompleteFilter;
import com.google.android.gms.location.places.AutocompletePredictionBuffer;
import com.google.android.gms.location.places.GeoDataApi;
import com.google.android.gms.location.places.PlaceDetectionApi;
import com.google.android.gms.location.places.PlaceFilter;
import com.google.android.gms.location.places.PlaceLikelihoodBuffer;
import com.google.android.gms.location.places.Places;
import com.google.android.gms.maps.model.LatLngBounds;
import java.util.List;
import pl.charmas.android.reactivelocation.observables.GoogleAPIClientObservable;
import pl.charmas.android.reactivelocation.observables.PendingResultObservable;
import pl.charmas.android.reactivelocation.observables.activity.ActivityUpdatesObservable;
import pl.charmas.android.reactivelocation.observables.geocode.GeodecodeObservable;
import pl.charmas.android.reactivelocation.observables.geofence.AddGeofenceObservable;
import pl.charmas.android.reactivelocation.observables.geofence.AddGeofenceResult;
import pl.charmas.android.reactivelocation.observables.geofence.RemoveGeofenceObservable;
import pl.charmas.android.reactivelocation.observables.geofence.RemoveGeofencesResult.PendingIntentRemoveGeofenceResult;
import pl.charmas.android.reactivelocation.observables.geofence.RemoveGeofencesResult.RequestIdsRemoveGeofenceResult;
import pl.charmas.android.reactivelocation.observables.location.LastKnownLocationObservable;
import pl.charmas.android.reactivelocation.observables.location.LocationUpdatesObservable;
import rx.Observable;
import rx.functions.Func1;

public class ReactiveLocationProvider
{
  private final Context ctx;

  public ReactiveLocationProvider(Context paramContext)
  {
    this.ctx = paramContext;
  }

  public static <T extends Result> Observable<T> fromPendingResult(PendingResult<T> paramPendingResult)
  {
    return Observable.create(new PendingResultObservable(paramPendingResult));
  }

  public Observable<AddGeofenceResult> addGeofences(PendingIntent paramPendingIntent, GeofencingRequest paramGeofencingRequest)
  {
    return AddGeofenceObservable.createObservable(this.ctx, paramGeofencingRequest, paramPendingIntent);
  }

  public Observable<LocationSettingsResult> checkLocationSettings(final LocationSettingsRequest paramLocationSettingsRequest)
  {
    Api[] arrayOfApi = new Api[1];
    arrayOfApi[0] = LocationServices.API;
    return getGoogleApiClientObservable(arrayOfApi).flatMap(new Func1()
    {
      public Observable<LocationSettingsResult> call(GoogleApiClient paramAnonymousGoogleApiClient)
      {
        return ReactiveLocationProvider.fromPendingResult(LocationServices.SettingsApi.checkLocationSettings(paramAnonymousGoogleApiClient, paramLocationSettingsRequest));
      }
    });
  }

  public final Observable<PlaceLikelihoodBuffer> getCurrentPlace(@Nullable final PlaceFilter paramPlaceFilter)
  {
    Api[] arrayOfApi = new Api[2];
    arrayOfApi[0] = Places.PLACE_DETECTION_API;
    arrayOfApi[1] = Places.GEO_DATA_API;
    return getGoogleApiClientObservable(arrayOfApi).flatMap(new Func1()
    {
      public Observable<PlaceLikelihoodBuffer> call(GoogleApiClient paramAnonymousGoogleApiClient)
      {
        return ReactiveLocationProvider.fromPendingResult(Places.PlaceDetectionApi.getCurrentPlace(paramAnonymousGoogleApiClient, paramPlaceFilter));
      }
    });
  }

  public Observable<ActivityRecognitionResult> getDetectedActivity(int paramInt)
  {
    return ActivityUpdatesObservable.createObservable(this.ctx, paramInt);
  }

  public Observable<List<Address>> getGeocodeObservable(double paramDouble1, double paramDouble2, int paramInt)
  {
    return GeodecodeObservable.createObservable(this.ctx, paramDouble1, paramDouble2, paramInt);
  }

  public final Observable<GoogleApiClient> getGoogleApiClientObservable(Api[] paramArrayOfApi)
  {
    return GoogleAPIClientObservable.create(this.ctx, paramArrayOfApi);
  }

  public Observable<Location> getLastKnownLocation()
  {
    return LastKnownLocationObservable.createObservable(this.ctx);
  }

  public final Observable<AutocompletePredictionBuffer> getPlaceAutocompletePredictions(final String paramString, final LatLngBounds paramLatLngBounds, final AutocompleteFilter paramAutocompleteFilter)
  {
    Api[] arrayOfApi = new Api[2];
    arrayOfApi[0] = Places.PLACE_DETECTION_API;
    arrayOfApi[1] = Places.GEO_DATA_API;
    return getGoogleApiClientObservable(arrayOfApi).flatMap(new Func1()
    {
      public Observable<AutocompletePredictionBuffer> call(GoogleApiClient paramAnonymousGoogleApiClient)
      {
        return ReactiveLocationProvider.fromPendingResult(Places.GeoDataApi.getAutocompletePredictions(paramAnonymousGoogleApiClient, paramString, paramLatLngBounds, paramAutocompleteFilter));
      }
    });
  }

  public Observable<Location> getUpdatedLocation(LocationRequest paramLocationRequest)
  {
    return LocationUpdatesObservable.createObservable(this.ctx, paramLocationRequest);
  }

  public Observable<RemoveGeofencesResult.PendingIntentRemoveGeofenceResult> removeGeofences(PendingIntent paramPendingIntent)
  {
    return RemoveGeofenceObservable.createObservable(this.ctx, paramPendingIntent);
  }

  public Observable<RemoveGeofencesResult.RequestIdsRemoveGeofenceResult> removeGeofences(List<String> paramList)
  {
    return RemoveGeofenceObservable.createObservable(this.ctx, paramList);
  }
}