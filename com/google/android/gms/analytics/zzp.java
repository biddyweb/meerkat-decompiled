package com.google.android.gms.analytics;

import android.util.Log;

class zzp
  implements Logger
{
  private int zzBJ = 2;

  private String zzal(String paramString)
  {
    return Thread.currentThread().toString() + ": " + paramString;
  }

  public void error(Exception paramException)
  {
    if (this.zzBJ <= 3)
      Log.e("GAV4", null, paramException);
  }

  public void error(String paramString)
  {
    if (this.zzBJ <= 3)
      Log.e("GAV4", zzal(paramString));
  }

  public int getLogLevel()
  {
    return this.zzBJ;
  }

  public void info(String paramString)
  {
    if (this.zzBJ <= 1)
      Log.i("GAV4", zzal(paramString));
  }

  public void setLogLevel(int paramInt)
  {
    this.zzBJ = paramInt;
  }

  public void verbose(String paramString)
  {
    if (this.zzBJ <= 0)
      Log.v("GAV4", zzal(paramString));
  }

  public void warn(String paramString)
  {
    if (this.zzBJ <= 2)
      Log.w("GAV4", zzal(paramString));
  }
}