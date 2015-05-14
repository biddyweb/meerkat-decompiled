package co.getair.meerkat.proxies;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.os.AsyncTask;
import android.support.v4.content.LocalBroadcastManager;
import co.getair.meerkat.ApiProxy;
import co.getair.meerkat.MeerkatApplication;
import co.getair.meerkat.commands.broadcast.UpdateStreamStateCommand;
import co.getair.meerkat.commands.stream_participation.StartGettingActivitiesCommand;
import co.getair.meerkat.commands.stream_participation.StartGettingWatchersCommand;
import co.getair.meerkat.commands.stream_participation.StopGettingWatchersCommand;
import co.getair.meerkat.dtos.MixpanelEventParams;
import co.getair.meerkat.dtos.Session;
import co.getair.meerkat.dtos.User;
import co.getair.meerkat.dtos.watch_broadcast.BroadcastBeganParams;
import co.getair.meerkat.dtos.watch_broadcast.StreamStats;
import co.getair.meerkat.facades.ApplicationFacade;
import co.getair.meerkat.utilities.ApiAuthorizedRequest;
import co.getair.meerkat.utilities.GPSHandlerProxy;
import co.getair.meerkat.utilities.MLog;
import co.getair.meerkat.utilities.MultipartUtility;
import co.getair.meerkat.utilities.NetworkQueue;
import co.getair.meerkat.utilities.RunnableWithResultObject;
import com.android.volley.Response.ErrorListener;
import com.android.volley.Response.Listener;
import com.android.volley.VolleyError;
import com.google.gson.Gson;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.net.URI;
import java.util.HashMap;
import org.json.JSONException;
import org.json.JSONObject;
import org.puremvc.java.multicore.patterns.facade.Facade;
import org.puremvc.java.multicore.patterns.proxy.Proxy;

public class BroadcastProxy extends Proxy
{
  private final String CREATE_BROADCAST_URL_KEY = "newBroadcast";
  private final int LOCATION_TIMEOUT = 3000;
  private final String LOG_TAG = "BroadcastProxy";
  private final String MEDIA_SERVER_URL_KEY = "media";
  private final String PARAM_CAPTION = "caption";
  private final String PARAM_LOCATION = "location";
  private final String PARAM_PLACE = "place";
  private final String PLACEHOLDER_CAPTION = "{caption}";
  private final String PLACEHOLDER_PAGE = "{page}";
  private final String UPDATE_BROADCAST_URL_KEY = "broadcast";
  private String caption = "";
  private Context context;
  private HashMap<String, String> followupActions;
  private String id = "";
  private BroadcastReceiver mMessageReceiver = new BroadcastReceiver()
  {
    public void onReceive(Context paramAnonymousContext, Intent paramAnonymousIntent)
    {
      MLog.d("receiver", "Got it");
      ((GPSHandlerProxy)BroadcastProxy.this.getFacade().retrieveProxy("gpsProxy")).stop();
      BroadcastProxy.this.goLive();
    }
  };
  private StreamStats streamStats = new StreamStats();
  private String tweetId = "";

  public BroadcastProxy(String paramString, Context paramContext)
  {
    super(paramString, paramContext);
    this.context = paramContext;
    LocalBroadcastManager.getInstance(paramContext).registerReceiver(this.mMessageReceiver, new IntentFilter("LocationReceived"));
  }

  private void addCommands()
  {
    getFacade().registerCommand("commandStartGettingStreamActivities", new StartGettingActivitiesCommand());
    getFacade().registerCommand("commandStartGettingWatchers", new StartGettingWatchersCommand());
    getFacade().registerCommand("commandStopGettingWatchers", new StopGettingWatchersCommand());
    getFacade().registerCommand("commandStreamStatsUpdate", new UpdateStreamStateCommand());
  }

