package co.getair.meerkat.dtos.watch_broadcast;

import com.google.gson.annotations.SerializedName;

public class Broadcaster
{
  String displayName;
  String id;

  @SerializedName("image")
  String imageUrl;

  @SerializedName("name")
  String username;

  public String getDisplayName()
  {
    return this.displayName;
  }

  public String getId()
  {
    return this.id;
  }

  public String getImageUrl()
  {
    return this.imageUrl;
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