package com.google.android.gms.internal;

import android.content.Intent;

@zzgi
public class zzfl
{
  private final String zzpH;

  public zzfl(String paramString)
  {
    this.zzpH = paramString;
  }

  public boolean zza(String paramString, int paramInt, Intent paramIntent)
  {
    if ((paramString == null) || (paramIntent == null));
    String str1;
    String str2;
    do
    {
      return false;
      str1 = zzab.zzaU().zze(paramIntent);
      str2 = zzab.zzaU().zzf(paramIntent);
    }
    while ((str1 == null) || (str2 == null));
    if (!paramString.equals(zzab.zzaU().zzL(str1)))
    {
      zzhx.zzac("Developer payload not match.");
      return false;
    }
    if ((this.zzpH != null) && (!zzfm.zzc(this.zzpH, str1, str2)))
    {
      zzhx.zzac("Fail to verify signature.");
      return false;
    }
    return true;
  }

  public String zzdB()
  {
    return zzab.zzaM().zzeu();
  }
}