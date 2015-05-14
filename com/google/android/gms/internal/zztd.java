package com.google.android.gms.internal;

import android.app.PendingIntent;
import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.util.Log;
import com.google.android.gms.common.internal.zzf;

public class zztd
{
  private final zztl zzatK;
  private zztj zzatL;

  public zztd(Context paramContext, int paramInt, String paramString1, String paramString2, zza paramzza, boolean paramBoolean, String paramString3)
  {
    String str = paramContext.getPackageName();
    try
    {
      i = paramContext.getPackageManager().getPackageInfo(str, 0).versionCode;
      this.zzatL = new zztj(str, i, paramInt, paramString1, paramString2, paramBoolean);
      this.zzatK = new zztl(paramContext, paramContext.getMainLooper(), new zzti(paramzza), new zzf(null, null, 49, null, str, paramString3, null));
      return;
    }
    catch (PackageManager.NameNotFoundException localNameNotFoundException)
    {
      while (true)
      {
        Log.wtf("PlayLogger", "This can't happen.");
        int i = 0;
      }
    }
  }

  public void start()
  {
    this.zzatK.start();
  }

  public void stop()
  {
    this.zzatK.stop();
  }

  public void zza(long paramLong, String paramString, byte[] paramArrayOfByte, String[] paramArrayOfString)
  {
    this.zzatK.zzb(this.zzatL, new zztf(paramLong, paramString, paramArrayOfByte, paramArrayOfString));
  }

  public void zzb(String paramString, byte[] paramArrayOfByte, String[] paramArrayOfString)
  {
    zza(System.currentTimeMillis(), paramString, paramArrayOfByte, paramArrayOfString);
  }

  public static abstract interface zza
  {
    public abstract void zzf(PendingIntent paramPendingIntent);

    public abstract void zzrE();

    public abstract void zzrF();
  }
}