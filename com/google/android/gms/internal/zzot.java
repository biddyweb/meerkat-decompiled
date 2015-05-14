package com.google.android.gms.internal;

import android.content.Context;

public class zzot
{
  private final Context mContext;
  private final String zzHg;
  private final String zzMh;
  private zzou zzamA;
  private final zzpm<zzpc> zzamz;

  private zzot(Context paramContext, String paramString1, String paramString2, zzpm<zzpc> paramzzpm)
  {
    this.mContext = paramContext;
    this.zzHg = paramString1;
    this.zzamz = paramzzpm;
    this.zzamA = null;
    this.zzMh = paramString2;
  }

  public static zzot zza(Context paramContext, String paramString1, String paramString2, zzpm<zzpc> paramzzpm)
  {
    return new zzot(paramContext, paramString1, paramString2, paramzzpm);
  }
}