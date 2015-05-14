package com.twitter.sdk.android.core.models;

import com.google.gson.annotations.SerializedName;
import java.util.List;
import java.util.Map;

public class Place
{

  @SerializedName("attributes")
  public final Map<String, String> attributes;

  @SerializedName("bounding_box")
  public final BoundingBox boundingBox;

  @SerializedName("country")
  public final String country;

  @SerializedName("country_code")
  public final String countryCode;

  @SerializedName("full_name")
  public final String fullName;

  @SerializedName("id")
  public final String id;

  @SerializedName("name")
  public final String name;

  @SerializedName("place_type")
  public final String placeType;

  @SerializedName("url")
  public final String url;

  public Place(Map<String, String> paramMap, BoundingBox paramBoundingBox, String paramString1, String paramString2, String paramString3, String paramString4, String paramString5, String paramString6, String paramString7)
  {
    this.attributes = paramMap;
    this.boundingBox = paramBoundingBox;
    this.country = paramString1;
    this.countryCode = paramString2;
    this.fullName = paramString3;
    this.id = paramString4;
    this.name = paramString5;
    this.placeType = paramString6;
    this.url = paramString7;
  }

  public static class BoundingBox
  {

    @SerializedName("coordinates")
    public final List<List<List<Double>>> coordinates;

    @SerializedName("type")
    public final String type;

    public BoundingBox(List<List<List<Double>>> paramList, String paramString)
    {
      this.coordinates = paramList;
      this.type = paramString;
    }
  }
}