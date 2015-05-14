package com.google.android.gms.tagmanager;

import com.google.android.gms.internal.zza;
import com.google.android.gms.internal.zzd.zza;
import java.util.Locale;
import java.util.Map;

public class zzba extends zzaj
{
  private static final String ID = zza.zzN.toString();

  public zzba()
  {
    super(ID, new String[0]);
  }

  public zzd.zza zzH(Map<String, zzd.zza> paramMap)
  {
    Locale localLocale = Locale.getDefault();
    if (localLocale == null)
      return zzde.zzuf();
    String str = localLocale.getLanguage();
    if (str == null)
      return zzde.zzuf();
    return zzde.zzx(str.toLowerCase());
  }

  public boolean zzsD()
  {
    return false;
  }
}