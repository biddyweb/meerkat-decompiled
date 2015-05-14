package co.getair.meerkat.dtos.feed;

import co.getair.meerkat.utilities.MLog;
import com.google.common.collect.Lists;
import java.lang.reflect.Constructor;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class FeedStreams
{
  private final String LOG_TAG = "FeedLiveStreams";
  private List<FeedStream> feedStreams = Lists.newArrayList();

  public FeedStreams(List<HashMap<String, Object>> paramList, Class<? extends FeedStream> paramClass)
  {
    try
    {
      Constructor localConstructor = paramClass.getConstructor(new Class[] { HashMap.class });
      Iterator localIterator = paramList.iterator();
      while (localIterator.hasNext())
      {
        FeedStream localFeedStream = (FeedStream)localConstructor.newInstance(new Object[] { (Map)localIterator.next() });
        this.feedStreams.add(localFeedStream);
      }
    }
    catch (Exception localException)
    {
      MLog.e(localException.getMessage());
    }
  }

  public List<FeedStream> filterRelevantStreams(boolean paramBoolean)
  {
    if (paramBoolean)
    {
      localObject = Lists.newArrayList();
      Iterator localIterator = this.feedStreams.iterator();
      while (localIterator.hasNext())
      {
        FeedStream localFeedStream = (FeedStream)localIterator.next();
        if (localFeedStream.getTopInfluencer() != null)
          ((List)localObject).add(localFeedStream);
      }
    }
    Object localObject = this.feedStreams;
    return localObject;
  }
}