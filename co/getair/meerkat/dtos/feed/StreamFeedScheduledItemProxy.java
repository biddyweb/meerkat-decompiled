package co.getair.meerkat.dtos.feed;

import android.content.Context;
import co.getair.meerkat.dtos.Influencer;
import java.util.HashMap;

public class StreamFeedScheduledItemProxy extends StreamFeedItemProxy<ScheduledBroadcastSummary>
{
  private final ScheduledBroadcastSummary broadcastSummary;

  public StreamFeedScheduledItemProxy(String paramString, Context paramContext, int paramInt, boolean paramBoolean, ScheduledBroadcastSummary paramScheduledBroadcastSummary, Influencer paramInfluencer, HashMap<String, String> paramHashMap)
  {
    super(paramString, paramContext, paramInt, paramBoolean, paramScheduledBroadcastSummary.getId(), paramInfluencer, paramHashMap);
    this.broadcastSummary = paramScheduledBroadcastSummary;
  }

  public int compareTo(StreamFeedItemProxy paramStreamFeedItemProxy)
  {
    if (paramStreamFeedItemProxy.getClass() != paramStreamFeedItemProxy.getClass())
      throw new IllegalArgumentException("Cannot compare different SteamFeedItemProxy types.");
    StreamFeedScheduledItemProxy localStreamFeedScheduledItemProxy = (StreamFeedScheduledItemProxy)paramStreamFeedItemProxy;
    if (this.broadcastSummary.getEndTime() < localStreamFeedScheduledItemProxy.getBroadcastSummary().getEndTime())
      return -1;
    if (this.broadcastSummary.getEndTime() > localStreamFeedScheduledItemProxy.getBroadcastSummary().getEndTime())
      return 1;
    return 0;
  }

  public ScheduledBroadcastSummary getBroadcastSummary()
  {
    return this.broadcastSummary;
  }

  public StreamFeedItemProxy.Type getType()
  {
    return StreamFeedItemProxy.Type.Scheduled;
  }
}