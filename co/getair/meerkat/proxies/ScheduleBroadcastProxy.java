package co.getair.meerkat.proxies;

import android.app.AlarmManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.os.AsyncTask;
import co.getair.meerkat.ApiProxy;
import co.getair.meerkat.ScheduledBroadcastReceiver;
import co.getair.meerkat.activities.ScheduleBroadcastActivity;
import co.getair.meerkat.dtos.ScheduleBroadcastParams;
import co.getair.meerkat.dtos.Session;
import co.getair.meerkat.facades.BaseFacade;
import co.getair.meerkat.utilities.ApiAuthorizedRequest;
import co.getair.meerkat.utilities.DateFormatter;
import co.getair.meerkat.utilities.MultipartUtility;
import co.getair.meerkat.utilities.NetworkQueue;
import co.getair.meerkat.utilities.RunnableWithResultObject;
import com.android.volley.Response.ErrorListener;
import com.android.volley.Response.Listener;
import com.android.volley.VolleyError;
import com.google.gson.Gson;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.util.Date;
import java.util.HashMap;
import org.json.JSONObject;
import org.puremvc.java.multicore.patterns.facade.Facade;
import org.puremvc.java.multicore.patterns.proxy.Proxy;

public class ScheduleBroadcastProxy extends Proxy
{
  private Context context;
  private HashMap<String, String> followupActions;

  public ScheduleBroadcastProxy(String paramString, Context paramContext)
  {
    super(paramString);
    this.context = paramContext;
  }

  private void scheduleBroadcastReminder(ScheduleBroadcastParams paramScheduleBroadcastParams)
  {
    ScheduleBroadcastActivity localScheduleBroadcastActivity = (ScheduleBroadcastActivity)((BaseFacade)getFacade()).getOwnerActivity();
    Intent localIntent = new Intent(localScheduleBroadcastActivity, ScheduledBroadcastReceiver.class);
    localIntent.putExtra("broadcastIdNameKey", localScheduleBroadcastActivity.getBroadcastName());
    localIntent.putExtra("broadcastNameKey", "");
    PendingIntent localPendingIntent = PendingIntent.getBroadcast(localScheduleBroadcastActivity, 0, localIntent, 0);
    ((AlarmManager)localScheduleBroadcastActivity.getSystemService("alarm")).set(1, paramScheduleBroadcastParams.getTimeOfBroadcast().getTime(), localPendingIntent);
  }

  private void tweetBroadcast(String paramString1, final HashMap paramHashMap, String paramString2)
  {
    ((TwitterProxy)getFacade().retrieveProxy("twitterProxy")).tweet(paramString1, new RunnableWithResultObject()
    {
      public void run()
      {
        if (this.resultObject != null)
        {
          String str1 = (String)this.resultObject;
          String str2 = (String)paramHashMap.get("schedule");
          ScheduleBroadcastActivity localScheduleBroadcastActivity = (ScheduleBroadcastActivity)((BaseFacade)ScheduleBroadcastProxy.this.getFacade()).getOwnerActivity();
          HashMap localHashMap = new HashMap();
          localHashMap.put("tweetId", str1);
          localHashMap.put("auth", Session.loadSession(localScheduleBroadcastActivity).getAuthToken());
          ApiAuthorizedRequest localApiAuthorizedRequest = new ApiAuthorizedRequest(2, str2, new Gson().toJson(localHashMap), new Response.Listener()
          {
            public void onResponse(JSONObject paramAnonymous2JSONObject)
            {
              ScheduleBroadcastProxy.this.getFacade().sendNotification("scheduleBroadcastScheduled", null, null);
            }
          }
          , new Response.ErrorListener()
          {
            public void onErrorResponse(VolleyError paramAnonymous2VolleyError)
            {
              ScheduleBroadcastProxy.this.getFacade().sendNotification("scheduleBroadcastScheduledError", null, null);
            }
          });
          NetworkQueue.getInstance(localScheduleBroadcastActivity).addToRequestQueue(localApiAuthorizedRequest);
          return;
        }
        ScheduleBroadcastProxy.this.getFacade().sendNotification("scheduleBroadcastScheduled", null, null);
      }
    });
  }

