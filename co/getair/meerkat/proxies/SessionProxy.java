package co.getair.meerkat.proxies;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.provider.Settings.Secure;
import co.getair.meerkat.ApiProxy;
import co.getair.meerkat.MeerkatApplication;
import co.getair.meerkat.activities.HomeActivity;
import co.getair.meerkat.dtos.Session;
import co.getair.meerkat.facades.ApplicationFacade;
import co.getair.meerkat.facades.BaseFacade;
import co.getair.meerkat.utilities.ApiAuthorizedRequest;
import co.getair.meerkat.utilities.MLog;
import co.getair.meerkat.utilities.MultipartUtility;
import co.getair.meerkat.utilities.NetworkQueue;
import com.android.volley.NetworkResponse;
import com.android.volley.Response.ErrorListener;
import com.android.volley.Response.Listener;
import com.android.volley.VolleyError;
import com.twitter.sdk.android.Twitter;
import com.twitter.sdk.android.core.SessionManager;
import com.twitter.sdk.android.core.TwitterAuthToken;
import com.twitter.sdk.android.core.TwitterSession;
import com.twitter.sdk.android.core.models.User;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.puremvc.java.multicore.patterns.facade.Facade;
import org.puremvc.java.multicore.patterns.proxy.Proxy;

public class SessionProxy extends Proxy
{
  private static final String LOG_OUT_URL_KEY = "signOut";
  private static final String LOG_TAG = "SessionProxy";
  private final Context context;
  private final String iAmAliveUrl = "https://social.meerkatapp.co/users/i-am-alive?v=1";

  public SessionProxy(String paramString, Context paramContext)
  {
    super(paramString, paramContext);
    this.context = paramContext;
  }

  private void signInWithTwitter()
  {
    String str1 = ApiProxy.getInstance(this.context).getUrlForFollowupActionKey("signIn");
    JSONObject localJSONObject1 = new JSONObject();
    try
    {
      TwitterSession localTwitterSession = (TwitterSession)Twitter.getSessionManager().getActiveSession();
      TwitterAuthToken localTwitterAuthToken = (TwitterAuthToken)localTwitterSession.getAuthToken();
      String str2 = localTwitterAuthToken.token;
      String str3 = localTwitterAuthToken.secret;
      JSONObject localJSONObject2 = new JSONObject();
      localJSONObject2.put("id", localTwitterSession.getUserId());
      localJSONObject2.put("token", str2);
      localJSONObject2.put("tokenSecret", str3);
      localJSONObject1.put("twitterSignin", localJSONObject2);
      ApiAuthorizedRequest localApiAuthorizedRequest = new ApiAuthorizedRequest(2, str1, localJSONObject1, new Response.Listener()
      {
        public void onResponse(JSONObject paramAnonymousJSONObject)
        {
          MLog.i("SessionProxy", paramAnonymousJSONObject.toString());
          ApiProxy.getInstance(SessionProxy.this.context).setFollowupActionsFromJson(paramAnonymousJSONObject);
          SessionProxy.this.getFacade().sendNotification("authorizationStart", AuthorizeProxy.AuthorizeType.LOGIN, null);
        }
      }
      , new Response.ErrorListener()
      {
        public void onErrorResponse(VolleyError paramAnonymousVolleyError)
        {
          if (paramAnonymousVolleyError.networkResponse.statusCode == 422)
            SessionProxy.this.getFacade().sendNotification("userDoesNotExist", null, null);
        }
      });
      NetworkQueue.getInstance(this.context).addToRequestQueue(localApiAuthorizedRequest);
      return;
    }
    catch (JSONException localJSONException)
    {
      localJSONException.printStackTrace();
    }
  }

