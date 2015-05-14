package com.google.android.gms.tagmanager;

import android.content.Context;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import com.google.android.gms.internal.zza;
import com.google.android.gms.internal.zzd.zza;
import java.util.Map;

class zzg extends zzaj
{
  private static final String ID = zza.zzx.toString();
  private final Context mContext;

  public zzg(Context paramContext)
  {
    super(ID, new String[0]);
    this.mContext = paramContext;
  }

  public zzd.zza zzH(Map<String, zzd.zza> paramMap)
  {
    try
    {
      PackageManager localPackageManager = this.mContext.getPackageManager();
      zzd.zza localzza = zzde.zzx(localPackageManager.getApplicationLabel(localPackageManager.getApplicationInfo(this.mContext.getPackageName(), 0)).toString());
      return localzza;
    }
    catch (PackageManager.NameNotFoundException localNameNotFoundException)
    {
      zzbf.zzb("App name is not found.", localNameNotFoundException);
    }
    return zzde.zzuf();
  }

  public boolean zzsD()
  {
    return true;
  }
}