package pl.charmas.android.reactivelocation.observables.geofence;

import android.app.PendingIntent;
import android.content.Context;
import com.google.android.gms.common.api.GoogleApiClient;
import java.util.List;
import pl.charmas.android.reactivelocation.observables.BaseLocationObservable;
import rx.Observable;
import rx.Observer;

public abstract class RemoveGeofenceObservable<T> extends BaseLocationObservable<T>
{
  protected RemoveGeofenceObservable(Context paramContext)
  {
    super(paramContext);
  }

  public static Observable<RemoveGeofencesResult.PendingIntentRemoveGeofenceResult> createObservable(Context paramContext, PendingIntent paramPendingIntent)
  {
    return Observable.create(new RemoveGeofenceByPendingIntentObservable(paramContext, paramPendingIntent));
  }

  public static Observable<RemoveGeofencesResult.RequestIdsRemoveGeofenceResult> createObservable(Context paramContext, List<String> paramList)
  {
    return Observable.create(new RemoveGeofenceRequestIdsObservable(paramContext, paramList));
  }

  protected void onGoogleApiClientReady(GoogleApiClient paramGoogleApiClient, Observer<? super T> paramObserver)
  {
    removeGeofences(paramGoogleApiClient, paramObserver);
  }

  protected abstract void removeGeofences(GoogleApiClient paramGoogleApiClient, Observer<? super T> paramObserver);
}