package pl.charmas.android.reactivelocation.observables.geofence;

import com.google.android.gms.location.GeofenceStatusCodes;

public final class AddGeofenceResult
{
  private final int statusCode;

  AddGeofenceResult(int paramInt)
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
}