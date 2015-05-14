package co.getair.meerkat.proxies;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import co.getair.meerkat.ApiProxy;
import co.getair.meerkat.MeerkatApplication;
import co.getair.meerkat.dtos.MixpanelEventParams;
import co.getair.meerkat.dtos.Session;
import co.getair.meerkat.dtos.User;
import co.getair.meerkat.dtos.User.Stats;
import co.getair.meerkat.facades.ApplicationFacade;
import co.getair.meerkat.utilities.ApiAuthorizedRequest;
import co.getair.meerkat.utilities.ApplicationPreferences;
import co.getair.meerkat.utilities.DiskWriter;
import co.getair.meerkat.utilities.JSONObjectParser;
import co.getair.meerkat.utilities.MLog;
import co.getair.meerkat.utilities.NetworkQueue;
import co.getair.meerkat.utilities.RunnableWithResultObject;
import com.android.volley.Response.ErrorListener;
import com.android.volley.Response.Listener;
import com.android.volley.VolleyError;
import com.crashlytics.android.Crashlytics;
import com.twitter.sdk.android.Twitter;
import com.twitter.sdk.android.core.SessionManager;
import com.twitter.sdk.android.core.TwitterSession;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import org.joda.time.DateTime;
import org.json.JSONException;
import org.json.JSONObject;
import org.puremvc.java.multicore.patterns.facade.Facade;
import org.puremvc.java.multicore.patterns.proxy.Proxy;

public class AuthorizeProxy extends Proxy
{
  private Context context;

  public AuthorizeProxy(String paramString, Context paramContext)
  {
    super(paramString);
    this.context = paramContext;
  }

