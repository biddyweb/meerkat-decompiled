package co.getair.meerkat.dtos.watch_broadcast;

public class Watcher
{
  public String displayName;
  public String follow;
  public String id;
  public String photoHiResUrl;
  public String photoUrl;
  public String profile;
  public String profileThumbImage;
  public String username;

  public boolean equals(Object paramObject)
  {
    Watcher localWatcher = (Watcher)paramObject;
    return this.id.equals(localWatcher.id);
  }

  public int hashCode()
  {
    int i = 7;
    for (int j = 0; j < this.id.length(); j++)
      i = i * 31 + this.id.charAt(j);
    return i;
  }
}