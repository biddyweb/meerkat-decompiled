package co.getair.meerkat.dtos.feed;

import java.util.HashMap;

public class FeedScheduledStream extends FeedStream
{
  public FeedScheduledStream(HashMap<String, Object> paramHashMap)
  {
    super(paramHashMap);
  }

  protected String getLinkUrlKey()
  {
    return "summary";
  }
}