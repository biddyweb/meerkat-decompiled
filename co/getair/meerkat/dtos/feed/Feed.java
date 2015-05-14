package co.getair.meerkat.dtos.feed;

import java.util.ArrayList;
import java.util.HashMap;

public class Feed
{
  private String broadcastUrl;
  private String id;
  private ArrayList<String> influencerIds;

  public Feed(HashMap<String, Object> paramHashMap)
  {
    if (paramHashMap.containsKey("id"))
      this.id = ((String)paramHashMap.get("id"));
    if (paramHashMap.containsKey("broadcast"))
      this.broadcastUrl = ((String)paramHashMap.get("broadcast"));
    if (paramHashMap.containsKey("influencers"))
      this.influencerIds = ((ArrayList)paramHashMap.get("influencers"));
  }

  public String getBroadcastUrl()
  {
    return this.broadcastUrl;
  }

  public String getId()
  {
    return this.id;
  }

  public ArrayList<String> getInfluencerIds()
  {
    return this.influencerIds;
  }

  public void setBroadcastUrl(String paramString)
  {
    this.broadcastUrl = paramString;
  }

  public void setId(String paramString)
  {
    this.id = paramString;
  }

  public void setInfluencerIds(ArrayList<String> paramArrayList)
  {
    this.influencerIds = paramArrayList;
  }
}