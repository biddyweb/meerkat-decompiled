package com.twitter.sdk.android.core.models;

import com.google.gson.annotations.SerializedName;
import java.util.ArrayList;
import java.util.List;

public class Coordinates
{
  public static final int INDEX_LATITUDE = 1;
  public static final int INDEX_LONGITUDE;

  @SerializedName("coordinates")
  public final List<Double> coordinates;

  @SerializedName("type")
  public final String type;

  public Coordinates(Double paramDouble1, Double paramDouble2, String paramString)
  {
    ArrayList localArrayList = new ArrayList(2);
    localArrayList.add(0, paramDouble1);
    localArrayList.add(1, paramDouble2);
    this.coordinates = localArrayList;
    this.type = paramString;
  }

  public Double getLatitude()
  {
    return (Double)this.coordinates.get(1);
  }

  public Double getLongitude()
  {
    return (Double)this.coordinates.get(0);
  }
}