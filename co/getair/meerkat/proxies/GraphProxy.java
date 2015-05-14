package co.getair.meerkat.proxies;

import android.content.Context;
import co.getair.meerkat.MeerkatApplication;
import co.getair.meerkat.activities.FeedActivity;
import co.getair.meerkat.dtos.IUserToFollow;
import co.getair.meerkat.dtos.Session;
import co.getair.meerkat.dtos.User;
import co.getair.meerkat.facades.ApplicationFacade;
import co.getair.meerkat.facades.FeedActivityFacade;
import co.getair.meerkat.utilities.ApiAuthorizedRequest;
import co.getair.meerkat.utilities.DiskWriter;
import co.getair.meerkat.utilities.MLog;
import co.getair.meerkat.utilities.NetworkQueue;
import co.getair.meerkat.utilities.RunnableWithResultObject;
import com.android.volley.Response.ErrorListener;
import com.android.volley.Response.Listener;
import com.android.volley.VolleyError;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import org.json.JSONException;
import org.json.JSONObject;
import org.puremvc.java.multicore.patterns.facade.Facade;
import org.puremvc.java.multicore.patterns.proxy.Proxy;

public class GraphProxy extends Proxy
{
  private final String FOLLOWERS_KEY = "followers";
  private final String FOLLOWING_KEY = "following";
  private final String LOG_TAG = "GraphProxy";
  private final String MY_USER_KEY = "myUserKey";
  private Context context;
  private User myUser;

  public GraphProxy(String paramString, Context paramContext)
  {
    super(paramString);
    this.context = paramContext;
  }

  private void getListForUser(String paramString, User paramUser, final RunnableWithResultObject paramRunnableWithResultObject)
  {
    if (paramRunnableWithResultObject == null)
      return;
    ApiAuthorizedRequest localApiAuthorizedRequest = new ApiAuthorizedRequest(0, (String)paramUser.getFollowupActions().get(paramString), "", new Response.Listener()
    {
      public void onResponse(JSONObject paramAnonymousJSONObject)
      {
        paramRunnableWithResultObject.resultObject = paramAnonymousJSONObject;
        new Thread(paramRunnableWithResultObject).start();
      }
    }
    , new Response.ErrorListener()
    {
      public void onErrorResponse(VolleyError paramAnonymousVolleyError)
      {
        new Thread(paramRunnableWithResultObject).start();
      }
    });
    NetworkQueue.getInstance(this.context).addToRequestQueue(localApiAuthorizedRequest);
  }

  public boolean amIFollowingUser(String paramString)
  {
    Iterator localIterator = getMyFollowingList().iterator();
    while (true)
    {
      boolean bool1 = localIterator.hasNext();
      boolean bool2 = false;
      HashMap localHashMap;
      if (bool1)
        localHashMap = (HashMap)localIterator.next();
      try
      {
        boolean bool3 = ((String)localHashMap.get("id")).equals(paramString);
        if (bool3)
        {
          bool2 = true;
          return bool2;
        }
      }
      catch (Exception localException)
      {
        MLog.e("Malformed user in following");
      }
    }
  }

  public void deleteMyUser()
  {
    DiskWriter.getInstance().deleteObject(this.context.getApplicationContext(), "myUserKey");
  }

  public void followUser(IUserToFollow paramIUserToFollow)
  {
    String str = paramIUserToFollow.getFollowUrl();
    final InboxProxy localInboxProxy = (InboxProxy)ApplicationFacade.getInst(MeerkatApplication.getName()).retrieveProxy("inboxProxy");
    final HashMap localHashMap = new HashMap();
    localHashMap.put("id", paramIUserToFollow.getId());
    localHashMap.put("username", paramIUserToFollow.getUsername());
    localHashMap.put("vname", paramIUserToFollow.getDisplayName());
    localInboxProxy.addItem("following", localHashMap);
    JSONObject localJSONObject = new JSONObject();
    try
    {
      localJSONObject.put("auth", Session.loadSession(this.context).getAuthToken());
      localJSONObject.put("mute", false);
      ApiAuthorizedRequest localApiAuthorizedRequest = new ApiAuthorizedRequest(1, str, localJSONObject, new Response.Listener()
      {
        public void onResponse(JSONObject paramAnonymousJSONObject)
        {
          MLog.d("GraphProxy", "follow success - " + paramAnonymousJSONObject.toString());
          FeedActivityFacade.getInstance(FeedActivity.class.getName()).sendNotification("followSuccessfull", null, null);
        }
      }
      , new Response.ErrorListener()
      {
        public void onErrorResponse(VolleyError paramAnonymousVolleyError)
        {
          localInboxProxy.removeItem("following", localHashMap);
        }
      });
      NetworkQueue.getInstance(this.context).addToRequestQueue(localApiAuthorizedRequest);
      return;
    }
    catch (JSONException localJSONException)
    {
      while (true)
        localJSONException.printStackTrace();
    }
  }