  public void scheduleBroadcast(final ScheduleBroadcastParams paramScheduleBroadcastParams)
  {
    String str = ApiProxy.getInstance(((BaseFacade)getFacade()).getOwnerActivity()).getUrlForFollowupActionKey("schedules");
    HashMap localHashMap1 = new HashMap();
    localHashMap1.put("content", paramScheduleBroadcastParams.getCaption());
    HashMap localHashMap2 = new HashMap();
    localHashMap2.put("time", Long.valueOf(paramScheduleBroadcastParams.getTimeOfBroadcast().getTime() / 1000L));
    localHashMap2.put("caption", localHashMap1);
    ApiAuthorizedRequest localApiAuthorizedRequest = new ApiAuthorizedRequest(1, str, new Gson().toJson(localHashMap2), new Response.Listener()
    {
      public void onResponse(JSONObject paramAnonymousJSONObject)
      {
        while (true)
        {
          String str1;
          String str2;
          try
          {
            JSONObject localJSONObject1 = paramAnonymousJSONObject.getJSONObject("result");
            JSONObject localJSONObject2 = paramAnonymousJSONObject.getJSONObject("followupActions");
            HashMap localHashMap = (HashMap)new Gson().fromJson(localJSONObject1.toString(), HashMap.class);
            ScheduleBroadcastProxy.access$002(ScheduleBroadcastProxy.this, (HashMap)new Gson().fromJson(localJSONObject2.toString(), HashMap.class));
            str1 = (String)localHashMap.get("tweetFormat");
            str2 = DateFormatter.futureTimeString(paramScheduleBroadcastParams.getTimeOfBroadcast().getTime() / 1000L, "%d %s");
            if ((str1.indexOf("{@caption@}") > -1) && (str1.indexOf("{@time@}") > -1))
            {
              String str3 = str1.replace("{@time@}", str2);
              (-11 + str3.length());
              String str4 = paramScheduleBroadcastParams.getCaption();
              if (str4.length() > 99)
                str4 = str4.substring(0, 99);
              str1 = str3.replace("{@caption@}", str4);
              ScheduleBroadcastProxy.this.tweetBroadcast(str1, ScheduleBroadcastProxy.this.followupActions, (String)localHashMap.get("id"));
              if (paramScheduleBroadcastParams.getCoverImage() != null)
                ScheduleBroadcastProxy.this.uploadCoverImage(paramScheduleBroadcastParams.getCoverImage());
              ScheduleBroadcastProxy.this.scheduleBroadcastReminder(paramScheduleBroadcastParams);
              return;
            }
          }
          catch (Exception localException)
          {
            return;
          }
          if (str1.indexOf("{@time@}") > -1)
            str1 = str1.replace("{@time@}", str2);
        }
      }
    }
    , new Response.ErrorListener()
    {
      public void onErrorResponse(VolleyError paramAnonymousVolleyError)
      {
      }
    });
    NetworkQueue.getInstance(this.context).addToRequestQueue(localApiAuthorizedRequest);
  }

  public void uploadCoverImage(final Bitmap paramBitmap)
  {
    new AsyncTask()
    {
      protected Void doInBackground(Void[] paramAnonymousArrayOfVoid)
      {
        try
        {
          String str = (String)ScheduleBroadcastProxy.this.followupActions.get("cover");
          ByteArrayOutputStream localByteArrayOutputStream = new ByteArrayOutputStream();
          paramBitmap.compress(Bitmap.CompressFormat.JPEG, 70, localByteArrayOutputStream);
          MultipartUtility localMultipartUtility = new MultipartUtility(str, "UTF-8");
          localMultipartUtility.addHeaderField("User-Agent", "Meerkat Android");
          localMultipartUtility.addFilePart("imageFile", "coverImage.png", new ByteArrayInputStream(localByteArrayOutputStream.toByteArray()));
          localMultipartUtility.addFormField("counter", "1");
          localMultipartUtility.finish();
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