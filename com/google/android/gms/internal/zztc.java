package com.google.android.gms.internal;

import android.app.PendingIntent;
import android.content.Context;
import android.util.Log;

public class zztc
  implements zztd.zza
{
  private final zztd zzatI;
  private boolean zzatJ;

  public zztc(Context paramContext, int paramInt)
  {
    this(paramContext, paramInt, null);
  }

  public zztc(Context paramContext, int paramInt, String paramString)
  {
    this(paramContext, paramInt, paramString, null, true);
  }

  public zztc(Context paramContext, int paramInt, String paramString1, String paramString2, boolean paramBoolean)
  {
    if (paramContext != paramContext.getApplicationContext());
    for (String str = paramContext.getClass().getName(); ; str = "OneTimePlayLogger")
    {
      this.zzatI = new zztd(paramContext, paramInt, paramString1, paramString2, this, paramBoolean, str);
      this.zzatJ = true;
      return;
    }
  }

  private void zzrD()
  {
    if (!this.zzatJ)
      throw new IllegalStateException("Cannot reuse one-time logger after sending.");
  }

  public void send()
  {
    zzrD();
    this.zzatI.start();
    this.zzatJ = false;
  }

  public void zza(String paramString, byte[] paramArrayOfByte, String[] paramArrayOfString)
  {
    zzrD();
    this.zzatI.zzb(paramString, paramArrayOfByte, paramArrayOfString);
  }

  public void zzf(PendingIntent paramPendingIntent)
  {
    Log.w("OneTimePlayLogger", "logger connection failed: " + paramPendingIntent);
  }

  public void zzrE()
  {
    this.zzatI.stop();
  }

  public void zzrF()
  {
    Log.w("OneTimePlayLogger", "logger connection failed");
  }
}