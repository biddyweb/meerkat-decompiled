package pl.charmas.android.reactivelocation.observables.location;

import android.content.Context;
import android.location.Location;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.location.FusedLocationProviderApi;
import com.google.android.gms.location.LocationListener;
import com.google.android.gms.location.LocationRequest;
import com.google.android.gms.location.LocationServices;
import pl.charmas.android.reactivelocation.observables.BaseLocationObservable;
import rx.Observable;
import rx.Observer;

public class LocationUpdatesObservable extends BaseLocationObservable<Location>
{
  private static final String TAG = LocationUpdatesObservable.class.getSimpleName();
  private LocationListener listener;
  private final LocationRequest locationRequest;

  private LocationUpdatesObservable(Context paramContext, LocationRequest paramLocationRequest)
  {
    super(paramContext);
    this.locationRequest = paramLocationRequest;
  }

  public static Observable<Location> createObservable(Context paramContext, LocationRequest paramLocationRequest)
  {
    return Observable.create(new LocationUpdatesObservable(paramContext, paramLocationRequest));
  }

  protected void onGoogleApiClientReady(GoogleApiClient paramGoogleApiClient, final Observer<? super Location> paramObserver)
  {
    this.listener = new LocationListener()
    {
      public void onLocationChanged(Location paramAnonymousLocation)
      {
        paramObserver.onNext(paramAnonymousLocation);
      }
    };
    LocationServices.FusedLocationApi.requestLocationUpdates(paramGoogleApiClient, this.locationRequest, this.listener);
  }

  protected void onUnsubscribed(GoogleApiClient paramGoogleApiClient)
  {
    if (paramGoogleApiClient.isConnected())
      LocationServices.FusedLocationApi.removeLocationUpdates(paramGoogleApiClient, this.listener);
  }
}