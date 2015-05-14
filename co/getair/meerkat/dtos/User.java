package co.getair.meerkat.dtos;

import android.content.Context;
import android.net.Uri;
import co.getair.meerkat.ApiProxy;
import co.getair.meerkat.utilities.ApiAuthorizedRequest;
import co.getair.meerkat.utilities.MLog;
import co.getair.meerkat.utilities.NetworkQueue;
import co.getair.meerkat.utilities.RunnableWithResultObject;
import com.android.volley.Response.ErrorListener;
import com.android.volley.Response.Listener;
import com.android.volley.VolleyError;
import com.google.gson.Gson;
import java.io.Serializable;
import java.util.HashMap;
import org.json.JSONException;
import org.json.JSONObject;

public class User
  implements Serializable, IUserToFollow
{
  private static String myUserFileName = "myUser.persistency";
  private final String FOLLOW_ACTION_URL_KEY = "follow";
  private String bio;
  private String deviceToken;
  private String displayName;
  private HashMap<String, String> followupActions;
  private String id;
  private String privacy;
  private Stats stats;
  private String twitterId;
  private String username;

  public User(String paramString1, String paramString2, String paramString3, String paramString4, String paramString5, String paramString6)
  {
    this.id = paramString1;
    this.privacy = paramString2;
    this.username = paramString3;
    this.displayName = paramString4;
    this.twitterId = paramString5;
    this.bio = paramString6;
  }

  public static void fetchUser(Context paramContext, String paramString, RunnableWithResultObject paramRunnableWithResultObject)
  {
    if (paramRunnableWithResultObject == null)
      return;
    ApiAuthorizedRequest localApiAuthorizedRequest = new ApiAuthorizedRequest(0, ApiProxy.getInstance(paramContext).getUrlForFollowupActionKey("profileTemplate").replace("{userId}", paramString), "", new Response.Listener()
    {
      public void onResponse(JSONObject paramAnonymousJSONObject)
      {
        MLog.i(paramAnonymousJSONObject.toString());
        try
        {
          JSONObject localJSONObject1 = paramAnonymousJSONObject.getJSONObject("result");
          JSONObject localJSONObject2 = paramAnonymousJSONObject.getJSONObject("followupActions");
          HashMap localHashMap = (HashMap)new Gson().fromJson(localJSONObject2.toString(), HashMap.class);
          JSONObject localJSONObject3 = localJSONObject1.getJSONObject("info");
          JSONObject localJSONObject4 = localJSONObject1.getJSONObject("stats");
          User localUser = (User)new Gson().fromJson(localJSONObject3.toString(), User.class);
          localUser.setFollowupActions(localHashMap);
          localUser.setStats((User.Stats)new Gson().fromJson(localJSONObject4.toString(), User.Stats.class));
          this.val$completionRunnable.resultObject = localUser;
          new Thread(this.val$completionRunnable).start();
          return;
        }
        catch (JSONException localJSONException)
        {
          MLog.e("Error parsing user object");
          return;
        }
        catch (Exception localException)
        {
          MLog.e("Error parsing user object");
        }
      }
    }
    , new Response.ErrorListener()
    {
      public void onErrorResponse(VolleyError paramAnonymousVolleyError)
      {
        MLog.e("Error get  user object");
        new Thread(this.val$completionRunnable).start();
      }
    });
    NetworkQueue.getInstance(paramContext).addToRequestQueue(localApiAuthorizedRequest);
  }

  public static String getMyUserFileName()
  {
    return myUserFileName;
  }

  public String getBio()
  {
    return this.bio;
  }

  public String getDeviceToken()
  {
    return this.deviceToken;
  }

  public String getDisplayName()
  {
    return Uri.decode(this.displayName);
  }

  public String getFollowUrl()
  {
    return (String)this.followupActions.get("follow");
  }

  public HashMap<String, String> getFollowupActions()
  {
    return this.followupActions;
  }

  public String getId()
  {
    return this.id;
  }

  public String getImageUrl()
  {
    return (String)this.followupActions.get("profileImage");
  }

  public String getPrivacy()
  {
    return this.privacy;
  }

  public Stats getStats()
  {
    return this.stats;
  }

  public String getThumbnailImageUrl()
  {
    return (String)this.followupActions.get("profileThumbImage");
  }

  public String getTwitterId()
  {
    return this.twitterId;
  }

  public String getUsername()
  {
    return this.username;
  }

  public void setDeviceToken(String paramString)
  {
    this.deviceToken = paramString;
  }

  public void setFollowupActions(HashMap<String, String> paramHashMap)
  {
    this.followupActions = paramHashMap;
  }

  public void setStats(Stats paramStats)
  {
    this.stats = paramStats;
  }

  public class Stats
    implements Serializable
  {
    int followersCount;
    int followingCount;
    int score;
    int streamsCount;

    public Stats()
    {
    }

    public int getFollowersCount()
    {
      return this.followersCount;
    }

    public int getFollowingCount()
    {
      return this.followingCount;
    }

    public int getScore()
    {
      return this.score;
    }

    public int getStreamsCount()
    {
      return this.streamsCount;
    }
  }
}