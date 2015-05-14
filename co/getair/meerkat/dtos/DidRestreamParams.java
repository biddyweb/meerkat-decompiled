package co.getair.meerkat.dtos;

public class DidRestreamParams
{
  String tweetId;

  public DidRestreamParams(String paramString)
  {
    this.tweetId = paramString;
  }

  public String getTweetId()
  {
    return this.tweetId;
  }
}