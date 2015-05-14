package com.twitter.sdk.android.core.services.params;

public class Geocode
{
  public final Distance distance;
  public final double latitude;
  public final double longitude;
  public final int radius;

  public Geocode(double paramDouble1, double paramDouble2, int paramInt, Distance paramDistance)
  {
    this.latitude = paramDouble1;
    this.longitude = paramDouble2;
    this.radius = paramInt;
    this.distance = paramDistance;
  }

  public String toString()
  {
    return this.latitude + "," + this.longitude + "," + this.radius + this.distance.identifier;
  }

  public static enum Distance
  {
    public final String identifier;

    static
    {
      KILOMETERS = new Distance("KILOMETERS", 1, "km");
      Distance[] arrayOfDistance = new Distance[2];
      arrayOfDistance[0] = MILES;
      arrayOfDistance[1] = KILOMETERS;
    }

    private Distance(String paramString)
    {
      this.identifier = paramString;
    }
  }
}