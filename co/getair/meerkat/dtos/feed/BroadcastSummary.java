package co.getair.meerkat.dtos.feed;

import co.getair.meerkat.dtos.watch_broadcast.Broadcaster;
import com.google.gson.annotations.SerializedName;
import java.util.List;

public abstract class BroadcastSummary
{
  private List activities;
  private Broadcaster broadcaster;
  private String caption;
  private int commentsCount;

  @SerializedName("cover")
  private String coverImageUrl;
  private long endTime;
  private String id;
  private int restreamsCount;
  private String status;
  private String tweetId;

  public List getActivities()
  {
    return this.activities;
  }

  public Broadcaster getBroadcaster()
  {
    return this.broadcaster;
  }

  public String getCaption()
  {
    return this.caption;
  }

  public Integer getCommentsCount()
  {
    return Integer.valueOf(this.commentsCount);
  }

  public String getCoverImageUrl()
  {
    return this.coverImageUrl;
  }

  public long getEndTime()
  {
    return this.endTime;
  }

  public String getId()
  {
    return this.id;
  }

  public Integer getRestreamsCount()
  {
    return Integer.valueOf(this.restreamsCount);
  }

  public String getStatus()
  {
    return this.status;
  }

  public String getTweetId()
  {
    return this.tweetId;
  }

  public void setRestreamsCount(int paramInt)
  {
    this.restreamsCount = paramInt;
  }
}