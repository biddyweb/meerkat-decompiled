package com.twitter.sdk.android.core;

import java.util.Map;

public abstract interface SessionManager<T extends Session>
{
  public abstract void clearActiveSession();

  public abstract void clearSession(long paramLong);

  public abstract T getActiveSession();

  public abstract T getSession(long paramLong);

  public abstract Map<Long, T> getSessionMap();

  public abstract void setActiveSession(T paramT);

  public abstract void setSession(long paramLong, T paramT);
}