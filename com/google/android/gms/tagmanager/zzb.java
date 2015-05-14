package com.google.android.gms.tagmanager;

import android.content.Context;
import com.google.android.gms.internal.zzd.zza;
import java.util.Map;

class zzb extends zzaj
{
  private static final String ID = com.google.android.gms.internal.zza.zzu.toString();
  private final zza zzaxm;

  public zzb(Context paramContext)
  {
    this(zza.zzaj(paramContext));
  }

  zzb(zza paramzza)
  {
    super(ID, new String[0]);
    this.zzaxm = paramzza;
  }

  public zzd.zza zzH(Map<String, zzd.zza> paramMap)
  {
    String str = this.zzaxm.zzsz();
    if (str == null)
      return zzde.zzuf();
    return zzde.zzx(str);
  }

  public boolean zzsD()
  {
    return false;
  }
}