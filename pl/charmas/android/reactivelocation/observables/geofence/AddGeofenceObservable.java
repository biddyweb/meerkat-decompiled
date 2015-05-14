package pl.charmas.android.reactivelocation.observables.geofence;

import android.app.PendingIntent;
import android.content.Context;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.ResultCallback;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.location.GeofencingApi;
import com.google.android.gms.location.GeofencingRequest;
import com.google.android.gms.location.LocationServices;
import pl.charmas.android.reactivelocation.observables.BaseLocationObservable;
import rx.Observable;
import rx.Observer;

public class AddGeofenceObservable extends BaseLocationObservable<AddGeofenceResult>
{
  private final PendingIntent geofenceTransitionPendingIntent;
  private final GeofencingRequest request;

  private AddGeofenceObservable(Context paramContext, GeofencingRequest paramGeofencingRequest, PendingIntent paramPendingIntent)
  {
    super(paramContext);
    this.request = paramGeofencingRequest;
    this.geofenceTransitionPendingIntent = paramPendingIntent;
  }

  public static Observable<AddGeofenceResult> createObservable(Context paramContext, GeofencingRequest paramGeofencingRequest, PendingIntent paramPendingIntent)
  {
    return Observable.create(new AddGeofenceObservable(paramContext, paramGeofencingRequest, paramPendingIntent));
  }

  protected void onGoogleApiClientReady(GoogleApiClient paramGoogleApiClient, final Observer<? super AddGeofenceResult> paramObserver)
  {
    LocationServices.GeofencingApi.addGeofences(paramGoogleApiClient, this.request, this.geofenceTransitionPendingIntent).setResultCallback(new ResultCallback()
    {
      public void onResult(Status paramAnonymousStatus)
      {
        AddGeofenceResult localAddGeofenceResult = new AddGeofenceResult(paramAnonymousStatus.getStatusCode());
        if (!localAddGeofenceResult.isSuccess())
        {
          paramObserver.onError(new AddGeofenceException(localAddGeofenceResult));
          return;
        }
        paramObserver.onNext(localAddGeofenceResult);
        paramObserver.onCompleted();
      }
    });
  }
}