package co.getair.meerkat.proxies;

import android.content.Context;
import co.getair.meerkat.ApiProxy;
import co.getair.meerkat.commands.stream_participation.StartGettingActivitiesCommand;
import co.getair.meerkat.commands.stream_participation.StartGettingWatchersCommand;
import co.getair.meerkat.commands.stream_participation.StopGettingWatchersCommand;
import co.getair.meerkat.dtos.MixpanelEventParams;
import co.getair.meerkat.dtos.feed.LiveBroadcastSummary;
import co.getair.meerkat.dtos.watch_broadcast.Broadcaster;
import co.getair.meerkat.utilities.ApiAuthorizedRequest;
import co.getair.meerkat.utilities.ApplicationPreferences;
import co.getair.meerkat.utilities.MLog;
import co.getair.meerkat.utilities.NetworkQueue;
import co.getair.meerkat.utilities.RunnableWithResultObject;
import com.android.volley.Response.ErrorListener;
import com.android.volley.Response.Listener;
import com.android.volley.VolleyError;
import com.google.common.base.Optional;
import com.google.common.cache.Cache;
import com.google.common.cache.CacheBuilder;
import com.google.gson.Gson;
import java.util.HashMap;
import java.util.concurrent.TimeUnit;
import org.json.JSONException;
import org.json.JSONObject;
import org.puremvc.java.multicore.patterns.facade.Facade;
import org.puremvc.java.multicore.patterns.proxy.Proxy;

public class WatchProxy extends Proxy
{
  private static final String COMMENTS_KEY = "comments";
  private static final String LIKE_STREAM_KEY = "likes";
  private static final String LOG_TAG = "WatchProxy";
  private static final String PLAYLIST_KEY = "playlist";
  private static final String REPORTS_KEY = "reports";
  private static final String RESTREAM_KEY = "restreams";
  private static final Cache<String, Boolean> broadcastStateCache = CacheBuilder.newBuilder().expireAfterWrite(24L, TimeUnit.HOURS).build();
  private LiveBroadcastSummary broadcastSummary;
  private Context context;
  private HashMap<String, String> followupActions;
  private String streamId;

  public WatchProxy(String paramString1, Context paramContext, String paramString2)
  {
    super(paramString1, paramContext);
    this.streamId = paramString2;
    this.context = paramContext;
  }

  private void addCommands()
  {
    getFacade().registerCommand("commandStartGettingStreamActivities", new StartGettingActivitiesCommand());
    getFacade().registerCommand("commandStartGettingWatchers", new StartGettingWatchersCommand());
    getFacade().registerCommand("commandStopGettingWatchers", new StopGettingWatchersCommand());
  }

  private void addProxies(String paramString)
  {
    StreamActivitiesProxy localStreamActivitiesProxy = new StreamActivitiesProxy(this.context, this.followupActions);
    getFacade().registerProxy(localStreamActivitiesProxy);
    StreamWatchersProxy localStreamWatchersProxy = new StreamWatchersProxy(this.context, this.followupActions);
    getFacade().registerProxy(localStreamWatchersProxy);
    StreamCommentsProxy localStreamCommentsProxy = new StreamCommentsProxy(this.context, paramString, this.followupActions, getTweetId(), getBroadcasterUsername());
    getFacade().registerProxy(localStreamCommentsProxy);
  }

  private String getCommentsCacheKey()
  {
    Object[] arrayOfObject = new Object[1];
    arrayOfObject[0] = this.streamId;
    return String.format("comment-%s", arrayOfObject);
  }

  private String getLikeCacheKey()
  {
    Object[] arrayOfObject = new Object[1];
    arrayOfObject[0] = this.streamId;
    return String.format("like-%s", arrayOfObject);
  }

  private String getRestreamCacheKey()
  {
    Object[] arrayOfObject = new Object[1];
    arrayOfObject[0] = this.streamId;
    return String.format("restream-%s", arrayOfObject);
  }

