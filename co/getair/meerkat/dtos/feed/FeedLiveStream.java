package co.getair.meerkat.dtos.feed;

import java.util.HashMap;

public class FeedLiveStream extends FeedStream
{
  public FeedLiveStream(HashMap<String, Object> paramHashMap)
  {
    super(paramHashMap);
  }

  protected String getLinkUrlKey()
  {
    return "broadcast";
  }
}