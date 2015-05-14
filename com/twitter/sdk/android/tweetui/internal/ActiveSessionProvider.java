package com.twitter.sdk.android.tweetui.internal;

import com.twitter.sdk.android.core.Session;
import com.twitter.sdk.android.core.SessionManager;
import java.util.Iterator;
import java.util.List;

public class ActiveSessionProvider
{
  private final List<SessionManager<? extends Session>> sessionManagers;

  public ActiveSessionProvider(List<SessionManager<? extends Session>> paramList)
  {
    this.sessionManagers = paramList;
  }

  public Session getActiveSession()
  {
    Session localSession = null;
    Iterator localIterator = this.sessionManagers.iterator();
    do
    {
      if (!localIterator.hasNext())
        break;
      localSession = ((SessionManager)localIterator.next()).getActiveSession();
    }
    while (localSession == null);
    return localSession;
  }
}