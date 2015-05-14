package co.getair.meerkat.dtos.twitter;

public class ReplyParams
{
  String content;
  String originalTweetUsername;
  String tweetId;

  public ReplyParams(String paramString1, String paramString2, String paramString3)
  {
    this.content = paramString1;
    this.tweetId = paramString2;
    this.originalTweetUsername = paramString3;
  }

  public String getContent()
  {
    return this.content;
  }

  public String getOriginalTweetUsername()
  {
    return this.originalTweetUsername;
  }

  public String getTweetId()
  {
    return this.tweetId;
  }
}