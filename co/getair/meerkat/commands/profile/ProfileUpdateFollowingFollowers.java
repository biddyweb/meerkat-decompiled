package co.getair.meerkat.commands.profile;

import co.getair.meerkat.MeerkatApplication;
import co.getair.meerkat.facades.ApplicationFacade;
import co.getair.meerkat.facades.BaseFacade;
import co.getair.meerkat.proxies.GraphProxy;
import co.getair.meerkat.utilities.RunnableWithResultObject;
import java.util.ArrayList;
import org.json.JSONArray;
import org.json.JSONObject;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.command.SimpleCommand;
import org.puremvc.java.multicore.patterns.facade.Facade;

public class ProfileUpdateFollowingFollowers extends SimpleCommand
{
  private BaseFacade getBaseFacade()
  {
    return (BaseFacade)getFacade();
  }

  public void execute(INotification paramINotification)
  {
    super.execute(paramINotification);
    GraphProxy localGraphProxy = (GraphProxy)ApplicationFacade.getInst(MeerkatApplication.getName()).retrieveProxy("graphProxy");
    localGraphProxy.getFollowersForUser(localGraphProxy.getMyUser(), new RunnableWithResultObject()
    {
      public void run()
      {
        if (this.resultObject != null)
          try
          {
            JSONArray localJSONArray = (JSONArray)((JSONObject)this.resultObject).get("result");
            ArrayList localArrayList = new ArrayList();
            if (localJSONArray != null)
              for (int i = 0; i < localJSONArray.length(); i++)
                localArrayList.add(localJSONArray.get(i).toString());
            ProfileUpdateFollowingFollowers.this.getFacade().sendNotification("profileFollowerLoaded", localArrayList, null);
            return;
          }
          catch (Exception localException)
          {
            ProfileUpdateFollowingFollowers.this.getFacade().sendNotification("profileFollowerLoadingError", null, null);
            return;
          }
        ProfileUpdateFollowingFollowers.this.getFacade().sendNotification("profileFollowerLoadingError", null, null);
      }
    });
    localGraphProxy.getMyFollowingCount();
  }
}