  private void signUpWithTwitter(final User paramUser)
  {
    String str1 = ApiProxy.getInstance(this.context).getUrlForFollowupActionKey("signUp");
    JSONObject localJSONObject1 = new JSONObject();
    while (true)
    {
      try
      {
        final TwitterSession localTwitterSession = (TwitterSession)Twitter.getSessionManager().getActiveSession();
        TwitterAuthToken localTwitterAuthToken = (TwitterAuthToken)localTwitterSession.getAuthToken();
        String str2 = localTwitterAuthToken.token;
        String str3 = localTwitterAuthToken.secret;
        JSONObject localJSONObject2 = new JSONObject();
        localJSONObject2.put("id", localTwitterSession.getUserId());
        if (paramUser.description != null)
        {
          str4 = paramUser.description;
          localJSONObject2.put("bio", str4);
          localJSONObject2.put("website", "");
          if (paramUser.name != null)
          {
            str5 = paramUser.name;
            localJSONObject2.put("fullname", str5);
            localJSONObject2.put("token", str2);
            localJSONObject2.put("tokenSecret", str3);
            String str6 = Settings.Secure.getString(this.context.getContentResolver(), "android_id");
            localJSONObject1.put("username", localTwitterSession.getUserName());
            localJSONObject1.put("email", "");
            localJSONObject1.put("deviceId", str6);
            localJSONObject1.put("twitterAuth", localJSONObject2);
            ApiAuthorizedRequest localApiAuthorizedRequest = new ApiAuthorizedRequest(1, str1, localJSONObject1, new Response.Listener()
            {
              public void onResponse(JSONObject paramAnonymousJSONObject)
              {
                MLog.i("SessionProxy", paramAnonymousJSONObject.toString());
                try
                {
                  JSONObject localJSONObject = new JSONObject();
                  localJSONObject.put("twitter id", localTwitterSession.getUserId());
                  localJSONObject.put("$username", localTwitterSession.getUserName());
                  localJSONObject.put("handle", localTwitterSession.getUserName());
                  if (paramUser.name != null);
                  for (String str = paramUser.name; ; str = "")
                  {
                    localJSONObject.put("full name", str);
                    localJSONObject.put("join date", (int)(System.currentTimeMillis() / 1000L));
                    localJSONObject.put("stream count", 0);
                    localJSONObject.put("schedule count", 0);
                    localJSONObject.put("schedule like count", 0);
                    localJSONObject.put("watch count", 0);
                    localJSONObject.put("comments count", 0);
                    localJSONObject.put("restream count", 0);
                    SessionProxy.this.getFacade().sendNotification("setMixpanelPeopleProperties", localJSONObject, null);
                    ApiProxy.getInstance(SessionProxy.this.context).setFollowupActionsFromJson(paramAnonymousJSONObject);
                    SessionProxy.this.getFacade().sendNotification("authorizationStart", AuthorizeProxy.AuthorizeType.SIGNUP, null);
                    return;
                  }
                }
                catch (JSONException localJSONException)
                {
                  localJSONException.printStackTrace();
                }
              }
            }
            , new Response.ErrorListener()
            {
              public void onErrorResponse(VolleyError paramAnonymousVolleyError)
              {
                MLog.e("SessionProxy", paramAnonymousVolleyError.toString());
              }
            });
            NetworkQueue.getInstance(this.context).addToRequestQueue(localApiAuthorizedRequest);
            return;
          }
          String str5 = "";
          continue;
        }
      }
      catch (JSONException localJSONException)
      {
        localJSONException.printStackTrace();
        return;
      }
      String str4 = "";
    }
  }

  public Boolean isSessoinValid(Session paramSession)
  {
    boolean bool1;
    if ((paramSession == null) || (paramSession.getAuthToken() == null) || (paramSession.getAuthToken().isEmpty()))
      bool1 = false;
    while (true)
    {
      return Boolean.valueOf(bool1);
      boolean bool2 = System.currentTimeMillis() < paramSession.getExpirationTime();
      bool1 = false;
      if (bool2)
        try
        {
          int i = this.context.getPackageManager().getPackageInfo(this.context.getPackageName(), 0).versionCode;
          int j = paramSession.getAppVersionCode();
          bool1 = false;
          if (j == i)
            bool1 = true;
        }
        catch (Exception localException)
        {
          MLog.e("Error retrieving version code");
          localException.printStackTrace();
          bool1 = false;
        }
    }
  }

  public void logout()
  {
    ApiAuthorizedRequest localApiAuthorizedRequest = new ApiAuthorizedRequest(3, ApiProxy.getInstance(this.context).getUrlForFollowupActionKey("signOut"), "", new Response.Listener()
    {
      public void onResponse(JSONObject paramAnonymousJSONObject)
      {
      }
    }
    , new Response.ErrorListener()
    {
      public void onErrorResponse(VolleyError paramAnonymousVolleyError)
      {
      }
    });
    NetworkQueue.getInstance(this.context).addToRequestQueue(localApiAuthorizedRequest);
    new Session(null, 0L, false).saveSession(this.context);
    ApplicationFacade localApplicationFacade = ApplicationFacade.getInst(MeerkatApplication.getName());
    ((GraphProxy)localApplicationFacade.retrieveProxy("graphProxy")).deleteMyUser();
    ((InboxProxy)localApplicationFacade.retrieveProxy("inboxProxy")).clearInbox();
    ((TwitterProxy)localApplicationFacade.retrieveProxy("twitterProxy")).logout();
    Activity localActivity = ((BaseFacade)getFacade()).getOwnerActivity();
    Intent localIntent = new Intent(localActivity, HomeActivity.class);
    localIntent.addFlags(67108864);
    localActivity.startActivity(localIntent);
  }

