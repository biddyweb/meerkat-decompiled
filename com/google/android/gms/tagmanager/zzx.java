package com.google.android.gms.tagmanager;

import android.util.Log;

public class zzx
  implements zzbg
{
  private int zzBJ = 5;

  public void setLogLevel(int paramInt)
  {
    this.zzBJ = paramInt;
  }

  public void zzY(String paramString)
  {
    if (this.zzBJ <= 3)
      Log.d("GoogleTagManager", paramString);
  }

  public void zzZ(String paramString)
  {
    if (this.zzBJ <= 6)
      Log.e("GoogleTagManager", paramString);
  }

  public void zzaa(String paramString)
  {
    if (this.zzBJ <= 4)
      Log.i("GoogleTagManager", paramString);
  }

  public void zzab(String paramString)
  {
    if (this.zzBJ <= 2)
      Log.v("GoogleTagManager", paramString);
  }

  public void zzac(String paramString)
  {
    if (this.zzBJ <= 5)
      Log.w("GoogleTagManager", paramString);
  }

  public void zzb(String paramString, Throwable paramThrowable)
  {
    if (this.zzBJ <= 6)
      Log.e("GoogleTagManager", paramString, paramThrowable);
  }

  public void zzd(String paramString, Throwable paramThrowable)
  {
    if (this.zzBJ <= 5)
      Log.w("GoogleTagManager", paramString, paramThrowable);
  }
}