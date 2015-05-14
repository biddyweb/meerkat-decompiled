package co.getair.meerkat.dtos;

public class FollowUser
  implements IUserToFollow
{
  String displayName;
  String follow;
  String followers;
  String following;
  String id;
  String profile;
  String profileImage;
  String profileThumbImage;
  String report;
  int score;
  String username;

  public String getDisplayName()
  {
    return this.displayName;
  }

  public String getFollow()
  {
    return this.follow;
  }

  public String getFollowUrl()
  {
    return this.follow;
  }

  public String getFollowers()
  {
    return this.followers;
  }

  public String getFollowing()
  {
    return this.following;
  }

  public String getId()
  {
    return this.id;
  }

  public String getProfile()
  {
    return this.profile;
  }

  public String getProfileImage()
  {
    return this.profileImage;
  }

  public String getProfileThumbImage()
  {
    return this.profileThumbImage;
  }

  public String getReport()
  {
    return this.report;
  }

  public int getScore()
  {
    return this.score;
  }

  public String getTwitterHandle()
  {
    return "@" + getUsername();
  }

  public String getUsername()
  {
    return this.username;
  }
}