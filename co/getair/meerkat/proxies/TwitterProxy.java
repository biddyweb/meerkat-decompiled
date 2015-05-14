package co.getair.meerkat.proxies;

import android.content.Context;
import android.graphics.Bitmap;
import co.getair.meerkat.dtos.GetTwitterFrindsIdsResponseObject;
import co.getair.meerkat.utilities.CustomService;
import co.getair.meerkat.utilities.MLog;
import co.getair.meerkat.utilities.MeerkatTwitterApiClient;
import co.getair.meerkat.utilities.NetworkQueue;
import co.getair.meerkat.utilities.RunnableWithResultObject;
import com.android.volley.Response.Listener;
import com.android.volley.toolbox.ImageRequest;
import com.google.common.base.Optional;
import com.google.common.cache.Cache;
import com.google.common.cache.CacheBuilder;
import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.twitter.sdk.android.Twitter;
import com.twitter.sdk.android.core.Callback;
import com.twitter.sdk.android.core.Result;
import com.twitter.sdk.android.core.SessionManager;
import com.twitter.sdk.android.core.TwitterException;
import com.twitter.sdk.android.core.TwitterSession;
import com.twitter.sdk.android.core.models.User;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;
import org.puremvc.java.multicore.patterns.proxy.Proxy;

public class TwitterProxy extends Proxy
{
  private static final String LOG_TAG = "TwitterProxy";
  private static final String TWEET_COMMENTS_KEY = "tweetCommentsKey";
  private static final Cache<String, Boolean> commentsState = CacheBuilder.newBuilder().expireAfterWrite(24L, TimeUnit.HOURS).build();
  private final Context context;

  public TwitterProxy(String paramString, Context paramContext)
  {
    super(paramString, paramContext);
    this.context = paramContext;
  }

  private void getUserFrindsIdsForPage(long paramLong, final ArrayList<String> paramArrayList)
  {
    MeerkatTwitterApiClient localMeerkatTwitterApiClient = new MeerkatTwitterApiClient((TwitterSession)Twitter.getSessionManager().getActiveSession());
    long l = ((TwitterSession)Twitter.getSessionManager().getActiveSession()).getUserId();
    try
    {
      localMeerkatTwitterApiClient.getCustomService().getFriendsIds(l, paramLong, new Callback()
      {
        public void failure(TwitterException paramAnonymousTwitterException)
        {
        }

        public void success(Result<JsonObject> paramAnonymousResult)
        {
          MLog.d("TwitterProxy", paramAnonymousResult.toString());
          MLog.d("TwitterProxy", ((JsonObject)paramAnonymousResult.data).toString());
          try
          {
            GetTwitterFrindsIdsResponseObject localGetTwitterFrindsIdsResponseObject = (GetTwitterFrindsIdsResponseObject)new Gson().fromJson(String.valueOf(paramAnonymousResult.data), GetTwitterFrindsIdsResponseObject.class);
            if (!localGetTwitterFrindsIdsResponseObject.getIds().isEmpty())
              paramArrayList.addAll(localGetTwitterFrindsIdsResponseObject.getIds());
            if (localGetTwitterFrindsIdsResponseObject.getPrevious_cursor() != localGetTwitterFrindsIdsResponseObject.getNext_cursor())
            {
              TwitterProxy.this.getUserFrindsIdsForPage(localGetTwitterFrindsIdsResponseObject.getNext_cursor(), paramArrayList);
              return;
            }
            TwitterProxy.this.sendNotification("eventTwitterFriendsListArrived", paramArrayList, null);
            return;
          }
          catch (Exception localException)
          {
            localException.printStackTrace();
          }
        }
      });
      return;
    }
    catch (Exception localException)
    {
      MLog.d("TwitterProxy", localException.toString());
    }
  }

  public static boolean isCommentsShouldTweet()
  {
    return ((Boolean)Optional.fromNullable(commentsState.getIfPresent("tweetCommentsKey")).or(Boolean.TRUE)).booleanValue();
  }

  public static void setCommentsShouldTweetState(boolean paramBoolean)
  {
    commentsState.put("tweetCommentsKey", Boolean.valueOf(paramBoolean));
  }

  public void favoriteTweet(final String paramString)
  {
    new MeerkatTwitterApiClient((TwitterSession)Twitter.getSessionManager().getActiveSession()).getCustomService().favoriteTweet(paramString, new Callback()
    {
      public void failure(TwitterException paramAnonymousTwitterException)
      {
        paramAnonymousTwitterException.printStackTrace();
      }

      public void success(Result<JsonObject> paramAnonymousResult)
      {
        MLog.d("TwitterProxy", "favorite tweet success");
        MLog.d("TwitterProxy", "tweet id: " + paramString);
      }
    });
  }

