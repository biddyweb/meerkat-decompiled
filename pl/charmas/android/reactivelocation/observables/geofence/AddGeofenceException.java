package pl.charmas.android.reactivelocation.observables.geofence;

public class AddGeofenceException extends Throwable
{
  private final AddGeofenceResult addGeofenceResult;

  AddGeofenceException(AddGeofenceResult paramAddGeofenceResult)
  {
    super("Error adding geofences. Status code: " + paramAddGeofenceResult.getName());
    this.addGeofenceResult = paramAddGeofenceResult;
  }

  public AddGeofenceResult getAddGeofenceResult()
  {
    return this.addGeofenceResult;
  }
}