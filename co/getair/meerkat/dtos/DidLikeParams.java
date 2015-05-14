package co.getair.meerkat.dtos;

public class DidLikeParams
{
  String tweetId;

  public DidLikeParams(String paramString)
  {
    this.tweetId = paramString;
  }

  public String getTweetId()
  {
    return this.tweetId;
  }
}