package co.getair.meerkat.dtos;

public class AddCommentParams
{
  String broadcasterUsername;
  String content;
  String originalTweetId;

  public AddCommentParams(String paramString1, String paramString2, String paramString3)
  {
    this.broadcasterUsername = paramString1;
    this.content = paramString2;
    this.originalTweetId = paramString3;
  }

  public String getBroadcasterUsername()
  {
    return this.broadcasterUsername;
  }

  public String getContent()
  {
    return this.content;
  }

  public String getOriginalTweetId()
  {
    return this.originalTweetId;
  }
}