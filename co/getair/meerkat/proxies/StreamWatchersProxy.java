package co.getair.meerkat.proxies;

import android.content.Context;
import co.getair.meerkat.dtos.watch_broadcast.Watcher;
import co.getair.meerkat.utilities.ApiAuthorizedRequest;
import co.getair.meerkat.utilities.MLog;
import co.getair.meerkat.utilities.NetworkQueue;
import com.android.volley.Response.ErrorListener;
import com.android.volley.Response.Listener;
import com.android.volley.VolleyError;
import com.google.common.reflect.TypeToken;
import com.google.gson.Gson;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;
import org.json.JSONArray;
import org.json.JSONObject;
import org.puremvc.java.multicore.patterns.facade.Facade;
import org.puremvc.java.multicore.patterns.proxy.Proxy;

public class StreamWatchersProxy extends Proxy
{
  private static final String GET_WATCHERS_KEY = "watchers";
  private static final String LOG_TAG = "StreamWatchersProxy";
  private static final String NAME = "StreamWatchersProxy";
  private Context context;
  private String getWatchersUrl;
  private ScheduledFuture scheduledFuture;
  private boolean streamHasEnded = false;
  private ScheduledExecutorService worker;

  public StreamWatchersProxy(Context paramContext, HashMap<String, String> paramHashMap)
  {
    super("StreamWatchersProxy");
    this.context = paramContext;
    this.getWatchersUrl = ((String)paramHashMap.get("watchers"));
    this.worker = Executors.newSingleThreadScheduledExecutor();
  }

  public static String NAME()
  {
    return "StreamWatchersProxy";
  }

  private void reactivateGetWatchers(int paramInt)
  {
    Runnable local3 = new Runnable()
    {
      public void run()
      {
        StreamWatchersProxy.this.getWatchers();
      }
    };
    if (this.scheduledFuture != null)
      this.scheduledFuture.cancel(false);
    if ((this.worker != null) && (!this.worker.isShutdown()))
      this.scheduledFuture = this.worker.schedule(local3, paramInt, TimeUnit.SECONDS);
  }

  public void getWatchers()
  {
    ApiAuthorizedRequest localApiAuthorizedRequest = new ApiAuthorizedRequest(0, this.getWatchersUrl, "", new Response.Listener()
    {
      public void onResponse(JSONObject paramAnonymousJSONObject)
      {
        try
        {
          JSONObject localJSONObject = paramAnonymousJSONObject.getJSONObject("result");
          int i = localJSONObject.getInt("expiry");
          JSONArray localJSONArray = localJSONObject.getJSONArray("watchers");
          if (!StreamWatchersProxy.this.streamHasEnded)
          {
            StreamWatchersProxy.this.reactivateGetWatchers(i);
            Type localType = new TypeToken()
            {
            }
            .getType();
            ArrayList localArrayList = (ArrayList)new Gson().fromJson(localJSONArray.toString(), localType);
            StreamWatchersProxy.this.getFacade().sendNotification("eventStreamWatchersReceived", localArrayList, null);
          }
          return;
        }
        catch (Exception localException)
        {
          StreamWatchersProxy.this.reactivateGetWatchers(10);
          MLog.e("StreamWatchersProxy", localException.toString());
        }
      }
    }
    , new Response.ErrorListener()
    {
      public void onErrorResponse(VolleyError paramAnonymousVolleyError)
      {
        StreamWatchersProxy.this.reactivateGetWatchers(10);
      }
    });
    NetworkQueue.getInstance(this.context).addToRequestQueue(localApiAuthorizedRequest);
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

  public void stop()
  {
    this.streamHasEnded = true;
  }
}