package com.google.android.gms.common.internal;

import android.content.Context;
import android.util.Log;
import com.google.android.gms.internal.zztc;

public final class zzp
{
  private final String zzQq;

  public zzp(String paramString)
  {
    this.zzQq = ((String)zzx.zzl(paramString));
  }

  public void zza(Context paramContext, String paramString1, String paramString2, Throwable paramThrowable)
  {
    StackTraceElement[] arrayOfStackTraceElement = paramThrowable.getStackTrace();
    StringBuilder localStringBuilder = new StringBuilder();
    for (int i = 0; (i < arrayOfStackTraceElement.length) && (i < 2); i++)
    {
      localStringBuilder.append(arrayOfStackTraceElement[i].toString());
      localStringBuilder.append("\n");
    }
    zztc localzztc = new zztc(paramContext, 10);
    String[] arrayOfString = new String[2];
    arrayOfString[0] = "GMS_WTF";
    arrayOfString[1] = localStringBuilder.toString();
    localzztc.zza("GMS_WTF", null, arrayOfString);
    localzztc.send();
    if (zzaK(7))
    {
      Log.e(paramString1, paramString2, paramThrowable);
      Log.wtf(paramString1, paramString2, paramThrowable);
    }
  }

  public void zza(String paramString1, String paramString2, Throwable paramThrowable)
  {
    if (zzaK(4))
      Log.i(paramString1, paramString2, paramThrowable);
  }

  public boolean zzaK(int paramInt)
  {
    return Log.isLoggable(this.zzQq, paramInt);
  }

  public void zzb(String paramString1, String paramString2, Throwable paramThrowable)
  {
    if (zzaK(5))
      Log.w(paramString1, paramString2, paramThrowable);
  }

  public void zzc(String paramString1, String paramString2, Throwable paramThrowable)
  {
    if (zzaK(6))
      Log.e(paramString1, paramString2, paramThrowable);
  }

  public void zzq(String paramString1, String paramString2)
  {
    if (zzaK(3))
      Log.d(paramString1, paramString2);
  }

  public void zzr(String paramString1, String paramString2)
  {
    if (zzaK(5))
      Log.w(paramString1, paramString2);
  }

  public void zzs(String paramString1, String paramString2)
  {
    if (zzaK(6))
      Log.e(paramString1, paramString2);
  }
}