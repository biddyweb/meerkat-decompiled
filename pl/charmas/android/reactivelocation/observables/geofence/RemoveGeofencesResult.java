package pl.charmas.android.reactivelocation.observables.geofence;

import android.app.PendingIntent;
import com.google.android.gms.location.GeofenceStatusCodes;
import java.util.List;

public abstract class RemoveGeofencesResult
{
  private final int statusCode;

  private RemoveGeofencesResult(int paramInt)
  {
    this.statusCode = paramInt;
  }

  public String getName()
  {
    return GeofenceStatusCodes.getStatusCodeString(this.statusCode);
  }

  public int getStatusCode()
  {
    return this.statusCode;
  }

  public boolean isSuccess()
  {
    return (this.statusCode == 0) || (this.statusCode == -1);
  }

  public static class PendingIntentRemoveGeofenceResult extends RemoveGeofencesResult
  {
    private final PendingIntent pendingIntent;

    PendingIntentRemoveGeofenceResult(int paramInt, PendingIntent paramPendingIntent)
    {
      super(null);
      this.pendingIntent = paramPendingIntent;
    }

    public PendingIntent getPendingIntent()
    {
      return this.pendingIntent;
    }
  }

  public static class RequestIdsRemoveGeofenceResult extends RemoveGeofencesResult
  {
    private final List<String> requestIds;

    RequestIdsRemoveGeofenceResult(int paramInt, List<String> paramList)
    {
      super(null);
      this.requestIds = paramList;
    }

    public List<String> getRequestIds()
    {
      return this.requestIds;
    }
  }
}