package co.getair.meerkat.proxies;

import co.getair.meerkat.MeerkatApplication;
import co.getair.meerkat.facades.ApplicationFacade;
import java.util.ArrayList;
import java.util.HashMap;

public class ScoreProxy
{
  private static ArrayList getBucket()
  {
    return ((InboxProxy)ApplicationFacade.getInst(MeerkatApplication.getName()).retrieveProxy("inboxProxy")).getBucket("score");
  }

  public static int getScore()
  {
    ArrayList localArrayList = getBucket();
    int i = 0;
    if (localArrayList != null)
    {
      int j = localArrayList.size();
      i = 0;
      if (j == 1)
        i = ((Double)((HashMap)localArrayList.get(0)).get("o")).intValue();
    }
    return i;
  }
}