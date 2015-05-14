package com.twitter.sdk.android.core.internal;

import android.app.Activity;
import com.twitter.sdk.android.core.Session;
import com.twitter.sdk.android.core.SessionManager;
import com.twitter.sdk.android.core.TwitterApiClient;
import com.twitter.sdk.android.core.services.AccountService;
import io.fabric.sdk.android.ActivityLifecycleManager;
import io.fabric.sdk.android.ActivityLifecycleManager.Callbacks;
import io.fabric.sdk.android.services.common.SystemCurrentTimeProvider;
import java.util.Calendar;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import java.util.TimeZone;
import java.util.concurrent.ExecutorService;
import retrofit.RetrofitError;

public class SessionMonitor<T extends Session>
{
  private final AccountServiceProvider accountServiceProvider;
  private final ExecutorService executorService;
  protected final MonitorState monitorState;
  private final SessionManager<T> sessionManager;
  private final SystemCurrentTimeProvider time;

  SessionMonitor(SessionManager<T> paramSessionManager, SystemCurrentTimeProvider paramSystemCurrentTimeProvider, AccountServiceProvider paramAccountServiceProvider, ExecutorService paramExecutorService, MonitorState paramMonitorState)
  {
    this.time = paramSystemCurrentTimeProvider;
    this.sessionManager = paramSessionManager;
    this.accountServiceProvider = paramAccountServiceProvider;
    this.executorService = paramExecutorService;
    this.monitorState = paramMonitorState;
  }

  public SessionMonitor(SessionManager<T> paramSessionManager, ExecutorService paramExecutorService)
  {
    this(paramSessionManager, new SystemCurrentTimeProvider(), new AccountServiceProvider(), paramExecutorService, new MonitorState());
  }

  public void monitorActivityLifecycle(ActivityLifecycleManager paramActivityLifecycleManager)
  {
    paramActivityLifecycleManager.registerCallbacks(new ActivityLifecycleManager.Callbacks()
    {
      public void onActivityStarted(Activity paramAnonymousActivity)
      {
        SessionMonitor.this.triggerVerificationIfNecessary();
      }
    });
  }

  public void triggerVerificationIfNecessary()
  {
    Session localSession = this.sessionManager.getActiveSession();
    long l = this.time.getCurrentTimeMillis();
    if ((localSession != null) && (this.monitorState.beginVerification(l)));
    for (int i = 1; ; i = 0)
    {
      if (i != 0)
        this.executorService.submit(new Runnable()
        {
          public void run()
          {
            SessionMonitor.this.verifyAll();
          }
        });
      return;
    }
  }

  protected void verifyAll()
  {
    Iterator localIterator = this.sessionManager.getSessionMap().values().iterator();
    while (localIterator.hasNext())
      verifySession((Session)localIterator.next());
    this.monitorState.endVerification(this.time.getCurrentTimeMillis());
  }

  protected void verifySession(Session paramSession)
  {
    AccountService localAccountService = this.accountServiceProvider.getAccountService(paramSession);
    try
    {
      localAccountService.verifyCredentials(Boolean.valueOf(true), Boolean.valueOf(false));
      return;
    }
    catch (RetrofitError localRetrofitError)
    {
    }
  }

  protected static class AccountServiceProvider
  {
    public AccountService getAccountService(Session paramSession)
    {
      return new TwitterApiClient(paramSession).getAccountService();
    }
  }

  protected static class MonitorState
  {
    private static final long TIME_THRESHOLD_IN_MILLIS = 21600000L;
    public long lastVerification;
    private final Calendar utcCalendar = Calendar.getInstance(TimeZone.getTimeZone("UTC"));
    public boolean verifying;

    private boolean isOnSameDate(long paramLong1, long paramLong2)
    {
      this.utcCalendar.setTimeInMillis(paramLong1);
      int i = this.utcCalendar.get(6);
      int j = this.utcCalendar.get(1);
      this.utcCalendar.setTimeInMillis(paramLong2);
      int k = this.utcCalendar.get(6);
      int m = this.utcCalendar.get(1);
      return (i == k) && (j == m);
    }

    public boolean beginVerification(long paramLong)
    {
      boolean bool1 = true;
      try
      {
        boolean bool2;
        boolean bool3;
        if (paramLong - this.lastVerification > 21600000L)
        {
          bool2 = bool1;
          if (isOnSameDate(paramLong, this.lastVerification))
            break label67;
          bool3 = bool1;
          label35: if ((this.verifying) || ((!bool2) && (!bool3)))
            break label73;
          this.verifying = true;
        }
        while (true)
        {
          return bool1;
          bool2 = false;
          break;
          label67: bool3 = false;
          break label35;
          label73: bool1 = false;
        }
      }
      finally
      {
      }
    }

    public void endVerification(long paramLong)
    {
      try
      {
        this.verifying = false;
        this.lastVerification = paramLong;
        return;
      }
      finally
      {
        localObject = finally;
        throw localObject;
      }
    }
  }
}