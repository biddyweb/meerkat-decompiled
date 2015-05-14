package com.google.android.gms.analytics;

import android.app.Activity;
import java.util.HashMap;
import java.util.Map;

class zzam
  implements zzm
{
  String zzFr;
  double zzFs = -1.0D;
  int zzFt = -1;
  int zzFu = -1;
  int zzFv = -1;
  int zzFw = -1;
  Map<String, String> zzFx = new HashMap();

  public int getSessionTimeout()
  {
    return this.zzFt;
  }

  public String zzas(String paramString)
  {
    String str = (String)this.zzFx.get(paramString);
    if (str != null)
      return str;
    return paramString;
  }

  public boolean zzgK()
  {
    return this.zzFr != null;
  }

  public String zzgL()
  {
    return this.zzFr;
  }

  public boolean zzgM()
  {
    return this.zzFs >= 0.0D;
  }

  public double zzgN()
  {
    return this.zzFs;
  }

  public boolean zzgO()
  {
    return this.zzFt >= 0;
  }

  public boolean zzgP()
  {
    return this.zzFu != -1;
  }

  public boolean zzgQ()
  {
    return this.zzFu == 1;
  }

  public boolean zzgR()
  {
    return this.zzFv != -1;
  }

  public boolean zzgS()
  {
    return this.zzFv == 1;
  }

  public boolean zzgT()
  {
    return this.zzFw == 1;
  }

  public String zzq(Activity paramActivity)
  {
    return zzas(paramActivity.getClass().getCanonicalName());
  }
}