package co.getair.meerkat.commands.userlist;

import android.app.Activity;
import co.getair.meerkat.ApiProxy;
import co.getair.meerkat.MeerkatApplication;
import co.getair.meerkat.dtos.FollowUser;
import co.getair.meerkat.dtos.Session;
import co.getair.meerkat.facades.ApplicationFacade;
import co.getair.meerkat.facades.BaseFacade;
import co.getair.meerkat.proxies.GraphProxy;
import co.getair.meerkat.utilities.ApiAuthorizedRequest;
import co.getair.meerkat.utilities.NetworkQueue;
import co.getair.meerkat.utilities.RunnableWithResultObject;
import com.android.volley.Response.ErrorListener;
import com.android.volley.Response.Listener;
import com.android.volley.VolleyError;
import com.google.gson.Gson;
import java.util.ArrayList;
import org.json.JSONArray;
import org.json.JSONObject;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.command.SimpleCommand;
import org.puremvc.java.multicore.patterns.facade.Facade;

public class LoadUserListCommand extends SimpleCommand
{
  RunnableWithResultObject resultHandler = new RunnableWithResultObject()
  {
    public void run()
    {
      if (this.resultObject != null)
        try
        {
          JSONArray localJSONArray = (JSONArray)((JSONObject)this.resultObject).get("result");
          ArrayList localArrayList = new ArrayList();
          Gson localGson = new Gson();
          if (localJSONArray != null)
            for (int i = 0; i < localJSONArray.length(); i++)
              localArrayList.add((FollowUser)localGson.fromJson(localJSONArray.get(i).toString(), FollowUser.class));
          LoadUserListCommand.this.getFacade().sendNotification("userlistLoaded", localArrayList, null);
          return;
        }
        catch (Exception localException)
        {
          LoadUserListCommand.this.getFacade().sendNotification("userlistLoadingError", null, null);
          return;
        }
      LoadUserListCommand.this.getFacade().sendNotification("userlistLoadingError", null, null);
    }
  };

  private void loadFollowerListSource()
  {
    GraphProxy localGraphProxy = (GraphProxy)ApplicationFacade.getInst(MeerkatApplication.getName()).retrieveProxy("graphProxy");
    localGraphProxy.getFollowersForUser(localGraphProxy.getMyUser(), this.resultHandler);
  }

  private void loadFollowingListSource()
  {
    GraphProxy localGraphProxy = (GraphProxy)ApplicationFacade.getInst(MeerkatApplication.getName()).retrieveProxy("graphProxy");
    localGraphProxy.getMyFollowingList(localGraphProxy.getMyUser(), this.resultHandler);
  }

  private void loadLeaderboardListSource()
  {
    Activity localActivity = ((BaseFacade)getFacade()).getOwnerActivity();
    ApiProxy localApiProxy = ApiProxy.getInstance(localActivity);
    Object[] arrayOfObject = new Object[2];
    arrayOfObject[0] = localApiProxy.getUrlForFollowupActionKey("leaderboard");
    arrayOfObject[1] = Session.loadSession(localActivity).getAuthToken();
    ApiAuthorizedRequest localApiAuthorizedRequest = new ApiAuthorizedRequest(0, String.format("%s?auth=%s", arrayOfObject), "", new Response.Listener()
    {
      public void onResponse(JSONObject paramAnonymousJSONObject)
      {
        LoadUserListCommand.this.resultHandler.resultObject = paramAnonymousJSONObject;
        new Thread(LoadUserListCommand.this.resultHandler).start();
      }
    }
    , new Response.ErrorListener()
    {
      public void onErrorResponse(VolleyError paramAnonymousVolleyError)
      {
        new Thread(LoadUserListCommand.this.resultHandler).start();
      }
    });
    NetworkQueue.getInstance(localActivity).addToRequestQueue(localApiAuthorizedRequest);
  }

  public void execute(INotification paramINotification)
  {
    super.execute(paramINotification);
    String str = (String)paramINotification.getBody();
    if (str.equals("following"))
      loadFollowingListSource();
    do
    {
      return;
      if (str.equals("followers"))
      {
        loadFollowerListSource();
        return;
      }
    }
    while (!str.equals("leaderboard"));
    loadLeaderboardListSource();
  }
}