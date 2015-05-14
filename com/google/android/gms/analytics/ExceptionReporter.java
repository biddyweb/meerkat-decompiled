package com.google.android.gms.analytics;

import android.content.Context;
import java.util.ArrayList;

public class ExceptionReporter
  implements Thread.UncaughtExceptionHandler
{
  private final Context mContext;
  private final Thread.UncaughtExceptionHandler zzBK;
  private final Tracker zzBL;
  private ExceptionParser zzBM;
  private GoogleAnalytics zzBN;

  public ExceptionReporter(Tracker paramTracker, Thread.UncaughtExceptionHandler paramUncaughtExceptionHandler, Context paramContext)
  {
    if (paramTracker == null)
      throw new NullPointerException("tracker cannot be null");
    if (paramContext == null)
      throw new NullPointerException("context cannot be null");
    this.zzBK = paramUncaughtExceptionHandler;
    this.zzBL = paramTracker;
    this.zzBM = new StandardExceptionParser(paramContext, new ArrayList());
    this.mContext = paramContext.getApplicationContext();
    StringBuilder localStringBuilder = new StringBuilder().append("ExceptionReporter created, original handler is ");
    if (paramUncaughtExceptionHandler == null);
    for (String str = "null"; ; str = paramUncaughtExceptionHandler.getClass().getName())
    {
      zzae.zzab(str);
      return;
    }
  }

  public ExceptionParser getExceptionParser()
  {
    return this.zzBM;
  }

  public void setExceptionParser(ExceptionParser paramExceptionParser)
  {
    this.zzBM = paramExceptionParser;
  }

  public void uncaughtException(Thread paramThread, Throwable paramThrowable)
  {
    String str1 = "UncaughtException";
    if (this.zzBM != null)
      if (paramThread == null)
        break label120;
    label120: for (String str2 = paramThread.getName(); ; str2 = null)
    {
      str1 = this.zzBM.getDescription(str2, paramThrowable);
      zzae.zzab("Tracking Exception: " + str1);
      this.zzBL.send(new HitBuilders.ExceptionBuilder().setDescription(str1).setFatal(true).build());
      GoogleAnalytics localGoogleAnalytics = zzfC();
      localGoogleAnalytics.dispatchLocalHits();
      localGoogleAnalytics.zzfj();
      if (this.zzBK != null)
      {
        zzae.zzab("Passing exception to original handler.");
        this.zzBK.uncaughtException(paramThread, paramThrowable);
      }
      return;
    }
  }

  GoogleAnalytics zzfC()
  {
    if (this.zzBN == null)
      this.zzBN = GoogleAnalytics.getInstance(this.mContext);
    return this.zzBN;
  }

  Thread.UncaughtExceptionHandler zzfD()
  {
    return this.zzBK;
  }
}