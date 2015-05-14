package pl.charmas.android.reactivelocation.observables.geofence;

import android.content.Context;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.ResultCallback;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.location.GeofencingApi;
import com.google.android.gms.location.LocationServices;
import java.util.List;
import rx.Observer;

class RemoveGeofenceRequestIdsObservable extends RemoveGeofenceObservable<RemoveGeofencesResult.RequestIdsRemoveGeofenceResult>
{
  private final List<String> geofenceRequestIds;

  RemoveGeofenceRequestIdsObservable(Context paramContext, List<String> paramList)
  {
    super(paramContext);
    this.geofenceRequestIds = paramList;
  }

  protected void removeGeofences(GoogleApiClient paramGoogleApiClient, final Observer<? super RemoveGeofencesResult.RequestIdsRemoveGeofenceResult> paramObserver)
  {
    LocationServices.GeofencingApi.removeGeofences(paramGoogleApiClient, this.geofenceRequestIds).setResultCallback(new ResultCallback()
    {
      public void onResult(Status paramAnonymousStatus)
      {
        RemoveGeofencesResult.RequestIdsRemoveGeofenceResult localRequestIdsRemoveGeofenceResult = new RemoveGeofencesResult.RequestIdsRemoveGeofenceResult(paramAnonymousStatus.getStatusCode(), RemoveGeofenceRequestIdsObservable.this.geofenceRequestIds);
        if (localRequestIdsRemoveGeofenceResult.isSuccess())
        {
          paramObserver.onNext(localRequestIdsRemoveGeofenceResult);
          paramObserver.onCompleted();
          return;
        }
        paramObserver.onError(new RemoveGeofencesException(localRequestIdsRemoveGeofenceResult.getStatusCode()));
      }
    });
  }
}