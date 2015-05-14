package com.google.android.gms.tagmanager;

import com.google.android.gms.internal.zza;
import com.google.android.gms.internal.zzd.zza;
import java.util.Map;

class zzp extends zzaj
{
  private static final String ID = zza.zzD.toString();
  private final String zzYw;

  public zzp(String paramString)
  {
    super(ID, new String[0]);
    this.zzYw = paramString;
  }

  public zzd.zza zzH(Map<String, zzd.zza> paramMap)
  {
    if (this.zzYw == null)
      return zzde.zzuf();
    return zzde.zzx(this.zzYw);
  }

  public boolean zzsD()
  {
    return true;
  }
}