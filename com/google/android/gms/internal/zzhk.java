package com.google.android.gms.internal;

import android.content.Context;
import android.text.TextUtils;
import java.math.BigInteger;
import java.util.Locale;

@zzgi
public final class zzhk
{
  private static final Object zzmz = new Object();
  private static zzcc zzzg;
  private static String zzzh;

  public static String zza(Context paramContext, String paramString1, String paramString2)
  {
    synchronized (zzmz)
    {
      if ((zzzh == null) && (!TextUtils.isEmpty(paramString1)))
        zzb(paramContext, paramString1, paramString2);
      String str = zzzh;
      return str;
    }
  }

  private static void zzb(Context paramContext, String paramString1, String paramString2)
  {
    BigInteger localBigInteger2;
    try
    {
      ClassLoader localClassLoader = paramContext.createPackageContext(paramString2, 3).getClassLoader();
      Class localClass = Class.forName("com.google.ads.mediation.MediationAdapter", false, localClassLoader);
      BigInteger localBigInteger1 = new BigInteger(new byte[1]);
      String[] arrayOfString = paramString1.split(",");
      localBigInteger2 = localBigInteger1;
      for (int i = 0; i < arrayOfString.length; i++)
        if (zzab.zzaM().zza(localClassLoader, localClass, arrayOfString[i]))
          localBigInteger2 = localBigInteger2.setBit(i);
    }
    catch (Throwable localThrowable)
    {
      zzzh = "err";
      return;
    }
    zzzh = String.format(Locale.US, "%X", new Object[] { localBigInteger2 });
  }

  public static void zzd(Context paramContext, String paramString)
  {
    synchronized (zzmz)
    {
      zzcb localzzcb;
      if (zzzg == null)
      {
        localzzcb = new zzcb();
        localzzcb.zzb(paramContext, paramString);
      }
      try
      {
        zzzg = zzab.zzaR().zzb(localzzcb);
        return;
      }
      catch (IllegalArgumentException localIllegalArgumentException)
      {
        while (true)
          zzhx.zzac("Cannot initialize CSI reporter." + localIllegalArgumentException.getMessage());
      }
    }
  }

  public static zzcc zzeg()
  {
    synchronized (zzmz)
    {
      zzcc localzzcc = zzzg;
      return localzzcc;
    }
  }

  public static String zzep()
  {
    synchronized (zzmz)
    {
      String str = zzzh;
      return str;
    }
  }
}