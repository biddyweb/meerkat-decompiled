package com.google.android.gms.internal;

import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Build.VERSION;
import android.os.Environment;
import com.google.android.gms.common.internal.zzx;
import java.util.List;

@zzgi
public class zzbu
{
  private final Context mContext;

  public zzbu(Context paramContext)
  {
    zzx.zzb(paramContext, "Context can not be null");
    this.mContext = paramContext;
  }

  public static boolean zzbT()
  {
    return "mounted".equals(Environment.getExternalStorageState());
  }

  public boolean zza(Intent paramIntent)
  {
    zzx.zzb(paramIntent, "Intent can not be null");
    boolean bool1 = this.mContext.getPackageManager().queryIntentActivities(paramIntent, 0).isEmpty();
    boolean bool2 = false;
    if (!bool1)
      bool2 = true;
    return bool2;
  }

  public boolean zzbP()
  {
    Intent localIntent = new Intent("android.intent.action.DIAL");
    localIntent.setData(Uri.parse("tel:"));
    return zza(localIntent);
  }

  public boolean zzbQ()
  {
    Intent localIntent = new Intent("android.intent.action.VIEW");
    localIntent.setData(Uri.parse("sms:"));
    return zza(localIntent);
  }

  public boolean zzbR()
  {
    return (zzbT()) && (this.mContext.checkCallingOrSelfPermission("android.permission.WRITE_EXTERNAL_STORAGE") == 0);
  }

  public boolean zzbS()
  {
    return true;
  }

  public boolean zzbU()
  {
    Intent localIntent = new Intent("android.intent.action.INSERT").setType("vnd.android.cursor.dir/event");
    return (Build.VERSION.SDK_INT >= 14) && (zza(localIntent));
  }
}