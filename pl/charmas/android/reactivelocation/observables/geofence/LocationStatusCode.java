package pl.charmas.android.reactivelocation.observables.geofence;

public enum LocationStatusCode
{
  private final String name;
  private final int statusCode;

  static
  {
    ERROR = new LocationStatusCode("ERROR", 1, 1, "ERROR");
    GEOFENCE_NOT_AVAILABLE = new LocationStatusCode("GEOFENCE_NOT_AVAILABLE", 2, 1000, "GEOFENCE_NOT_AVAILABLE");
    GEOFENCE_TOO_MANY_PENDING_INTENTS = new LocationStatusCode("GEOFENCE_TOO_MANY_PENDING_INTENTS", 3, 1002, "GEOFENCE_TOO_MANY_PENDING_INTENTS");
    GEOFENCE_TOO_MANY_GEOFENCES = new LocationStatusCode("GEOFENCE_TOO_MANY_GEOFENCES", 4, 1002, "GEOFENCE_TOO_MANY_PENDING_INTENTS");
    UNKNOWN = new LocationStatusCode("UNKNOWN", 5, -1, "STATUS_CODE_UNKNOWN");
    LocationStatusCode[] arrayOfLocationStatusCode = new LocationStatusCode[6];
    arrayOfLocationStatusCode[0] = SUCCESS;
    arrayOfLocationStatusCode[1] = ERROR;
    arrayOfLocationStatusCode[2] = GEOFENCE_NOT_AVAILABLE;
    arrayOfLocationStatusCode[3] = GEOFENCE_TOO_MANY_PENDING_INTENTS;
    arrayOfLocationStatusCode[4] = GEOFENCE_TOO_MANY_GEOFENCES;
    arrayOfLocationStatusCode[5] = UNKNOWN;
  }

  private LocationStatusCode(int paramInt, String paramString)
  {
    this.statusCode = paramInt;
    this.name = paramString;
  }

  static LocationStatusCode fromCode(int paramInt)
  {
    for (LocationStatusCode localLocationStatusCode : values())
      if (localLocationStatusCode.statusCode == paramInt)
        return localLocationStatusCode;
    return UNKNOWN;
  }

  public String getName()
  {
    return this.name;
  }

  public int getStatusCode()
  {
    return this.statusCode;
  }
}