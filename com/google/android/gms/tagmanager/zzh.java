package com.google.android.gms.tagmanager;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import com.google.android.gms.internal.zza;
import com.google.android.gms.internal.zzd.zza;
import java.util.Map;

class zzh extends zzaj
{
  private static final String ID = zza.zzy.toString();
  private final Context mContext;

  public zzh(Context paramContext)
  {
    super(ID, new String[0]);
    this.mContext = paramContext;
  }

  public zzd.zza zzH(Map<String, zzd.zza> paramMap)
  {
    try
    {
      zzd.zza localzza = zzde.zzx(Integer.valueOf(this.mContext.getPackageManager().getPackageInfo(this.mContext.getPackageName(), 0).versionCode));
      return localzza;
    }
    catch (PackageManager.NameNotFoundException localNameNotFoundException)
    {
      zzbf.zzZ("Package name " + this.mContext.getPackageName() + " not found. " + localNameNotFoundException.getMessage());
    }
    return zzde.zzuf();
  }

  public boolean zzsD()
  {
    return true;
  }
}