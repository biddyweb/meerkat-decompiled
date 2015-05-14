package co.getair.meerkat.proxies;

import android.content.Context;
import android.os.AsyncTask;
import co.getair.meerkat.ApiProxy;
import co.getair.meerkat.dtos.feed.BroadcastSummary;
import co.getair.meerkat.dtos.feed.FeedLiveStream;
import co.getair.meerkat.dtos.feed.FeedScheduledStream;
import co.getair.meerkat.dtos.feed.FeedStream;
import co.getair.meerkat.dtos.feed.FeedStreams;
import co.getair.meerkat.dtos.feed.LiveBroadcastSummary;
import co.getair.meerkat.dtos.feed.ScheduledBroadcastSummary;
import co.getair.meerkat.dtos.feed.StreamFeedItemProxy;
import co.getair.meerkat.dtos.feed.StreamFeedLiveItemProxy;
import co.getair.meerkat.dtos.feed.StreamFeedScheduledItemProxy;
import co.getair.meerkat.dtos.feed.StreamsCacheProxy;
import co.getair.meerkat.utilities.ApiAuthorizedRequest;
import co.getair.meerkat.utilities.MLog;
import co.getair.meerkat.utilities.NetworkQueue;
import com.android.volley.Response.ErrorListener;
import com.android.volley.Response.Listener;
import com.android.volley.VolleyError;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import java.lang.reflect.Type;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import org.json.JSONException;
import org.json.JSONObject;
import org.puremvc.java.multicore.patterns.facade.Facade;
import org.puremvc.java.multicore.patterns.proxy.Proxy;

public class FeedProxy extends Proxy
{
  private static final Gson gson = new Gson();
  private final String GET_LIVE_STREAMS_URL_KEY = "liveNow";
  private final String GET_SCHEDULED_STREAMS_URL_KEY = "scheduledStreams";
  private Context context;

  public FeedProxy(String paramString, Context paramContext)
  {
    super(paramString);
    this.context = paramContext;
  }

  private void notifyStreamArrived(StreamFeedItemProxy paramStreamFeedItemProxy)
  {
    getFacade().sendNotification("newStreamArrived", paramStreamFeedItemProxy, null);
  }

  private void requestStreamSummary(final FeedStream paramFeedStream, final Class<? extends BroadcastSummary> paramClass)
  {
    ApiAuthorizedRequest localApiAuthorizedRequest = new ApiAuthorizedRequest(0, paramFeedStream.getBroadcastSummaryUrl(), new Response.Listener()
    {
      public void onResponse(JSONObject paramAnonymousJSONObject)
      {
        try
        {
          BroadcastSummary localBroadcastSummary = (BroadcastSummary)FeedProxy.gson.fromJson(paramAnonymousJSONObject.getJSONObject("result").toString(), paramClass);
          Type localType = new TypeToken()
          {
          }
          .getType();
          HashMap localHashMap = (HashMap)FeedProxy.gson.fromJson(paramAnonymousJSONObject.getJSONObject("followupActions").toString(), localType);
          Object localObject;
          if (localBroadcastSummary.getStatus().equals("live"))
          {
            localObject = new StreamFeedLiveItemProxy("streamFeedItemProxy", FeedProxy.this.context, 0, paramFeedStream.didIRestream(), (LiveBroadcastSummary)localBroadcastSummary, paramFeedStream.getTopInfluencer(), localHashMap);
            StreamsCacheProxy.getInstance().storeLive((StreamFeedLiveItemProxy)localObject);
          }
          while (true)
          {
            FeedProxy.this.notifyStreamArrived((StreamFeedItemProxy)localObject);
            return;
            if (!localBroadcastSummary.getStatus().equals("schedule"))
              break;
            localObject = new StreamFeedScheduledItemProxy("streamFeedItemProxy", FeedProxy.this.context, 0, paramFeedStream.didIRestream(), (ScheduledBroadcastSummary)localBroadcastSummary, paramFeedStream.getTopInfluencer(), localHashMap);
            StreamsCacheProxy.getInstance().storeScheduled((StreamFeedScheduledItemProxy)localObject);
          }
        }
        catch (JSONException localJSONException)
        {
          MLog.e("FAILED to parse stream info");
        }
      }
    }
    , new Response.ErrorListener()
    {
      public void onErrorResponse(VolleyError paramAnonymousVolleyError)
      {
        MLog.e("FAILED getting live feed");
      }
    });
    NetworkQueue.getInstance(this.context).addToRequestQueue(localApiAuthorizedRequest);
  }