  public void startLoginFlow()
  {
    ApiAuthorizedRequest localApiAuthorizedRequest = new ApiAuthorizedRequest(0, "https://social.meerkatapp.co/users/i-am-alive?v=1", "", new Response.Listener()
    {
      public void onResponse(JSONObject paramAnonymousJSONObject)
      {
        MLog.i("SessionProxy", paramAnonymousJSONObject.toString());
        ApiProxy.getInstance(SessionProxy.this.context).setFollowupActionsFromJson(paramAnonymousJSONObject);
        SessionProxy.this.signInWithTwitter();
      }
    }
    , new Response.ErrorListener()
    {
      public void onErrorResponse(VolleyError paramAnonymousVolleyError)
      {
        MLog.e("SessionProxy", paramAnonymousVolleyError.toString());
      }
    });
    NetworkQueue.getInstance(this.context).addToRequestQueue(localApiAuthorizedRequest);
  }

  public void startSignUpFlow(final User paramUser)
  {
    ApiAuthorizedRequest localApiAuthorizedRequest = new ApiAuthorizedRequest(0, "https://social.meerkatapp.co/users/i-am-alive?v=1", "", new Response.Listener()
    {
      public void onResponse(JSONObject paramAnonymousJSONObject)
      {
        MLog.i("SessionProxy", paramAnonymousJSONObject.toString());
        SessionProxy.this.signUpWithTwitter(paramUser);
      }
    }
    , new Response.ErrorListener()
    {
      public void onErrorResponse(VolleyError paramAnonymousVolleyError)
      {
        MLog.e("SessionProxy", paramAnonymousVolleyError.toString());
      }
    });
    NetworkQueue.getInstance(this.context).addToRequestQueue(localApiAuthorizedRequest);
  }

  public void uploadProfileImage(Bitmap paramBitmap)
  {
    try
    {
      String str = ApiProxy.getInstance(this.context).getUrlForFollowupActionKey("updateImage");
      ByteArrayOutputStream localByteArrayOutputStream = new ByteArrayOutputStream();
      paramBitmap.compress(Bitmap.CompressFormat.JPEG, 70, localByteArrayOutputStream);
      MultipartUtility localMultipartUtility = new MultipartUtility(str, "UTF-8");
      localMultipartUtility.addHeaderField("User-Agent", "Meerkat Android");
      localMultipartUtility.addFilePart("imageFile", "profileImage.jpg", new ByteArrayInputStream(localByteArrayOutputStream.toByteArray()));
      MLog.d("SessionProxy", localMultipartUtility.finish().toString());
      return;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
  }

  public void uploadTwitterFrindsList(List<String> paramList)
  {
    JSONObject localJSONObject = new JSONObject();
    try
    {
      localJSONObject.put("linkTo", new JSONArray(paramList));
      localJSONObject.put("type", "follow");
      localJSONObject.put("name", "");
      localJSONObject.put("platform", "twitter");
      ApiAuthorizedRequest localApiAuthorizedRequest = new ApiAuthorizedRequest(1, ApiProxy.getInstance(this.context).getUrlForFollowupActionKey("twitterFriendsSignUp").replace("https", "http"), localJSONObject, new Response.Listener()
      {
        public void onResponse(JSONObject paramAnonymousJSONObject)
        {
          MLog.d("SessionProxy", paramAnonymousJSONObject.toString());
        }
      }
      , new Response.ErrorListener()
      {
        public void onErrorResponse(VolleyError paramAnonymousVolleyError)
        {
          MLog.e("SessionProxy", paramAnonymousVolleyError.toString());
        }
      });
      NetworkQueue.getInstance(this.context).addToRequestQueue(localApiAuthorizedRequest);
      return;
    }
    catch (JSONException localJSONException)
    {
      localJSONException.printStackTrace();
    }
  }

  public void validateSession()
  {
    Session localSession = Session.loadSession(this.context);
    GraphProxy localGraphProxy = (GraphProxy)ApplicationFacade.getInst(MeerkatApplication.getName()).retrieveProxy("graphProxy");
    if ((isSessoinValid(localSession).booleanValue()) && (Twitter.getSessionManager().getActiveSession() != null) && (localGraphProxy.getMyUser() != null))
    {
      getFacade().sendNotification("eventSessionIsValid", null, null);
      return;
    }
    if (localSession != null)
    {
      getFacade().sendNotification("authorizationStart", AuthorizeProxy.AuthorizeType.PERIODIC, null);
      return;
    }
    getFacade().sendNotification("eventSessionInvalid", null, null);
  }
}