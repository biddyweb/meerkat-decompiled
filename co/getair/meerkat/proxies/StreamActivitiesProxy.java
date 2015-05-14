package co.getair.meerkat.proxies;

import android.content.Context;
import co.getair.meerkat.dtos.watch_broadcast.BroadcastActivity;
import co.getair.meerkat.dtos.watch_broadcast.StreamStats;
import co.getair.meerkat.dtos.watch_broadcast.WatchersCountParams;
import co.getair.meerkat.utilities.ApiAuthorizedRequest;
import co.getair.meerkat.utilities.MLog;
import co.getair.meerkat.utilities.NetworkQueue;
import com.android.volley.NetworkResponse;
import com.android.volley.ParseError;
import com.android.volley.Response;
import com.android.volley.Response.ErrorListener;
import com.android.volley.Response.Listener;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.HttpHeaderParser;
import com.google.gson.Gson;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.puremvc.java.multicore.patterns.facade.Facade;
import org.puremvc.java.multicore.patterns.proxy.Proxy;

public class StreamActivitiesProxy extends Proxy
{
  private static final String GET_ACTIVITIES_KEY = "activities";
  private static final String LOG_TAG = "StreamActivitiesProxy";
  private static final String NAME = "StreamActivitiesProxy";
  private Context context;
  private String getActivitiesUrl;
  private int lastActivitiesCount = 0;
  private ScheduledFuture scheduledFuture;
  private ScheduledExecutorService worker;

  public StreamActivitiesProxy(Context paramContext, HashMap<String, String> paramHashMap)
  {
    super("StreamActivitiesProxy");
    this.context = paramContext;
    this.getActivitiesUrl = ((String)paramHashMap.get("activities"));
    this.worker = Executors.newSingleThreadScheduledExecutor();
  }

  public static String NAME()
  {
    return "StreamActivitiesProxy";
  }

  private void reactivateGetActivities(int paramInt)
  {
    Runnable local4 = new Runnable()
    {
      public void run()
      {
        StreamActivitiesProxy.this.getActivities();
      }
    };
    if (this.scheduledFuture != null)
      this.scheduledFuture.cancel(false);
    if ((this.worker != null) && (!this.worker.isShutdown()))
      this.scheduledFuture = this.worker.schedule(local4, paramInt, TimeUnit.SECONDS);
  }

  public void getActivities()
  {
    ApiAuthorizedRequest local3 = new ApiAuthorizedRequest(0, this.getActivitiesUrl, "", new Response.Listener()
    {
      public void onResponse(JSONObject paramAnonymousJSONObject)
      {
        while (true)
        {
          try
          {
            MLog.i("StreamActivitiesProxy", paramAnonymousJSONObject.toString());
            JSONObject localJSONObject1 = paramAnonymousJSONObject.getJSONObject("result");
            int i = localJSONObject1.getInt("activitiesCount");
            int j = localJSONObject1.getInt("expiry");
            JSONArray localJSONArray1 = localJSONObject1.getJSONArray("activities");
            String str = localJSONObject1.getString("status");
            int k = localJSONObject1.getInt("watchersCount");
            int m = localJSONObject1.getInt("webWatchersCount");
            int n = localJSONObject1.getInt("totalWatchersCount");
            int i1 = localJSONObject1.getInt("commentsCount");
            int i2 = localJSONObject1.getInt("likesCount");
            int i3 = localJSONObject1.getInt("restreamsCount");
            StreamStats localStreamStats = new StreamStats(i1, i2, i3, n);
            StreamActivitiesProxy.this.sendNotification("commandStreamStatsUpdate", localStreamStats, null);
            WatchersCountParams localWatchersCountParams = new WatchersCountParams(k + m, n);
            StreamActivitiesProxy.this.sendNotification("eventStreamWatchersCountUpdated", localWatchersCountParams, null);
            if (str.equals("ended"))
            {
              StreamActivitiesProxy.this.getFacade().sendNotification("eventStreamHasEnded", null, null);
              StreamActivitiesProxy.this.getFacade().sendNotification("commandStopGettingWatchers", null, null);
              return;
            }
            StreamActivitiesProxy.this.reactivateGetActivities(j);
            JSONArray localJSONArray2 = localJSONArray1;
            if ((localJSONArray1.length() > 0) && (i > StreamActivitiesProxy.this.lastActivitiesCount))
            {
              int i4 = i - StreamActivitiesProxy.this.lastActivitiesCount;
              StreamActivitiesProxy.access$302(StreamActivitiesProxy.this, i);
              if (i4 >= localJSONArray1.length())
                break label384;
              localJSONArray2 = new JSONArray();
              int i5 = localJSONArray1.length() - i4;
              if (i5 >= localJSONArray1.length())
                break label384;
              localJSONArray2.put(localJSONArray1.getJSONObject(i5));
              i5++;
              continue;
              if (i6 < localJSONArray2.length())
              {
                JSONObject localJSONObject2 = localJSONArray2.getJSONObject(i6);
                BroadcastActivity localBroadcastActivity = (BroadcastActivity)new Gson().fromJson(localJSONObject2.toString(), BroadcastActivity.class);
                StreamActivitiesProxy.this.sendNotification("eventActivityArrived", localBroadcastActivity, null);
                i6++;
                continue;
              }
            }
          }
          catch (Exception localException)
          {
            StreamActivitiesProxy.this.reactivateGetActivities(10);
            MLog.e("StreamActivitiesProxy", localException.toString());
          }
          return;
          label384: int i6 = 0;
        }
      }
    }
    , new Response.ErrorListener()
    {
      public void onErrorResponse(VolleyError paramAnonymousVolleyError)
      {
        StreamActivitiesProxy.this.reactivateGetActivities(10);
        MLog.e("StreamActivitiesProxy", paramAnonymousVolleyError.toString());
      }
    })
    {
      protected Response parseNetworkResponse(NetworkResponse paramAnonymousNetworkResponse)
      {
        try
        {
          Response localResponse = Response.success(new JSONObject(new String(paramAnonymousNetworkResponse.data, "UTF-8")), HttpHeaderParser.parseCacheHeaders(paramAnonymousNetworkResponse));
          return localResponse;
        }
        catch (UnsupportedEncodingException localUnsupportedEncodingException)
        {
          return Response.error(new ParseError(localUnsupportedEncodingException));
        }
        catch (JSONException localJSONException)
        {
          return Response.error(new ParseError(localJSONException));
        }
      }
    };
    NetworkQueue.getInstance(this.context).addToRequestQueue(local3);
  }

  public void onRemove()
  {
    try
    {
      if (this.scheduledFuture != null)
        this.scheduledFuture.cancel(true);
      if (this.worker != null)
        this.worker.shutdown();
      super.onRemove();
      return;
    }
    catch (Exception localException)
    {
      while (true)
        localException.printStackTrace();
    }
  }
}