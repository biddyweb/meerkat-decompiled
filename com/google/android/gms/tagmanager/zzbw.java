package com.google.android.gms.tagmanager;

import android.os.Build.VERSION;
import com.google.android.gms.internal.zza;
import com.google.android.gms.internal.zzd.zza;
import java.util.Map;

class zzbw extends zzaj
{
  private static final String ID = zza.zzO.toString();

  public zzbw()
  {
    super(ID, new String[0]);
  }

  public zzd.zza zzH(Map<String, zzd.zza> paramMap)
  {
    return zzde.zzx(Build.VERSION.RELEASE);
  }

  public boolean zzsD()
  {
    return true;
  }
}