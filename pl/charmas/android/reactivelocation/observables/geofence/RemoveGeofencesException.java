package pl.charmas.android.reactivelocation.observables.geofence;

public class RemoveGeofencesException extends Throwable
{
  private final int statusCode;

  RemoveGeofencesException(int paramInt)
  {
    super("Error removing geofences.");
    this.statusCode = paramInt;
  }

  public int getStatusCode()
  {
    return this.statusCode;
  }
}