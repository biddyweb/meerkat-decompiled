package pl.charmas.android.reactivelocation.observables.location;

import android.content.Context;
import android.location.Location;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.location.FusedLocationProviderApi;
import com.google.android.gms.location.LocationServices;
import pl.charmas.android.reactivelocation.observables.BaseLocationObservable;
import rx.Observable;
import rx.Observer;

public class LastKnownLocationObservable extends BaseLocationObservable<Location>
{
  private LastKnownLocationObservable(Context paramContext)
  {
    super(paramContext);
  }

  public static Observable<Location> createObservable(Context paramContext)
  {
    return Observable.create(new LastKnownLocationObservable(paramContext));
  }

  protected void onGoogleApiClientReady(GoogleApiClient paramGoogleApiClient, Observer<? super Location> paramObserver)
  {
    Location localLocation = LocationServices.FusedLocationApi.getLastLocation(paramGoogleApiClient);
    if (localLocation != null)
      paramObserver.onNext(localLocation);
    paramObserver.onCompleted();
  }
}