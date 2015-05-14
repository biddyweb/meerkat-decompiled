package co.getair.meerkat.dtos.feed;

import co.getair.meerkat.dtos.Influencer;
import co.getair.meerkat.dtos.Influencer.Type;
import co.getair.meerkat.utilities.MLog;
import com.google.common.collect.Lists;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class FeedStream
{
  private final String LOG_TAG = "FeedBroacast";
  private String broadcastSummaryUrl = "";
  private boolean didILike = false;
  private boolean didIRestream = false;
  private String id = "";
  private List<Influencer> influencers = Lists.newArrayList();
  private boolean isMine = false;
  private int score = 0;
  private Influencer topInfluencer = null;

  public FeedStream(Map<String, Object> paramMap)
  {
    try
    {
      this.id = ((String)paramMap.get("id"));
      this.broadcastSummaryUrl = ((String)paramMap.get(getLinkUrlKey()));
      Iterator localIterator = ((List)paramMap.get("influencers")).iterator();
      while (localIterator.hasNext())
      {
        String str = (String)localIterator.next();
        this.influencers.add(new Influencer(str));
      }
    }
    catch (Exception localException)
    {
      MLog.d("FeedBroacast", localException.toString());
      return;
    }
    parseInfluencers();
  }

  private void parseInfluencers()
  {
    Object localObject = null;
    Influencer.Type localType = Influencer.Type.InfluencerTypeNone;
    Iterator localIterator = this.influencers.iterator();
    while (localIterator.hasNext())
    {
      Influencer localInfluencer = (Influencer)localIterator.next();
      if ((localInfluencer.getType() == Influencer.Type.InfluencerTypeLiker) && (localInfluencer.isMe()))
        this.didILike = true;
      if ((localInfluencer.getType() == Influencer.Type.InfluencerTypeRestreamer) && (localInfluencer.isMe()))
        this.didIRestream = true;
      if ((localInfluencer.getType() == Influencer.Type.InfluencerTypeBroadcaster) && (localInfluencer.isMe()))
        this.isMine = true;
      if ((!localInfluencer.isMe()) && (localInfluencer.isRelevantForMe()) && (localInfluencer.getType().ordinal() > localType.ordinal()))
      {
        localType = localInfluencer.getType();
        localObject = localInfluencer;
      }
    }
    this.topInfluencer = localObject;
  }

  public boolean didIRestream()
  {
    return this.didIRestream;
  }

  public String getBroadcastSummaryUrl()
  {
    return this.broadcastSummaryUrl;
  }

  public String getId()
  {
    return this.id;
  }

  protected String getLinkUrlKey()
  {
    return "";
  }

  public int getScore()
  {
    return this.score;
  }

  public Influencer getTopInfluencer()
  {
    return this.topInfluencer;
  }
}