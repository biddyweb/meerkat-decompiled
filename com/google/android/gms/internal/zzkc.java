package com.google.android.gms.internal;

import android.text.TextUtils;
import android.util.Log;
import java.util.Locale;

public class zzkc
{
  private static boolean zzKR = false;
  protected final String mTag;
  private boolean zzKS;
  private boolean zzKT;
  private String zzKU;

  public zzkc(String paramString)
  {
    this(paramString, zzhG());
  }

  public zzkc(String paramString, boolean paramBoolean)
  {
    this.mTag = paramString;
    this.zzKS = paramBoolean;
    this.zzKT = false;
  }

  public static boolean zzhG()
  {
    return zzKR;
  }

  public void zza(String paramString, Object[] paramArrayOfObject)
  {
    if (zzhF())
      Log.v(this.mTag, zze(paramString, paramArrayOfObject));
  }

  public void zza(Throwable paramThrowable, String paramString, Object[] paramArrayOfObject)
  {
    if ((zzhE()) || (zzKR))
      Log.d(this.mTag, zze(paramString, paramArrayOfObject), paramThrowable);
  }

  public void zzaP(String paramString)
  {
    if (TextUtils.isEmpty(paramString));
    for (String str = null; ; str = String.format("[%s] ", new Object[] { paramString }))
    {
      this.zzKU = str;
      return;
    }
  }

  public void zzb(String paramString, Object[] paramArrayOfObject)
  {
    if ((zzhE()) || (zzKR))
      Log.d(this.mTag, zze(paramString, paramArrayOfObject));
  }

  public void zzc(String paramString, Object[] paramArrayOfObject)
  {
    Log.i(this.mTag, zze(paramString, paramArrayOfObject));
  }

  public void zzd(String paramString, Object[] paramArrayOfObject)
  {
    Log.w(this.mTag, zze(paramString, paramArrayOfObject));
  }

  protected String zze(String paramString, Object[] paramArrayOfObject)
  {
    if (paramArrayOfObject.length == 0);
    while (true)
    {
      if (!TextUtils.isEmpty(this.zzKU))
        paramString = this.zzKU + paramString;
      return paramString;
      paramString = String.format(Locale.ROOT, paramString, paramArrayOfObject);
    }
  }

  public boolean zzhE()
  {
    return this.zzKS;
  }

  public boolean zzhF()
  {
    return this.zzKT;
  }
}