  public void authorizeWithNewToken(Boolean paramBoolean, final AuthorizeType paramAuthorizeType, final RunnableWithResultObject paramRunnableWithResultObject)
  {
    String str1 = ApiProxy.getInstance(this.context).getUrlForFollowupActionKey("authorize");
    if (str1 == null)
    {
      getFacade().sendNotification("eventLoginSequenceStart", null, null);
      return;
    }
    JSONObject localJSONObject = new JSONObject();
    final String str2 = new ApplicationPreferences(this.context).getNotificationsToken();
    try
    {
      localJSONObject.put("version", this.context.getPackageManager().getPackageInfo(this.context.getPackageName(), 0).versionName);
      if ((str2 != null) && (!str2.isEmpty()))
        localJSONObject.put("notificationId", str2);
      ApiAuthorizedRequest localApiAuthorizedRequest = new ApiAuthorizedRequest(2, str1, localJSONObject, new Response.Listener()
      {
        public void onResponse(JSONObject paramAnonymousJSONObject)
        {
          MLog.i(paramAnonymousJSONObject.toString());
          try
          {
            ApiProxy.getInstance(AuthorizeProxy.this.context).setFollowupActionsFromJson(paramAnonymousJSONObject);
            HashMap localHashMap1 = (HashMap)JSONObjectParser.toMap(paramAnonymousJSONObject).get("result");
            String str1 = ApiProxy.getInstance(AuthorizeProxy.this.context).getUrlForFollowupActionKey("addWatcherTemplate");
            ApplicationPreferences localApplicationPreferences = new ApplicationPreferences(AuthorizeProxy.this.context.getApplicationContext());
            localApplicationPreferences.saveAddWatchersTemplate(str1);
            if (localApplicationPreferences.isFirstTimeUploadingProfileImage())
            {
              AuthorizeProxy.this.sendNotification("uploadProfileImage", null, null);
              localApplicationPreferences.saveIsFirstTimeUploadingProfileImage(false);
            }
            String str2 = (String)localHashMap1.get("auth");
            String str3 = (String)localHashMap1.get("expire");
            Date localDate = new Date(System.currentTimeMillis());
            Calendar localCalendar = Calendar.getInstance();
            localCalendar.setTime(localDate);
            localCalendar.add(12, Integer.parseInt(str3));
            long l = localCalendar.getTimeInMillis();
            Boolean localBoolean = (Boolean)localHashMap1.get("shouldProvidePhoneNumber");
            Session localSession = new Session(str2, l, localBoolean.booleanValue());
            localSession.saveSession(AuthorizeProxy.this.context);
            HashMap localHashMap2 = (HashMap)localHashMap1.get("user");
            String str4 = (String)localHashMap1.get("inbox");
            ((InboxProxy)ApplicationFacade.getInst(MeerkatApplication.getName()).retrieveProxy("inboxProxy")).updateInbox(str4);
            String str5 = (String)localHashMap2.get("id");
            Context localContext = AuthorizeProxy.this.context;
            RunnableWithResultObject local1 = new RunnableWithResultObject()
            {
              public void run()
              {
                if (this.resultObject == null)
                  return;
                User localUser = (User)this.resultObject;
                Crashlytics.setUserIdentifier(localUser.getId());
                Crashlytics.setUserName(localUser.getUsername());
                JSONObject localJSONObject1 = new JSONObject();
                try
                {
                  localJSONObject1.put("handle", ((TwitterSession)Twitter.getSessionManager().getActiveSession()).getUserName());
                  localJSONObject1.put("user id", localUser.getId());
                  localJSONObject1.put("platform", "android");
                  localJSONObject1.put("following count", localUser.getStats().getFollowingCount());
                  localJSONObject1.put("followers count", localUser.getStats().getFollowersCount());
                  localJSONObject2 = new JSONObject();
                }
                catch (JSONException localJSONException2)
                {
                  try
                  {
                    JSONObject localJSONObject2;
                    localJSONObject2.put("user id", localUser.getId());
                    localJSONObject2.put("$username", localUser.getUsername());
                    localJSONObject2.put("handle", localUser.getUsername());
                    localJSONObject2.put("$name", localUser.getDisplayName());
                    localJSONObject2.put("twitter id", localUser.getTwitterId());
                    localJSONObject2.put("followers count", localUser.getStats().getFollowersCount());
                    localJSONObject2.put("following count", localUser.getStats().getFollowingCount());
                    if (AuthorizeProxy.1.this.val$type == AuthorizeProxy.AuthorizeType.SIGNUP)
                    {
                      localJSONObject2.put("signup platform", "android");
                      localJSONObject2.put("join date", DateTime.now());
                      localJSONObject2.put("stream count", 0);
                      localJSONObject2.put("schedule count", 0);
                      localJSONObject2.put("schedule retweets count", 0);
                      localJSONObject2.put("watch count", 0);
                      localJSONObject2.put("comments count", 0);
                      localJSONObject2.put("restream count", 0);
                      localJSONObject2.put("subscribe count", 0);
                      localJSONObject2.put("schedule comments count", 0);
                    }
                    AuthorizeProxy.this.getFacade().sendNotification("identifyUserOnMixpanel", localUser.getId(), null);
                    AuthorizeProxy.this.getFacade().sendNotification("seMixpanelSuperProperties", localJSONObject1, null);
                    AuthorizeProxy.this.getFacade().sendNotification("setMixpanelPeopleProperties", localJSONObject2, null);
                    if (AuthorizeProxy.1.this.val$type == AuthorizeProxy.AuthorizeType.SIGNUP)
                      localJSONObject3 = new JSONObject();
                  }
                  catch (JSONException localJSONException2)
                  {
                    try
                    {
                      while (true)
                      {
                        JSONObject localJSONObject3;
                        localJSONObject3.put("handle", ((TwitterSession)Twitter.getSessionManager().getActiveSession()).getUserName());
                        MixpanelEventParams localMixpanelEventParams = new MixpanelEventParams("sign up", localJSONObject3);
                        AuthorizeProxy.this.getFacade().sendNotification("trackMixpanelEvent", localMixpanelEventParams, null);
                        localUser.setDeviceToken(AuthorizeProxy.1.this.val$deviceToken);
                        DiskWriter.getInstance().saveObject(AuthorizeProxy.this.context, localUser, User.getMyUserFileName());
                        ((GraphProxy)ApplicationFacade.getInstance(MeerkatApplication.getName()).retrieveProxy("graphProxy")).setMyUser(localUser);
                        AuthorizeProxy.1.this.val$completion.success = true;
                        AuthorizeProxy.1.this.val$completion.resultObject = localUser;
                        AuthorizeProxy.1.this.val$completion.run();
                        return;
                        localJSONException1 = localJSONException1;
                        localJSONException1.printStackTrace();
                      }
                      localJSONException2 = localJSONException2;
                      localJSONException2.printStackTrace();
                    }
                    catch (JSONException localJSONException3)
                    {
                      while (true)
                        localJSONException3.printStackTrace();
                    }
                  }
                }
              }
            };
            User.fetchUser(localContext, str5, local1);
            return;
          }
          catch (JSONException localJSONException)
          {
            Object[] arrayOfObject2 = new Object[2];
            arrayOfObject2[0] = paramAnonymousJSONObject.toString();
            arrayOfObject2[1] = localJSONException.getLocalizedMessage();
            MLog.e(String.format("Error parsing response JSON data for authorizing: %s, %s", arrayOfObject2));
            return;
          }
          catch (Exception localException)
          {
            Object[] arrayOfObject1 = new Object[2];
            arrayOfObject1[0] = paramAnonymousJSONObject.toString();
            arrayOfObject1[1] = localException.getLocalizedMessage();
            MLog.e(String.format("Error while processing authorizing response: %s, %s", arrayOfObject1));
          }
        }
      }
      , new Response.ErrorListener()
      {
        public void onErrorResponse(VolleyError paramAnonymousVolleyError)
        {
          paramAnonymousVolleyError.printStackTrace();
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
      {
        Object[] arrayOfObject2 = new Object[1];
        arrayOfObject2[0] = localJSONException.getLocalizedMessage();
        MLog.e(String.format("Error adding data to JSON for authorizing: %s", arrayOfObject2));
      }
    }
    catch (PackageManager.NameNotFoundException localNameNotFoundException)
    {
      while (true)
      {
        Object[] arrayOfObject1 = new Object[1];
        arrayOfObject1[0] = localNameNotFoundException.getLocalizedMessage();
        MLog.e(String.format("Error getting version name for authorize request: %s", arrayOfObject1));
      }
    }
  }

  public static enum AuthorizeType
  {
    static
    {
      LOGIN = new AuthorizeType("LOGIN", 2);
      AuthorizeType[] arrayOfAuthorizeType = new AuthorizeType[3];
      arrayOfAuthorizeType[0] = PERIODIC;
      arrayOfAuthorizeType[1] = SIGNUP;
      arrayOfAuthorizeType[2] = LOGIN;
    }
  }
}