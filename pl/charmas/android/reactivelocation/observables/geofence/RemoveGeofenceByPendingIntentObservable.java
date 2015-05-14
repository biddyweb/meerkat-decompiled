package pl.charmas.android.reactivelocation.observables.geofence;

import android.app.PendingIntent;
import android.content.Context;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.ResultCallback;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.location.GeofencingApi;
import com.google.android.gms.location.LocationServices;
import rx.Observer;

class RemoveGeofenceByPendingIntentObservable extends RemoveGeofenceObservable<RemoveGeofencesResult.PendingIntentRemoveGeofenceResult>
{
  private final PendingIntent pendingIntent;

  RemoveGeofenceByPendingIntentObservable(Context paramContext, PendingIntent paramPendingIntent)
  {
    super(paramContext);
    this.pendingIntent = paramPendingIntent;
  }

  protected void removeGeofences(GoogleApiClient paramGoogleApiClient, final Observer<? super RemoveGeofencesResult.PendingIntentRemoveGeofenceResult> paramObserver)
  {
    LocationServices.GeofencingApi.removeGeofences(paramGoogleApiClient, this.pendingIntent).setResultCallback(new ResultCallback()
    {
      public void onResult(Status paramAnonymousStatus)
      {
        RemoveGeofencesResult.PendingIntentRemoveGeofenceResult localPendingIntentRemoveGeofenceResult = new RemoveGeofencesResult.PendingIntentRemoveGeofenceResult(paramAnonymousStatus.getStatusCode(), RemoveGeofenceByPendingIntentObservable.this.pendingIntent);
        if (localPendingIntentRemoveGeofenceResult.isSuccess())
        {
          paramObserver.onNext(localPendingIntentRemoveGeofenceResult);
          paramObserver.onCompleted();
          return;
        }
        paramObserver.onError(new RemoveGeofencesException(localPendingIntentRemoveGeofenceResult.getStatusCode()));
      }
    });
  }
}