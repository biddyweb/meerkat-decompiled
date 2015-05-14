package com.google.android.gms.tagmanager;

import android.os.Build;
import com.google.android.gms.internal.zza;
import com.google.android.gms.internal.zzd.zza;
import java.util.Map;

class zzaa extends zzaj
{
  private static final String ID = zza.zzF.toString();

  public zzaa()
  {
    super(ID, new String[0]);
  }

  public zzd.zza zzH(Map<String, zzd.zza> paramMap)
  {
    String str1 = Build.MANUFACTURER;
    String str2 = Build.MODEL;
    if ((!str2.startsWith(str1)) && (!str1.equals("unknown")))
      str2 = str1 + " " + str2;
    return zzde.zzx(str2);
  }

  public boolean zzsD()
  {
    return true;
  }
}