package co.getair.meerkat.dtos.twitter;

public class FavoriteParams
{
  String tweetId;

  public FavoriteParams(String paramString)
  {
    this.tweetId = paramString;
  }

  public String getTweetId()
  {
    return this.tweetId;
  }
}