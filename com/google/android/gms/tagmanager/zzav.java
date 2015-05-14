package com.google.android.gms.tagmanager;

import android.content.Context;
import com.google.android.gms.internal.zza;
import com.google.android.gms.internal.zzb;
import com.google.android.gms.internal.zzd.zza;
import java.util.Map;

class zzav extends zzaj
{
  private static final String ID = zza.zzad.toString();
  private static final String zzaxn = zzb.zzbW.toString();
  private final Context zzlN;

  public zzav(Context paramContext)
  {
    super(ID, new String[0]);
    this.zzlN = paramContext;
  }

  public zzd.zza zzH(Map<String, zzd.zza> paramMap)
  {
    if ((zzd.zza)paramMap.get(zzaxn) != null);
    for (String str1 = zzde.zzg((zzd.zza)paramMap.get(zzaxn)); ; str1 = null)
    {
      String str2 = zzaw.zzi(this.zzlN, str1);
      if (str2 == null)
        break;
      return zzde.zzx(str2);
    }
    return zzde.zzuf();
  }

  public boolean zzsD()
  {
    return true;
  }
}