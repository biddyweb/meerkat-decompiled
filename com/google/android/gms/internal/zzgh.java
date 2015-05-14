package com.google.android.gms.internal;

import android.content.Context;
import android.net.Uri.Builder;
import android.os.Build.VERSION;
import android.os.Looper;
import android.text.TextUtils;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.LinkedList;

@zzgi
public class zzgh
  implements Thread.UncaughtExceptionHandler
{
  private Context mContext;
  private Thread.UncaughtExceptionHandler zzwb;
  private Thread.UncaughtExceptionHandler zzwc;
  private zzhy zzwd;

  public zzgh(Context paramContext, zzhy paramzzhy, Thread.UncaughtExceptionHandler paramUncaughtExceptionHandler1, Thread.UncaughtExceptionHandler paramUncaughtExceptionHandler2)
  {
    this.zzwb = paramUncaughtExceptionHandler1;
    this.zzwc = paramUncaughtExceptionHandler2;
    this.mContext = paramContext;
    this.zzwd = paramzzhy;
  }

  public static zzgh zza(Context paramContext, Thread paramThread, zzhy paramzzhy)
  {
    if ((paramContext == null) || (paramThread == null) || (paramzzhy == null))
      return null;
    if (!zzn(paramContext))
      return null;
    Thread.UncaughtExceptionHandler localUncaughtExceptionHandler = paramThread.getUncaughtExceptionHandler();
    zzgh localzzgh = new zzgh(paramContext, paramzzhy, localUncaughtExceptionHandler, Thread.getDefaultUncaughtExceptionHandler());
    if ((localUncaughtExceptionHandler == null) || (!(localUncaughtExceptionHandler instanceof zzgh)))
      try
      {
        paramThread.setUncaughtExceptionHandler(localzzgh);
        return localzzgh;
      }
      catch (SecurityException localSecurityException)
      {
        zzhx.zzc("Fail to set UncaughtExceptionHandler.", localSecurityException);
        return null;
      }
    return (zzgh)localUncaughtExceptionHandler;
  }

  private Throwable zzd(Throwable paramThrowable)
  {
    if (((Boolean)zzca.zzqp.get()).booleanValue())
      return paramThrowable;
    LinkedList localLinkedList = new LinkedList();
    while (paramThrowable != null)
    {
      localLinkedList.push(paramThrowable);
      paramThrowable = paramThrowable.getCause();
    }
    Object localObject1 = null;
    Throwable localThrowable;
    Object localObject2;
    if (!localLinkedList.isEmpty())
    {
      localThrowable = (Throwable)localLinkedList.pop();
      StackTraceElement[] arrayOfStackTraceElement = localThrowable.getStackTrace();
      ArrayList localArrayList = new ArrayList();
      localArrayList.add(new StackTraceElement(localThrowable.getClass().getName(), "<filtered>", "<filtered>", 1));
      int i = arrayOfStackTraceElement.length;
      int j = 0;
      int k = 0;
      if (j < i)
      {
        StackTraceElement localStackTraceElement = arrayOfStackTraceElement[j];
        if (zzO(localStackTraceElement.getClassName()))
        {
          localArrayList.add(localStackTraceElement);
          k = 1;
        }
        while (true)
        {
          j++;
          break;
          if (zzP(localStackTraceElement.getClassName()))
            localArrayList.add(localStackTraceElement);
          else
            localArrayList.add(new StackTraceElement("<filtered>", "<filtered>", "<filtered>", 1));
        }
      }
      if (k == 0)
        break label268;
      if (localObject1 == null)
      {
        localObject2 = new Throwable(localThrowable.getMessage());
        label225: ((Throwable)localObject2).setStackTrace((StackTraceElement[])localArrayList.toArray(new StackTraceElement[0]));
      }
    }
    while (true)
    {
      localObject1 = localObject2;
      break;
      localObject2 = new Throwable(localThrowable.getMessage(), localObject1);
      break label225;
      return localObject1;
      label268: localObject2 = localObject1;
    }
  }

  private static boolean zzn(Context paramContext)
  {
    return ((Boolean)zzca.zzqo.get()).booleanValue();
  }

  public void uncaughtException(Thread paramThread, Throwable paramThrowable)
  {
    if (zza(paramThrowable))
    {
      zzb(paramThrowable);
      if (Looper.getMainLooper().getThread() == paramThread);
    }
    do
    {
      return;
      if (this.zzwb != null)
      {
        this.zzwb.uncaughtException(paramThread, paramThrowable);
        return;
      }
    }
    while (this.zzwc == null);
    this.zzwc.uncaughtException(paramThread, paramThrowable);
  }

  protected boolean zzO(String paramString)
  {
    if (TextUtils.isEmpty(paramString))
      return false;
    if (paramString.startsWith("com.google.android.gms.ads"))
      return true;
    if (paramString.startsWith("com.google.ads"))
      return true;
    try
    {
      boolean bool = Class.forName(paramString).isAnnotationPresent(zzgi.class);
      return bool;
    }
    catch (Exception localException)
    {
      zzhx.zza("Fail to check class type for class " + paramString, localException);
    }
    return false;
  }

  protected boolean zzP(String paramString)
  {
    if (TextUtils.isEmpty(paramString));
    while ((!paramString.startsWith("android.")) && (!paramString.startsWith("java.")))
      return false;
    return true;
  }

  protected boolean zza(Throwable paramThrowable)
  {
    boolean bool = true;
    if (paramThrowable == null)
      return false;
    int i = 0;
    int j = 0;
    while (paramThrowable != null)
    {
      for (StackTraceElement localStackTraceElement : paramThrowable.getStackTrace())
      {
        if (zzO(localStackTraceElement.getClassName()))
          j = bool;
        if (getClass().getName().equals(localStackTraceElement.getClassName()))
          i = bool;
      }
      paramThrowable = paramThrowable.getCause();
    }
    if ((j != 0) && (i == 0));
    while (true)
    {
      return bool;
      bool = false;
    }
  }

  public void zzb(Throwable paramThrowable)
  {
    if (!zzn(this.mContext));
    Throwable localThrowable;
    do
    {
      return;
      localThrowable = zzd(paramThrowable);
    }
    while (localThrowable == null);
    ArrayList localArrayList = new ArrayList();
    localArrayList.add(zzc(localThrowable));
    zzab.zzaM().zza(this.mContext, this.zzwd.zzzH, localArrayList, zzab.zzaP().zzej());
  }

  protected String zzc(Throwable paramThrowable)
  {
    StringWriter localStringWriter = new StringWriter();
    paramThrowable.printStackTrace(new PrintWriter(localStringWriter));
    return new Uri.Builder().scheme("https").path("//pagead2.googlesyndication.com/pagead/gen_204").appendQueryParameter("id", "gmob-apps-report-exception").appendQueryParameter("os", Build.VERSION.RELEASE).appendQueryParameter("api", String.valueOf(Build.VERSION.SDK_INT)).appendQueryParameter("device", zzab.zzaM().zzev()).appendQueryParameter("js", this.zzwd.zzzH).appendQueryParameter("appid", this.mContext.getApplicationContext().getPackageName()).appendQueryParameter("stacktrace", localStringWriter.toString()).appendQueryParameter("eids", TextUtils.join(",", zzca.zzcb())).toString();
  }
}