package co.getair.meerkat.dtos;

public abstract interface IUserToFollow
{
  public abstract String getDisplayName();

  public abstract String getFollowUrl();

  public abstract String getId();

  public abstract String getUsername();
}