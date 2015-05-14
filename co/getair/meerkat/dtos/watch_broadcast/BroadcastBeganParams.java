package co.getair.meerkat.dtos.watch_broadcast;

import co.getair.meerkat.utilities.RunnableWithResultObject;

public class BroadcastBeganParams
{
  String caption;
  String link;
  String locationText;
  String shareText;
  RunnableWithResultObject tweetCompletion;

  public BroadcastBeganParams(String paramString1, String paramString2, String paramString3, String paramString4, RunnableWithResultObject paramRunnableWithResultObject)
  {
    this.caption = paramString1;
    this.link = paramString2;
    this.locationText = paramString3;
    this.shareText = paramString4;
    this.tweetCompletion = paramRunnableWithResultObject;
  }

  public String getCaption()
  {
    return this.caption;
  }

  public String getLink()
  {
    return this.link;
  }

  public String getLocationText()
  {
    return this.locationText;
  }

  public String getShareText()
  {
    return this.shareText;
  }

  public RunnableWithResultObject getTweetCompletion()
  {
    return this.tweetCompletion;
  }
}