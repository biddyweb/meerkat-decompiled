package com.twitter.sdk.android.core.internal.scribe;

import com.google.gson.annotations.SerializedName;

public class SyndicatedSdkImpressionEvent extends ScribeEvent
{
  public static final String CLIENT_NAME = "android";
  private static final String SCRIBE_CATEGORY = "syndicated_sdk_impression";

  @SerializedName("device_id_created_at")
  public final long deviceIdCreatedAt;

  @SerializedName("external_ids")
  public final ExternalIds externalIds;

  @SerializedName("language")
  public final String language;

  public SyndicatedSdkImpressionEvent(EventNamespace paramEventNamespace, long paramLong, String paramString1, String paramString2)
  {
    super("syndicated_sdk_impression", paramEventNamespace, paramLong);
    this.language = paramString1;
    this.externalIds = new ExternalIds(paramString2);
    this.deviceIdCreatedAt = 0L;
  }

  public class ExternalIds
  {

    @SerializedName("AD_ID")
    public final String adId;

    public ExternalIds(String arg2)
    {
      Object localObject;
      this.adId = localObject;
    }
  }
}