  public void addMeAsWatcher()
  {
    final String str = new ApplicationPreferences(this.context.getApplicationContext()).getAddWatcherTemplate().replace("{broadcastId}", this.streamId);
    ApiAuthorizedRequest localApiAuthorizedRequest = new ApiAuthorizedRequest(1, str, "", new Response.Listener()
    {
      public void onResponse(JSONObject paramAnonymousJSONObject)
      {
        try
        {
          MLog.i("WatchProxy", paramAnonymousJSONObject.toString());
          Gson localGson = new Gson();
          WatchProxy.access$002(WatchProxy.this, (HashMap)localGson.fromJson(paramAnonymousJSONObject.getJSONObject("followupActions").toString(), HashMap.class));
          JSONObject localJSONObject = paramAnonymousJSONObject.getJSONObject("result");
          localJSONObject.put("id", WatchProxy.this.streamId);
          WatchProxy.access$202(WatchProxy.this, (LiveBroadcastSummary)localGson.fromJson(localJSONObject.toString(), LiveBroadcastSummary.class));
          String str = (String)WatchProxy.this.followupActions.get("playlist");
          WatchProxy.this.addProxies(str);
          WatchProxy.this.addCommands();
          WatchProxy.this.sendNotification("commandStartGettingStreamActivities", null, null);
          WatchProxy.this.sendNotification("commandStartGettingWatchers", null, null);
          WatchProxy.this.sendNotification("eventPlaylistArrived", str, null);
          WatchProxy.this.sendNotification("eventBroadcastInfoArrived", WatchProxy.this.broadcastSummary, null);
          WatchProxy.this.sendNotification("timeEventForMixpanel", "watch", null);
          WatchProxy.this.sendNotification("incrementPeopleProperty", "watch count", null);
          return;
        }
        catch (JSONException localJSONException)
        {
          MLog.e("WatchProxy", localJSONException.toString());
        }
      }
    }
    , new Response.ErrorListener()
    {
      public void onErrorResponse(VolleyError paramAnonymousVolleyError)
      {
        MLog.e("WatchProxy", paramAnonymousVolleyError.toString());
      }
    });
    NetworkQueue.getInstance(this.context).addToRequestQueue(localApiAuthorizedRequest);
  }

  public boolean didComment()
  {
    return ((Boolean)Optional.fromNullable(broadcastStateCache.getIfPresent(getCommentsCacheKey())).or(Boolean.FALSE)).booleanValue();
  }

  public boolean didLikeStream()
  {
    return ((Boolean)Optional.fromNullable(broadcastStateCache.getIfPresent(getLikeCacheKey())).or(Boolean.FALSE)).booleanValue();
  }

  public boolean didRestream()
  {
    return ((Boolean)Optional.fromNullable(broadcastStateCache.getIfPresent(getRestreamCacheKey())).or(Boolean.FALSE)).booleanValue();
  }

  public LiveBroadcastSummary getBroadcastSummary()
  {
    return this.broadcastSummary;
  }

  public String getBroadcasterUsername()
  {
    return this.broadcastSummary.getBroadcaster().getUsername();
  }

  public String getTweetId()
  {
    return this.broadcastSummary.getTweetId();
  }

  public void likeStream(final RunnableWithResultObject paramRunnableWithResultObject)
  {
    broadcastStateCache.put(getLikeCacheKey(), Boolean.TRUE);
    String str1 = ApiProxy.getInstance(this.context).getUrlForFollowupActionKey("addWatcherTemplate");
    String str2 = str1.substring(0, str1.indexOf("/broadcasts"));
    Object[] arrayOfObject = new Object[2];
    arrayOfObject[0] = str2;
    arrayOfObject[1] = this.followupActions.get("likes");
    ApiAuthorizedRequest localApiAuthorizedRequest = new ApiAuthorizedRequest(1, String.format("%s%s", arrayOfObject), "", new Response.Listener()
    {
      public void onResponse(JSONObject paramAnonymousJSONObject)
      {
        paramRunnableWithResultObject.success = true;
        paramRunnableWithResultObject.run();
      }
    }
    , new Response.ErrorListener()
    {
      public void onErrorResponse(VolleyError paramAnonymousVolleyError)
      {
        MLog.e("WatchProxy", paramAnonymousVolleyError.toString());
        paramRunnableWithResultObject.success = false;
        paramRunnableWithResultObject.run();
      }
    });
    NetworkQueue.getInstance(this.context).addToRequestQueue(localApiAuthorizedRequest);
  }

