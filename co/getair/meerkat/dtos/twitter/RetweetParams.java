package co.getair.meerkat.dtos.twitter;

public class RetweetParams
{
  String tweetId;

  public RetweetParams(String paramString)
  {
    this.tweetId = paramString;
  }

  public String getTweetId()
  {
    return this.tweetId;
  }
}