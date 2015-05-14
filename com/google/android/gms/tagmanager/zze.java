package com.google.android.gms.tagmanager;

import android.content.Context;
import com.google.android.gms.internal.zza;
import com.google.android.gms.internal.zzb;
import com.google.android.gms.internal.zzd.zza;
import java.util.Map;

class zze extends zzaj
{
  private static final String ID = zza.zzY.toString();
  private static final String zzaxn = zzb.zzbW.toString();
  private static final String zzaxo = zzb.zzbZ.toString();
  private final Context zzlN;

  public zze(Context paramContext)
  {
    super(str, arrayOfString);
    this.zzlN = paramContext;
  }

  public zzd.zza zzH(Map<String, zzd.zza> paramMap)
  {
    zzd.zza localzza1 = (zzd.zza)paramMap.get(zzaxo);
    if (localzza1 == null)
      return zzde.zzuf();
    String str1 = zzde.zzg(localzza1);
    zzd.zza localzza2 = (zzd.zza)paramMap.get(zzaxn);
    if (localzza2 != null);
    for (String str2 = zzde.zzg(localzza2); ; str2 = null)
    {
      String str3 = zzaw.zzf(this.zzlN, str1, str2);
      if (str3 == null)
        break;
      return zzde.zzx(str3);
    }
    return zzde.zzuf();
  }

  public boolean zzsD()
  {
    return true;
  }
}