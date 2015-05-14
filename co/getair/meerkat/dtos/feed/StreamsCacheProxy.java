package co.getair.meerkat.dtos.feed;

import com.google.common.cache.Cache;
import com.google.common.cache.CacheBuilder;
import java.util.concurrent.TimeUnit;
import org.puremvc.java.multicore.patterns.proxy.Proxy;

public class StreamsCacheProxy extends Proxy
{
  private static final String NAME = "StreamsCacheProxy";
  private static StreamsCacheProxy instance;
  private static final Cache<String, StreamFeedItemProxy> streamsTinyCache = CacheBuilder.newBuilder().expireAfterWrite(30L, TimeUnit.SECONDS).build();

  private StreamsCacheProxy(String paramString)
  {
    super(paramString);
  }

  public static StreamsCacheProxy getInstance()
  {
    try
    {
      if (instance == null)
        instance = new StreamsCacheProxy("StreamsCacheProxy");
      StreamsCacheProxy localStreamsCacheProxy = instance;
      return localStreamsCacheProxy;
    }
    finally
    {
    }
  }

  public static String getName()
  {
    return "StreamsCacheProxy";
  }

  public StreamFeedLiveItemProxy getLiveStreamById(String paramString)
  {
    return (StreamFeedLiveItemProxy)streamsTinyCache.getIfPresent("live_" + paramString);
  }

  public StreamFeedScheduledItemProxy getScheduledStreamById(String paramString)
  {
    return (StreamFeedScheduledItemProxy)streamsTinyCache.getIfPresent("scheduled_" + paramString);
  }

  public void invalidateScheduledStream(String paramString)
  {
    streamsTinyCache.invalidate("scheduled_" + paramString);
  }

  public void storeLive(StreamFeedLiveItemProxy paramStreamFeedLiveItemProxy)
  {
    streamsTinyCache.put("live_" + paramStreamFeedLiveItemProxy.getBroadcastSummary().getId(), paramStreamFeedLiveItemProxy);
  }

  public void storeScheduled(StreamFeedScheduledItemProxy paramStreamFeedScheduledItemProxy)
  {
    streamsTinyCache.put("scheduled_" + paramStreamFeedScheduledItemProxy.getBroadcastSummary().getId(), paramStreamFeedScheduledItemProxy);
  }
}