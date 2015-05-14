package co.getair.meerkat.dtos.feed;

import android.content.Context;
import co.getair.meerkat.dtos.Influencer;
import com.google.common.base.Preconditions;
import java.util.HashMap;

public class StreamFeedLiveItemProxy extends StreamFeedItemProxy<LiveBroadcastSummary>
{
  LiveBroadcastSummary broadcastSummary = null;

  public StreamFeedLiveItemProxy(String paramString, Context paramContext, int paramInt, boolean paramBoolean, LiveBroadcastSummary paramLiveBroadcastSummary, Influencer paramInfluencer, HashMap<String, String> paramHashMap)
  {
    super(paramString, paramContext, paramInt, paramBoolean, paramLiveBroadcastSummary.getId(), paramInfluencer, paramHashMap);
    Preconditions.checkNotNull(paramLiveBroadcastSummary);
    this.broadcastSummary = paramLiveBroadcastSummary;
  }

  public int compareTo(StreamFeedItemProxy paramStreamFeedItemProxy)
  {
    int i = getScore();
    int j = paramStreamFeedItemProxy.getScore();
    if (i > j)
      return -1;
    if (i < j)
      return 1;
    return 0;
  }

  public LiveBroadcastSummary getBroadcastSummary()
  {
    return this.broadcastSummary;
  }

  public int getScore()
  {
    return super.getScore() + this.broadcastSummary.getLikesCount();
  }

  public StreamFeedItemProxy.Type getType()
  {
    return StreamFeedItemProxy.Type.Live;
  }
}