  public void requestLiveStreams(final boolean paramBoolean)
  {
    ApiAuthorizedRequest localApiAuthorizedRequest = new ApiAuthorizedRequest(0, ApiProxy.getInstance(this.context.getApplicationContext()).getUrlForFollowupActionKey("liveNow"), "", new Response.Listener()
    {
      public void onResponse(final JSONObject paramAnonymousJSONObject)
      {
        new AsyncTask()
        {
          protected Void doInBackground(Void[] paramAnonymous2ArrayOfVoid)
          {
            while (true)
            {
              FeedStream localFeedStream;
              try
              {
                Type localType = new TypeToken()
                {
                }
                .getType();
                Iterator localIterator = new FeedStreams((List)FeedProxy.gson.fromJson(paramAnonymousJSONObject.getString("result"), localType), FeedLiveStream.class).filterRelevantStreams(FeedProxy.1.this.val$shouldFilter).iterator();
                if (!localIterator.hasNext())
                  break;
                localFeedStream = (FeedStream)localIterator.next();
                StreamFeedLiveItemProxy localStreamFeedLiveItemProxy = StreamsCacheProxy.getInstance().getLiveStreamById(localFeedStream.getId());
                if (localStreamFeedLiveItemProxy != null)
                {
                  FeedProxy.this.notifyStreamArrived(localStreamFeedLiveItemProxy);
                  continue;
                }
              }
              catch (Exception localException)
              {
                MLog.e("FAILED parsing live feed");
                throw new RuntimeException(localException);
              }
              FeedProxy.this.requestStreamSummary(localFeedStream, LiveBroadcastSummary.class);
            }
            return null;
          }
        }
        .execute(new Void[] { null, null, null });
        FeedProxy.this.sendNotification("feedLiveArrived", null, null);
      }
    }
    , new Response.ErrorListener()
    {
      public void onErrorResponse(VolleyError paramAnonymousVolleyError)
      {
        MLog.e("FAILED getting live feed");
      }
    });
    NetworkQueue.getInstance(this.context).addToRequestQueue(localApiAuthorizedRequest);
  }

  public void requestScheduledStreams(final boolean paramBoolean)
  {
    ApiAuthorizedRequest localApiAuthorizedRequest = new ApiAuthorizedRequest(0, ApiProxy.getInstance(this.context.getApplicationContext()).getUrlForFollowupActionKey("scheduledStreams"), "", new Response.Listener()
    {
      public void onResponse(final JSONObject paramAnonymousJSONObject)
      {
        new AsyncTask()
        {
          protected Void doInBackground(Void[] paramAnonymous2ArrayOfVoid)
          {
            while (true)
            {
              FeedStream localFeedStream;
              try
              {
                Type localType = new TypeToken()
                {
                }
                .getType();
                Iterator localIterator = new FeedStreams((List)FeedProxy.gson.fromJson(paramAnonymousJSONObject.getString("result"), localType), FeedScheduledStream.class).filterRelevantStreams(FeedProxy.3.this.val$shouldFilter).iterator();
                if (!localIterator.hasNext())
                  break;
                localFeedStream = (FeedStream)localIterator.next();
                StreamFeedScheduledItemProxy localStreamFeedScheduledItemProxy = StreamsCacheProxy.getInstance().getScheduledStreamById(localFeedStream.getId());
                if (localStreamFeedScheduledItemProxy != null)
                {
                  FeedProxy.this.notifyStreamArrived(localStreamFeedScheduledItemProxy);
                  continue;
                }
              }
              catch (Exception localException)
              {
                MLog.e("FAILED parsing scheduled feed");
                throw new RuntimeException(localException);
              }
              FeedProxy.this.requestStreamSummary(localFeedStream, ScheduledBroadcastSummary.class);
            }
            return null;
          }
        }
        .execute(new Void[] { null, null, null });
        FeedProxy.this.sendNotification("feedScheduledArrived", null, null);
      }
    }
    , new Response.ErrorListener()
    {
      public void onErrorResponse(VolleyError paramAnonymousVolleyError)
      {
        MLog.e("FAILED getting scheduled feed");
      }
    });
    NetworkQueue.getInstance(this.context).addToRequestQueue(localApiAuthorizedRequest);
  }
}