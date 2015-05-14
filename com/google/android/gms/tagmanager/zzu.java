package com.google.android.gms.tagmanager;

import com.google.android.gms.internal.zza;
import com.google.android.gms.internal.zzb;
import com.google.android.gms.internal.zzd.zza;
import java.util.Map;

class zzu extends zzaj
{
  private static final String ID = zza.zzC.toString();
  private static final String NAME = zzb.zzdB.toString();
  private static final String zzaym = zzb.zzcr.toString();
  private final DataLayer zzaxx;

  public zzu(DataLayer paramDataLayer)
  {
    super(str, arrayOfString);
    this.zzaxx = paramDataLayer;
  }

  public zzd.zza zzH(Map<String, zzd.zza> paramMap)
  {
    Object localObject = this.zzaxx.get(zzde.zzg((zzd.zza)paramMap.get(NAME)));
    if (localObject == null)
    {
      zzd.zza localzza = (zzd.zza)paramMap.get(zzaym);
      if (localzza != null)
        return localzza;
      return zzde.zzuf();
    }
    return zzde.zzx(localObject);
  }

  public boolean zzsD()
  {
    return false;
  }
}