  public void onRemove()
  {
    try
    {
      JSONObject localJSONObject = new JSONObject();
      localJSONObject.put("stream id", this.streamId);
      localJSONObject.put("broadcaster id", this.broadcastSummary.getBroadcaster().getId());
      localJSONObject.put("did like", didLikeStream());
      localJSONObject.put("did restream", didRestream());
      localJSONObject.put("did comment", didComment());
      MixpanelEventParams localMixpanelEventParams = new MixpanelEventParams("watch", localJSONObject);
      getFacade().sendNotification("trackMixpanelEvent", localMixpanelEventParams, null);
      ApiAuthorizedRequest localApiAuthorizedRequest = new ApiAuthorizedRequest(3, new ApplicationPreferences(this.context.getApplicationContext()).getAddWatcherTemplate().replace("{broadcastId}", this.streamId), "", new Response.Listener()
      {
        public void onResponse(JSONObject paramAnonymousJSONObject)
        {
        }
      }
      , new Response.ErrorListener()
      {
        public void onErrorResponse(VolleyError paramAnonymousVolleyError)
        {
          MLog.e("WatchProxy", paramAnonymousVolleyError.toString());
        }
      });
      NetworkQueue.getInstance(this.context).addToRequestQueue(localApiAuthorizedRequest);
      super.onRemove();
      return;
    }
    catch (Exception localException)
    {
      while (true)
        localException.printStackTrace();
    }
  }

  public void reportStream(final RunnableWithResultObject paramRunnableWithResultObject)
  {
    String str1 = ApiProxy.getInstance(this.context).getUrlForFollowupActionKey("addWatcherTemplate");
    String str2 = str1.substring(0, str1.indexOf("/broadcasts"));
    Object[] arrayOfObject = new Object[2];
    arrayOfObject[0] = str2;
    arrayOfObject[1] = this.followupActions.get("reports");
    ApiAuthorizedRequest localApiAuthorizedRequest = new ApiAuthorizedRequest(1, String.format("%s%s", arrayOfObject), "", new Response.Listener()
    {
      public void onResponse(JSONObject paramAnonymousJSONObject)
      {
        paramRunnableWithResultObject.success = true;
        paramRunnableWithResultObject.run();
      }
    }
    , new Response.ErrorListener()
    {
      public void onErrorResponse(VolleyError paramAnonymousVolleyError)
      {
        MLog.e("WatchProxy", paramAnonymousVolleyError.toString());
        paramRunnableWithResultObject.success = false;
        paramRunnableWithResultObject.run();
      }
    });
    NetworkQueue.getInstance(this.context).addToRequestQueue(localApiAuthorizedRequest);
  }

  public void restreamVideo(String paramString, final RunnableWithResultObject paramRunnableWithResultObject)
  {
    broadcastStateCache.put(getRestreamCacheKey(), Boolean.TRUE);
    String str1 = ApiProxy.getInstance(this.context).getUrlForFollowupActionKey("addWatcherTemplate");
    String str2 = str1.substring(0, str1.indexOf("/broadcasts"));
    String str3 = str2 + (String)this.followupActions.get("restreams");
    JSONObject localJSONObject = new JSONObject();
    try
    {
      localJSONObject.put("type", "restream and retweet");
      ApiAuthorizedRequest localApiAuthorizedRequest = new ApiAuthorizedRequest(1, str3, localJSONObject, new Response.Listener()
      {
        public void onResponse(JSONObject paramAnonymousJSONObject)
        {
          paramRunnableWithResultObject.success = true;
          paramRunnableWithResultObject.run();
        }
      }
      , new Response.ErrorListener()
      {
        public void onErrorResponse(VolleyError paramAnonymousVolleyError)
        {
          MLog.e("WatchProxy", paramAnonymousVolleyError.toString());
          paramRunnableWithResultObject.success = false;
          paramRunnableWithResultObject.run();
        }
      });
      NetworkQueue.getInstance(this.context).addToRequestQueue(localApiAuthorizedRequest);
      return;
    }
    catch (JSONException localJSONException)
    {
      while (true)
        MLog.e("Error adding type to restream JSON request");
    }
  }

  public void setStreamCommented()
  {
    broadcastStateCache.put(getCommentsCacheKey(), Boolean.TRUE);
  }
}