  public String getFollowedDisplayNameForUserId(String paramString)
  {
    Iterator localIterator = getMyFollowingList().iterator();
    while (localIterator.hasNext())
    {
      HashMap localHashMap = (HashMap)localIterator.next();
      try
      {
        if (((String)localHashMap.get("id")).equals(paramString))
        {
          String str1 = (String)localHashMap.get("vname");
          if ((str1 == null) || (str1.isEmpty()))
            return (String)localHashMap.get("username");
          String str2 = (String)localHashMap.get("vname");
          return str2;
        }
      }
      catch (Exception localException)
      {
        MLog.e("Malformed user in following");
      }
    }
    return null;
  }

  public String getFollowedUsernameForUserId(String paramString)
  {
    Iterator localIterator = getMyFollowingList().iterator();
    while (true)
    {
      boolean bool = localIterator.hasNext();
      String str = null;
      HashMap localHashMap;
      if (bool)
        localHashMap = (HashMap)localIterator.next();
      try
      {
        if (((String)localHashMap.get("id")).equals(paramString))
        {
          str = (String)localHashMap.get("username");
          return str;
        }
      }
      catch (Exception localException)
      {
        MLog.e("Malformed user in following");
      }
    }
  }

  public void getFollowersForUser(User paramUser, RunnableWithResultObject paramRunnableWithResultObject)
  {
    getListForUser("followers", paramUser, paramRunnableWithResultObject);
  }

  public Integer getMyFollowingCount()
  {
    return Integer.valueOf(getMyFollowingList().size());
  }

  public ArrayList getMyFollowingList()
  {
    return ((InboxProxy)ApplicationFacade.getInst(MeerkatApplication.getName()).retrieveProxy("inboxProxy")).getBucket("following");
  }

  public void getMyFollowingList(User paramUser, RunnableWithResultObject paramRunnableWithResultObject)
  {
    getListForUser("following", paramUser, paramRunnableWithResultObject);
  }

  public User getMyUser()
  {
    User localUser = this.myUser;
    if (localUser == null)
      localUser = (User)DiskWriter.getInstance().loadObject(this.context.getApplicationContext(), "myUserKey");
    return localUser;
  }

  public void setMyUser(User paramUser)
  {
    this.myUser = paramUser;
    DiskWriter.getInstance().saveObject(this.context.getApplicationContext(), paramUser, "myUserKey");
  }

  public void unfollowUser(IUserToFollow paramIUserToFollow)
  {
    Object[] arrayOfObject = new Object[2];
    arrayOfObject[0] = paramIUserToFollow.getFollowUrl();
    arrayOfObject[1] = Session.loadSession(this.context).getAuthToken();
    String str = String.format("%s&auth=%s", arrayOfObject);
    final InboxProxy localInboxProxy = (InboxProxy)ApplicationFacade.getInst(MeerkatApplication.getName()).retrieveProxy("inboxProxy");
    final HashMap localHashMap = new HashMap();
    localHashMap.put("id", paramIUserToFollow.getId());
    localHashMap.put("username", paramIUserToFollow.getUsername());
    localHashMap.put("vname", paramIUserToFollow.getDisplayName());
    localInboxProxy.removeItem("following", localHashMap);
    ApiAuthorizedRequest localApiAuthorizedRequest = new ApiAuthorizedRequest(3, str, "", new Response.Listener()
    {
      public void onResponse(JSONObject paramAnonymousJSONObject)
      {
        MLog.d("GraphProxy", "unfollow success - " + paramAnonymousJSONObject.toString());
      }
    }
    , new Response.ErrorListener()
    {
      public void onErrorResponse(VolleyError paramAnonymousVolleyError)
      {
        localInboxProxy.addItem("following", localHashMap);
      }
    });
    NetworkQueue.getInstance(this.context).addToRequestQueue(localApiAuthorizedRequest);
  }
}