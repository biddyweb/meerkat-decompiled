package com.google.android.gms.tagmanager;

import com.google.android.gms.internal.zza;
import com.google.android.gms.internal.zzd.zza;
import java.util.Map;

class zzah extends zzaj
{
  private static final String ID = zza.zzK.toString();
  private final zzco zzaxy;

  public zzah(zzco paramzzco)
  {
    super(ID, new String[0]);
    this.zzaxy = paramzzco;
  }

  public zzd.zza zzH(Map<String, zzd.zza> paramMap)
  {
    String str = this.zzaxy.zztH();
    if (str == null)
      return zzde.zzuf();
    return zzde.zzx(str);
  }

  public boolean zzsD()
  {
    return false;
  }
}