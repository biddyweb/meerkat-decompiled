package com.twitter.sdk.android.tweetui;

import com.google.gson.annotations.SerializedName;
import com.twitter.sdk.android.core.internal.scribe.EventNamespace;
import com.twitter.sdk.android.core.internal.scribe.ScribeEvent;

class SyndicationClientEvent extends ScribeEvent
{
  static final String CLIENT_NAME = "tfw";
  private static final String SCRIBE_CATEGORY = "tfw_client_event";

  @SerializedName("external_ids")
  final ExternalIds externalIds;

  @SerializedName("language")
  final String language;

  SyndicationClientEvent(EventNamespace paramEventNamespace, long paramLong, String paramString1, String paramString2)
  {
    super("tfw_client_event", paramEventNamespace, paramLong);
    this.language = paramString1;
    this.externalIds = new ExternalIds(paramString2);
  }

  class ExternalIds
  {

    @SerializedName("6")
    final String adId;

    ExternalIds(String arg2)
    {
      Object localObject;
      this.adId = localObject;
    }
  }
}