  public void getTwitterUser(final RunnableWithResultObject paramRunnableWithResultObject)
  {
    MeerkatTwitterApiClient localMeerkatTwitterApiClient = new MeerkatTwitterApiClient((TwitterSession)Twitter.getSessionManager().getActiveSession());
    try
    {
      localMeerkatTwitterApiClient.getCustomService().show(((TwitterSession)Twitter.getSessionManager().getActiveSession()).getUserId(), new Callback()
      {
        public void failure(TwitterException paramAnonymousTwitterException)
        {
          paramRunnableWithResultObject.success = false;
          paramRunnableWithResultObject.run();
          MLog.d("TwitterProxy", paramAnonymousTwitterException.toString());
        }

        public void success(Result<User> paramAnonymousResult)
        {
          MLog.d("TwitterProxy", ((User)paramAnonymousResult.data).description);
          MLog.d("TwitterProxy", ((User)paramAnonymousResult.data).profileImageUrl);
          MLog.d("TwitterProxy", ((User)paramAnonymousResult.data).name);
          MLog.d("TwitterProxy", ((User)paramAnonymousResult.data).screenName);
          paramRunnableWithResultObject.success = true;
          paramRunnableWithResultObject.resultObject = paramAnonymousResult.data;
          paramRunnableWithResultObject.run();
          TwitterProxy.this.getUserFriendsIds();
        }
      });
      return;
    }
    catch (Exception localException)
    {
      paramRunnableWithResultObject.success = false;
      paramRunnableWithResultObject.run();
      MLog.d("TwitterProxy", localException.toString());
    }
  }

  public void getUserFriendsIds()
  {
    getUserFrindsIdsForPage(-1L, new ArrayList());
  }

  public void getUserProfileImage(User paramUser, final RunnableWithResultObject paramRunnableWithResultObject)
  {
    ImageRequest localImageRequest = new ImageRequest(paramUser.profileImageUrl.replace("_normal", ""), new Response.Listener()
    {
      public void onResponse(Bitmap paramAnonymousBitmap)
      {
        MLog.d("TwitterProxy", "profile image arrived");
        paramRunnableWithResultObject.success = true;
        paramRunnableWithResultObject.resultObject = paramAnonymousBitmap;
        paramRunnableWithResultObject.run();
      }
    }
    , 0, 0, null, null);
    NetworkQueue.getInstance(this.context).addToRequestQueue(localImageRequest);
  }

  public void logout()
  {
    Twitter.logOut();
  }

  public void replyTweet(final String paramString1, final String paramString2, final String paramString3)
  {
    MeerkatTwitterApiClient localMeerkatTwitterApiClient = new MeerkatTwitterApiClient((TwitterSession)Twitter.getSessionManager().getActiveSession());
    try
    {
      String str = "@" + paramString2 + " " + paramString1;
      localMeerkatTwitterApiClient.getCustomService().replyTweet(str, paramString3, new Callback()
      {
        public void failure(TwitterException paramAnonymousTwitterException)
        {
          MLog.d("TwitterProxy", paramAnonymousTwitterException.toString());
        }

        public void success(Result<JsonObject> paramAnonymousResult)
        {
          MLog.d("TwitterProxy", "reply tweet success");
          MLog.d("TwitterProxy", "tweet: " + paramString1);
          MLog.d("TwitterProxy", "tweet id: " + paramString3);
          MLog.d("TwitterProxy", "tweeter username: " + paramString2);
        }
      });
      return;
    }
    catch (Exception localException)
    {
    }
  }

  public void retweetTweet(final String paramString)
  {
    new MeerkatTwitterApiClient((TwitterSession)Twitter.getSessionManager().getActiveSession()).getCustomService().retweet(paramString, new Callback()
    {
      public void failure(TwitterException paramAnonymousTwitterException)
      {
        paramAnonymousTwitterException.printStackTrace();
      }

      public void success(Result<JsonObject> paramAnonymousResult)
      {
        MLog.d("TwitterProxy", "retweet tweet success");
        MLog.d("TwitterProxy", "tweet id: " + paramString);
      }
    });
  }

  public void tweet(String paramString, final RunnableWithResultObject paramRunnableWithResultObject)
  {
    MeerkatTwitterApiClient localMeerkatTwitterApiClient = new MeerkatTwitterApiClient((TwitterSession)Twitter.getSessionManager().getActiveSession());
    try
    {
      localMeerkatTwitterApiClient.getCustomService().tweet(paramString, new Callback()
      {
        public void failure(TwitterException paramAnonymousTwitterException)
        {
          MLog.d("TwitterProxy", paramAnonymousTwitterException.toString());
          paramRunnableWithResultObject.success = false;
          paramRunnableWithResultObject.run();
        }

        public void success(Result<JsonObject> paramAnonymousResult)
        {
          String str = ((JsonObject)paramAnonymousResult.data).get("id_str").getAsString();
          paramRunnableWithResultObject.resultObject = str;
          paramRunnableWithResultObject.success = true;
          paramRunnableWithResultObject.run();
        }
      });
      return;
    }
    catch (Exception localException)
    {
    }
  }
}