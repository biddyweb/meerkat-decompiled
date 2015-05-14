package co.getair.meerkat.dtos.feed;

import com.google.common.collect.Lists;
import java.util.List;

public class LiveBroadcastSummary extends BroadcastSummary
{
  public static final String TRENDING_TAG = "trending";
  private List<String> influencers;
  private int likesCount;
  private String location;
  private List<String> tags = Lists.newArrayList();
  private int watchersCount;

  public List<String> getInfluencers()
  {
    return this.influencers;
  }

  public int getLikesCount()
  {
    return this.likesCount;
  }

  public String getLocation()
  {
    return this.location;
  }

  public int getWatchersCount()
  {
    return this.watchersCount;
  }

  public boolean isTrending()
  {
    return this.tags.contains("trending");
  }
}