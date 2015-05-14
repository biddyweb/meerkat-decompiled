package com.google.android.gms.analytics;

import android.content.Context;

class zzz extends zzn<zzaa>
{
  public zzz(Context paramContext)
  {
    super(paramContext, new zza());
  }

  private static class zza
    implements zzn.zza<zzaa>
  {
    private final zzaa zzEh = new zzaa();

    public void zzc(String paramString, int paramInt)
    {
      if ("ga_dispatchPeriod".equals(paramString))
      {
        this.zzEh.zzEj = paramInt;
        return;
      }
      zzae.zzac("int configuration name not recognized:  " + paramString);
    }

    public void zzd(String paramString, boolean paramBoolean)
    {
      if ("ga_dryRun".equals(paramString))
      {
        zzaa localzzaa = this.zzEh;
        if (paramBoolean);
        for (int i = 1; ; i = 0)
        {
          localzzaa.zzEk = i;
          return;
        }
      }
      zzae.zzac("bool configuration name not recognized:  " + paramString);
    }

    public zzaa zzfY()
    {
      return this.zzEh;
    }

    public void zzi(String paramString1, String paramString2)
    {
    }

    public void zzj(String paramString1, String paramString2)
    {
      if ("ga_appName".equals(paramString1))
      {
        this.zzEh.zzBa = paramString2;
        return;
      }
      if ("ga_appVersion".equals(paramString1))
      {
        this.zzEh.zzBb = paramString2;
        return;
      }
      if ("ga_logLevel".equals(paramString1))
      {
        this.zzEh.zzEi = paramString2;
        return;
      }
      zzae.zzac("string configuration name not recognized:  " + paramString1);
    }
  }
}