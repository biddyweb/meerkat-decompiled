package co.getair.meerkat.dtos;

public class DidSubscribeParams
{
  String tweetId;

  public DidSubscribeParams(String paramString)
  {
    this.tweetId = paramString;
  }

  public String getTweetId()
  {
    return this.tweetId;
  }
}