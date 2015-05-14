package co.getair.meerkat.dtos.twitter;

import co.getair.meerkat.utilities.RunnableWithResultObject;

public class TweetParams
{
  RunnableWithResultObject completion;
  String tweetText;

  public TweetParams(RunnableWithResultObject paramRunnableWithResultObject, String paramString)
  {
    this.completion = paramRunnableWithResultObject;
    this.tweetText = paramString;
  }

  public RunnableWithResultObject getCompletion()
  {
    return this.completion;
  }

  public String getTweetText()
  {
    return this.tweetText;
  }
}