package com.twitter.sdk.android.core.internal.scribe;

import com.google.gson.Gson;
import com.google.gson.annotations.SerializedName;
import io.fabric.sdk.android.services.events.EventTransform;
import java.io.IOException;

public class ScribeEvent
{
  private static final String CURRENT_FORMAT_VERSION = "2";

  @SerializedName("_category_")
  private final String category;

  @SerializedName("event_namespace")
  private final EventNamespace eventNamespace;

  @SerializedName("format_version")
  private final String formatVersion;

  @SerializedName("ts")
  private final String timestamp;

  public ScribeEvent(String paramString, EventNamespace paramEventNamespace, long paramLong)
  {
    this.category = paramString;
    this.eventNamespace = paramEventNamespace;
    this.timestamp = String.valueOf(paramLong);
    this.formatVersion = "2";
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    ScribeEvent localScribeEvent;
    do
    {
      return true;
      if ((paramObject == null) || (getClass() != paramObject.getClass()))
        return false;
      localScribeEvent = (ScribeEvent)paramObject;
      if (this.category != null)
      {
        if (this.category.equals(localScribeEvent.category));
      }
      else
        while (localScribeEvent.category != null)
          return false;
      if (this.eventNamespace != null)
      {
        if (this.eventNamespace.equals(localScribeEvent.eventNamespace));
      }
      else
        while (localScribeEvent.eventNamespace != null)
          return false;
      if (this.formatVersion != null)
      {
        if (this.formatVersion.equals(localScribeEvent.formatVersion));
      }
      else
        while (localScribeEvent.formatVersion != null)
          return false;
      if (this.timestamp == null)
        break;
    }
    while (this.timestamp.equals(localScribeEvent.timestamp));
    while (true)
    {
      return false;
      if (localScribeEvent.timestamp == null)
        break;
    }
  }

  public int hashCode()
  {
    int i;
    int k;
    label35: int m;
    if (this.eventNamespace != null)
    {
      i = this.eventNamespace.hashCode();
      int j = i * 31;
      if (this.timestamp == null)
        break label103;
      k = this.timestamp.hashCode();
      m = 31 * (j + k);
      if (this.formatVersion == null)
        break label108;
    }
    label103: label108: for (int n = this.formatVersion.hashCode(); ; n = 0)
    {
      int i1 = 31 * (m + n);
      String str = this.category;
      int i2 = 0;
      if (str != null)
        i2 = this.category.hashCode();
      return i1 + i2;
      i = 0;
      break;
      k = 0;
      break label35;
    }
  }

  public String toString()
  {
    return "event_namespace=" + this.eventNamespace + ", ts=" + this.timestamp + ", format_version=" + this.formatVersion + ", _category_=" + this.category;
  }

  public static class Transform
    implements EventTransform<ScribeEvent>
  {
    private final Gson gson;

    public Transform(Gson paramGson)
    {
      this.gson = paramGson;
    }

    public byte[] toBytes(ScribeEvent paramScribeEvent)
      throws IOException
    {
      return this.gson.toJson(paramScribeEvent).getBytes("UTF-8");
    }
  }
}