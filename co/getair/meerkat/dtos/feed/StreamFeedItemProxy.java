package co.getair.meerkat.dtos.feed;

import android.content.Context;
import co.getair.meerkat.dtos.Influencer;
import co.getair.meerkat.dtos.Session;
import co.getair.meerkat.utilities.ApiAuthorizedRequest;
import co.getair.meerkat.utilities.MLog;
import co.getair.meerkat.utilities.NetworkQueue;
import co.getair.meerkat.utilities.RunnableWithResultObject;
import com.android.volley.Response.ErrorListener;
import com.android.volley.Response.Listener;
import com.android.volley.VolleyError;
import java.util.HashMap;
import org.json.JSONObject;
import org.puremvc.java.multicore.patterns.proxy.Proxy;

public abstract class StreamFeedItemProxy<T extends BroadcastSummary> extends Proxy
  implements Comparable<StreamFeedItemProxy>
{
  protected final String RESTREAM_URL_KEY = "restreams";
  protected final String SUBSCRIBE_URL_KEY = "subscribe";
  protected final String UNSUBSCRIBE_URL_KEY = "unsubscribe";
  protected Context context;
  boolean didRestream = false;
  HashMap<String, String> followupActions;
  Influencer influencer = null;
  String streamId = "";
  int version = 0;

  public StreamFeedItemProxy(String paramString1, Context paramContext, int paramInt, boolean paramBoolean, String paramString2, Influencer paramInfluencer, HashMap<String, String> paramHashMap)
  {
    super(paramString1);
    this.streamId = paramString2;
    this.didRestream = paramBoolean;
    this.version = paramInt;
    this.influencer = paramInfluencer;
    this.followupActions = paramHashMap;
    this.context = paramContext;
  }

  public boolean didRestream()
  {
    return this.didRestream;
  }

  public abstract T getBroadcastSummary();

  public HashMap<String, String> getFollowupActions()
  {
    return this.followupActions;
  }

  public Influencer getInfluencer()
  {
    return this.influencer;
  }

  public int getScore()
  {
    if (this.influencer != null);
    switch (9.$SwitchMap$co$getair$meerkat$dtos$Influencer$Type[this.influencer.getType().ordinal()])
    {
    default:
      return 0;
    case 1:
      return 10000;
    case 2:
      return 2000;
    case 3:
      return 1000;
    case 4:
    }
    return 5000;
  }

  public abstract Type getType();

  public void restreamSchduledStream(final RunnableWithResultObject paramRunnableWithResultObject)
  {
    Object[] arrayOfObject = new Object[2];
    arrayOfObject[0] = this.followupActions.get("restreams");
    arrayOfObject[1] = Session.loadSession(this.context).getAuthToken();
    ApiAuthorizedRequest localApiAuthorizedRequest = new ApiAuthorizedRequest(1, String.format("%s?auth=%s", arrayOfObject), "", new Response.Listener()
    {
      public void onResponse(JSONObject paramAnonymousJSONObject)
      {
        MLog.e("restream successfully");
        paramRunnableWithResultObject.success = true;
        paramRunnableWithResultObject.run();
      }
    }
    , new Response.ErrorListener()
    {
      public void onErrorResponse(VolleyError paramAnonymousVolleyError)
      {
        MLog.e("FAILED restream");
        paramRunnableWithResultObject.success = false;
        paramRunnableWithResultObject.run();
      }
    });
    NetworkQueue.getInstance(this.context).addToRequestQueue(localApiAuthorizedRequest);
  }

  public void setDidRestream(boolean paramBoolean)
  {
    this.didRestream = paramBoolean;
  }

  public void subscribeToSchduledStream(final RunnableWithResultObject paramRunnableWithResultObject)
  {
    Object[] arrayOfObject = new Object[2];
    arrayOfObject[0] = this.followupActions.get("subscribe");
    arrayOfObject[1] = Session.loadSession(this.context).getAuthToken();
    ApiAuthorizedRequest localApiAuthorizedRequest = new ApiAuthorizedRequest(1, String.format("%s?auth=%s", arrayOfObject), "", new Response.Listener()
    {
      public void onResponse(JSONObject paramAnonymousJSONObject)
      {
        MLog.e("Subscribed successfully");
        paramRunnableWithResultObject.success = true;
        paramRunnableWithResultObject.run();
      }
    }
    , new Response.ErrorListener()
    {
      public void onErrorResponse(VolleyError paramAnonymousVolleyError)
      {
        MLog.e("FAILED subscribing");
        paramRunnableWithResultObject.success = false;
        paramRunnableWithResultObject.run();
      }
    });
    NetworkQueue.getInstance(this.context).addToRequestQueue(localApiAuthorizedRequest);
  }

  public void unrestreamScheduledStream()
  {
    Object[] arrayOfObject = new Object[2];
    arrayOfObject[0] = this.followupActions.get("restreams");
    arrayOfObject[1] = Session.loadSession(this.context).getAuthToken();
    ApiAuthorizedRequest localApiAuthorizedRequest = new ApiAuthorizedRequest(3, String.format("%s?auth=%s", arrayOfObject), "", new Response.Listener()
    {
      public void onResponse(JSONObject paramAnonymousJSONObject)
      {
        MLog.e("unrestream successfully");
      }
    }
    , new Response.ErrorListener()
    {
      public void onErrorResponse(VolleyError paramAnonymousVolleyError)
      {
        MLog.e("FAILED unsubscribing");
      }
    });
    NetworkQueue.getInstance(this.context).addToRequestQueue(localApiAuthorizedRequest);
  }

  public void unsubscribeToSchduledStream(final Runnable paramRunnable)
  {
    Object[] arrayOfObject = new Object[2];
    arrayOfObject[0] = this.followupActions.get("unsubscribe");
    arrayOfObject[1] = Session.loadSession(this.context).getAuthToken();
    ApiAuthorizedRequest localApiAuthorizedRequest = new ApiAuthorizedRequest(1, String.format("%s?auth=%s", arrayOfObject), "", new Response.Listener()
    {
      public void onResponse(JSONObject paramAnonymousJSONObject)
      {
        MLog.e("Unsubscribed successfully");
        paramRunnable.run();
      }
    }
    , new Response.ErrorListener()
    {
      public void onErrorResponse(VolleyError paramAnonymousVolleyError)
      {
        MLog.e("FAILED unsubscribing");
      }
    });
    NetworkQueue.getInstance(this.context).addToRequestQueue(localApiAuthorizedRequest);
  }

  public static enum Type
  {
    static
    {
      Type[] arrayOfType = new Type[2];
      arrayOfType[0] = Live;
      arrayOfType[1] = Scheduled;
    }
  }
}