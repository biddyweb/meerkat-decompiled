package com.google.android.gms.tagmanager;

import android.content.Context;
import com.google.android.gms.internal.zza;
import com.google.android.gms.internal.zzd.zza;
import java.util.Map;

class zzf extends zzaj
{
  private static final String ID = zza.zzw.toString();
  private final Context mContext;

  public zzf(Context paramContext)
  {
    super(ID, new String[0]);
    this.mContext = paramContext;
  }

  public zzd.zza zzH(Map<String, zzd.zza> paramMap)
  {
    return zzde.zzx(this.mContext.getPackageName());
  }

  public boolean zzsD()
  {
    return true;
  }
}