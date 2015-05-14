package co.getair.meerkat.proxies;

import android.content.Context;
import co.getair.meerkat.utilities.ApiAuthorizedRequest;
import co.getair.meerkat.utilities.ApplicationPreferences;
import co.getair.meerkat.utilities.MLog;
import co.getair.meerkat.utilities.NetworkQueue;
import co.getair.meerkat.utilities.RunnableWithResultObject;
import com.android.volley.Response.ErrorListener;
import com.android.volley.Response.Listener;
import com.android.volley.VolleyError;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.HashMap;
import org.json.JSONException;
import org.json.JSONObject;
import org.puremvc.java.multicore.patterns.proxy.Proxy;

public class StreamCommentsProxy extends Proxy
{
  private static final String ADD_COMMENT_URL_KEY = "comments";
  private static final String NAME = "CommentsOnVideoProxy";
  private String addCommentUrl = "";
  private String broadcasterName = "";
  private Context context;
  private String tweetId = "";

  public StreamCommentsProxy(Context paramContext, String paramString1, HashMap<String, String> paramHashMap, String paramString2, String paramString3)
  {
    super(NAME());
    this.context = paramContext;
    this.broadcasterName = paramString3;
    this.tweetId = paramString2;
    try
    {
      this.addCommentUrl = new URI(paramString1).resolve((String)paramHashMap.get("comments")).toString();
      return;
    }
    catch (URISyntaxException localURISyntaxException)
    {
      localURISyntaxException.printStackTrace();
    }
  }

  public static String NAME()
  {
    return "CommentsOnVideoProxy";
  }

  public void addCommentToStream(String paramString, final RunnableWithResultObject paramRunnableWithResultObject)
  {
    JSONObject localJSONObject = new JSONObject();
    try
    {
      localJSONObject.put("body", paramString);
      localJSONObject.put("auth", new ApplicationPreferences(this.context).getAuthToken());
      ApiAuthorizedRequest localApiAuthorizedRequest = new ApiAuthorizedRequest(1, this.addCommentUrl, localJSONObject, new Response.Listener()
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

  public String getBroadcasterName()
  {
    return this.broadcasterName;
  }

  public String getTweetId()
  {
    return this.tweetId;
  }

  public void setTweetId(String paramString)
  {
    this.tweetId = paramString;
  }
}