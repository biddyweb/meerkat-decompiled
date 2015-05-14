package co.getair.meerkat.dtos.watch_broadcast;

import co.getair.meerkat.dtos.User;
import com.google.gson.annotations.SerializedName;

public class BroadcastActivity
{
  String message;
  String title;

  @SerializedName("watcher")
  User user;

  public String getMessage()
  {
    return this.message;
  }

  public String getTitle()
  {
    return this.title;
  }

  public String getUsername()
  {
    return this.user.getUsername();
  }
}