  private void addProxies(Context paramContext, String paramString)
  {
    User localUser = ((GraphProxy)ApplicationFacade.getInst(MeerkatApplication.getName()).retrieveProxy("graphProxy")).getMyUser();
    StreamActivitiesProxy localStreamActivitiesProxy = new StreamActivitiesProxy(paramContext, this.followupActions);
    getFacade().registerProxy(localStreamActivitiesProxy);
    StreamWatchersProxy localStreamWatchersProxy = new StreamWatchersProxy(paramContext, this.followupActions);
    getFacade().registerProxy(localStreamWatchersProxy);
    StreamCommentsProxy localStreamCommentsProxy = new StreamCommentsProxy(paramContext, paramString, this.followupActions, "", localUser.getUsername());
    getFacade().registerProxy(localStreamCommentsProxy);
  }

  private void goLive()
  {
    final GPSHandlerProxy localGPSHandlerProxy = (GPSHandlerProxy)getFacade().retrieveProxy("gpsProxy");
    String str1 = localGPSHandlerProxy.getCurrentCity();
    String str2 = localGPSHandlerProxy.getCurrentCountry();
    final String str3 = ApiProxy.getInstance(this.context.getApplicationContext()).getUrlForFollowupActionKey("newBroadcast");
    JSONObject localJSONObject1 = new JSONObject();
    JSONObject localJSONObject2 = new JSONObject();
    JSONObject localJSONObject3 = new JSONObject();
    JSONObject localJSONObject4 = new JSONObject();
    try
    {
      localJSONObject2.put("id", "");
      localJSONObject2.put("name", "");
      localJSONObject3.put("content", this.caption);
      localJSONObject1.put("place", localJSONObject2);
      localJSONObject1.put("caption", localJSONObject3);
      if ((!str1.equals("")) || (!str2.equals("")))
      {
        localJSONObject4.put("city", str1);
        localJSONObject4.put("country", str2);
        localJSONObject1.put("location", localJSONObject4);
      }
      ApiAuthorizedRequest localApiAuthorizedRequest = new ApiAuthorizedRequest(1, str3, localJSONObject1, new Response.Listener()
      {
        public void onResponse(JSONObject paramAnonymousJSONObject)
        {
          try
          {
            MLog.i("BroadcastProxy", paramAnonymousJSONObject.toString());
            Gson localGson = new Gson();
            BroadcastProxy.access$202(BroadcastProxy.this, (HashMap)localGson.fromJson(paramAnonymousJSONObject.getJSONObject("followupActions").toString(), HashMap.class));
            JSONObject localJSONObject1 = paramAnonymousJSONObject.getJSONObject("result");
            BroadcastProxy.access$302(BroadcastProxy.this, localJSONObject1.getString("id"));
            JSONObject localJSONObject2 = localJSONObject1.getJSONObject("publishInformation");
            String str1 = localJSONObject2.getString("template");
            String str2 = localJSONObject2.getString("page");
            String str3 = str1;
            if (str3.contains("{caption}"))
              str3 = str3.replace("{caption}", BroadcastProxy.this.caption);
            if (str3.contains("{page}"))
              str3 = str3.replace("{page}", str2);
            String str4 = str3.substring(str3.indexOf("http"), str3.length());
            BroadcastProxy.this.addProxies(BroadcastProxy.this.context, str3);
            BroadcastProxy.this.addCommands();
            String str5 = localGPSHandlerProxy.getLocationText();
            BroadcastProxy.this.startBroadcastMixpanelTrack();
            BroadcastProxy.this.sendNotification("commandStartGettingStreamActivities", null, null);
            BroadcastProxy.this.sendNotification("commandStartGettingWatchers", null, null);
            BroadcastProxy.this.sendNotification("eventMediaServerUrlArrived", BroadcastProxy.this.followupActions.get("media"), null);
            BroadcastProxy.this.sendNotification("eventBroadcastBegan", new BroadcastBeganParams(BroadcastProxy.this.caption, str4, str5, str3, new RunnableWithResultObject()
            {
              public void run()
              {
                JSONObject localJSONObject;
                if (this.success)
                {
                  BroadcastProxy.access$902(BroadcastProxy.this, (String)this.resultObject);
                  localJSONObject = new JSONObject();
                }
                try
                {
                  String str = new URI(BroadcastProxy.3.this.val$createBroadcastUrl).resolve((String)BroadcastProxy.this.followupActions.get("broadcast")).toString();
                  localJSONObject.put("tweetId", BroadcastProxy.this.tweetId);
                  localJSONObject.put("auth", Session.loadSession(BroadcastProxy.this.context).getAuthToken());
                  ApiAuthorizedRequest localApiAuthorizedRequest = new ApiAuthorizedRequest(2, str, localJSONObject, new Response.Listener()
                  {
                    public void onResponse(JSONObject paramAnonymous3JSONObject)
                    {
                      MLog.d("SUCCESS");
                    }
                  }
                  , new Response.ErrorListener()
                  {
                    public void onErrorResponse(VolleyError paramAnonymous3VolleyError)
                    {
                      MLog.d("FAILURE");
                    }
                  });
                  NetworkQueue.getInstance(BroadcastProxy.this.context).addToRequestQueue(localApiAuthorizedRequest);
                  return;
                }
                catch (Exception localException)
                {
                  localException.printStackTrace();
                }
              }
            }), null);
            return;
          }
          catch (JSONException localJSONException)
          {
            MLog.e("BroadcastProxy", localJSONException.toString());
          }
        }
      }
      , new Response.ErrorListener()
      {
        public void onErrorResponse(VolleyError paramAnonymousVolleyError)
        {
          MLog.e("BroadcastProxy", paramAnonymousVolleyError.toString());
        }
      });
      NetworkQueue.getInstance(this.context).addToRequestQueue(localApiAuthorizedRequest);
      return;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
  }

  private void startBroadcastMixpanelTrack()
  {
    sendNotification("incrementPeopleProperty", "stream count", null);
    sendNotification("timeEventForMixpanel", "stream", null);
  }

  public void onRemove()
  {
    try
    {
      JSONObject localJSONObject = new JSONObject();
      localJSONObject.put("caption", this.caption);
      localJSONObject.put("stream id", this.id);
      localJSONObject.put("comments", this.streamStats.getCommentsCount());
      localJSONObject.put("restreams", this.streamStats.getRestreamsCount());
      localJSONObject.put("likes", this.streamStats.getLikesCount());
      localJSONObject.put("watchers", this.streamStats.getWatchersCount());
      MixpanelEventParams localMixpanelEventParams = new MixpanelEventParams("stream", localJSONObject);
      getFacade().sendNotification("trackMixpanelEvent", localMixpanelEventParams, null);
      LocalBroadcastManager.getInstance(this.context).unregisterReceiver(this.mMessageReceiver);
      super.onRemove();
      return;
    }
    catch (Exception localException)
    {
      while (true)
        localException.printStackTrace();
    }
  }

  public void startGoLiveSequence(String paramString)
  {
    this.caption = paramString;
    GPSHandlerProxy localGPSHandlerProxy = (GPSHandlerProxy)getFacade().retrieveProxy("gpsProxy");
    if (localGPSHandlerProxy.isStarted())
      localGPSHandlerProxy.stop();
    localGPSHandlerProxy.start(this.context);
  }

  public void updateStreamStats(StreamStats paramStreamStats)
  {
    this.streamStats = paramStreamStats;
  }

  public void uploadCoverImage(final Bitmap paramBitmap)
  {
    new AsyncTask()
    {
      protected Void doInBackground(Void[] paramAnonymousArrayOfVoid)
      {
        try
        {
          String str = (String)BroadcastProxy.this.followupActions.get("cover");
          ByteArrayOutputStream localByteArrayOutputStream = new ByteArrayOutputStream();
          paramBitmap.compress(Bitmap.CompressFormat.JPEG, 70, localByteArrayOutputStream);
          MultipartUtility localMultipartUtility = new MultipartUtility(str, "UTF-8");
          localMultipartUtility.addHeaderField("User-Agent", "Meerkat Android");
          localMultipartUtility.addFilePart("imageFile", "coverImage.png", new ByteArrayInputStream(localByteArrayOutputStream.toByteArray()));
          localMultipartUtility.addFormField("counter", "1");
          MLog.d("BroadcastProxy", localMultipartUtility.finish().toString());
          return null;
        }
        catch (Exception localException)
        {
          while (true)
            localException.printStackTrace();
        }
      }
    }
    .execute(new Void[] { null, null, null });
  }
}