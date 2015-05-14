package com.google.android.gms.analytics;

import android.content.Context;
import java.util.Map;

class zzal extends zzn<zzam>
{
  public zzal(Context paramContext)
  {
    super(paramContext, new zza());
  }

  private static class zza
    implements zzn.zza<zzam>
  {
    private final zzam zzFq = new zzam();

    public void zzc(String paramString, int paramInt)
    {
      if ("ga_sessionTimeout".equals(paramString))
      {
        this.zzFq.zzFt = paramInt;
        return;
      }
      zzae.zzac("int configuration name not recognized:  " + paramString);
    }

    public void zzd(String paramString, boolean paramBoolean)
    {
      int i = 1;
      if ("ga_autoActivityTracking".equals(paramString))
      {
        zzam localzzam3 = this.zzFq;
        if (paramBoolean);
        while (true)
        {
          localzzam3.zzFu = i;
          return;
          i = 0;
        }
      }
      if ("ga_anonymizeIp".equals(paramString))
      {
        zzam localzzam2 = this.zzFq;
        if (paramBoolean);
        while (true)
        {
          localzzam2.zzFv = i;
          return;
          i = 0;
        }
      }
      if ("ga_reportUncaughtExceptions".equals(paramString))
      {
        zzam localzzam1 = this.zzFq;
        if (paramBoolean);
        while (true)
        {
          localzzam1.zzFw = i;
          return;
          i = 0;
        }
      }
      zzae.zzac("bool configuration name not recognized:  " + paramString);
    }

    public zzam zzgJ()
    {
      return this.zzFq;
    }

    public void zzi(String paramString1, String paramString2)
    {
      this.zzFq.zzFx.put(paramString1, paramString2);
    }

    public void zzj(String paramString1, String paramString2)
    {
      if ("ga_trackingId".equals(paramString1))
      {
        this.zzFq.zzFr = paramString2;
        return;
      }
      if ("ga_sampleFrequency".equals(paramString1))
        try
        {
          this.zzFq.zzFs = Double.parseDouble(paramString2);
          return;
        }
        catch (NumberFormatException localNumberFormatException)
        {
          zzae.zzZ("Error parsing ga_sampleFrequency value: " + paramString2);
          return;
        }
      zzae.zzac("string configuration name not recognized:  " + paramString1);
    }
  }
}