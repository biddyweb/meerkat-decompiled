package com.google.android.gms.internal;

import android.net.Uri.Builder;
import android.text.TextUtils;

@zzgi
public class zzu
{
  private zzu.zza zzmq;
  private boolean zzmr;
  private boolean zzms;

  public zzu()
  {
    this.zzms = ((Boolean)zzca.zzqq.get()).booleanValue();
  }

  public zzu(boolean paramBoolean)
  {
    this.zzms = paramBoolean;
  }

  public void recordClick()
  {
    this.zzmr = true;
  }

  public void zza(zzu.zza paramzza)
  {
    this.zzmq = paramzza;
  }

  public boolean zzaB()
  {
    return (!this.zzms) || (this.zzmr);
  }

  public void zzd(String paramString)
  {
    zzhx.zzY("Action was blocked because no click was detected.");
    if (this.zzmq != null)
      this.zzmq.zze(paramString);
  }

  @zzgi
  public static class zzb
    implements zzu.zza
  {
    private final zzhe.zza zzmt;
    private final zzic zzmu;

    public zzb(zzhe.zza paramzza, zzic paramzzic)
    {
      this.zzmt = paramzza;
      this.zzmu = paramzzic;
    }

    public void zze(String paramString)
    {
      zzhx.zzY("An auto-clicking creative is blocked");
      Uri.Builder localBuilder = new Uri.Builder();
      localBuilder.scheme("https");
      localBuilder.path("//pagead2.googlesyndication.com/pagead/gen_204");
      localBuilder.appendQueryParameter("id", "gmob-apps-blocked-navigation");
      if (!TextUtils.isEmpty(paramString))
        localBuilder.appendQueryParameter("navigationURL", paramString);
      if ((this.zzmt != null) && (this.zzmt.zzyz != null) && (!TextUtils.isEmpty(this.zzmt.zzyz.zzwN)))
        localBuilder.appendQueryParameter("debugDialog", this.zzmt.zzyz.zzwN);
      zzab.zzaM().zzc(this.zzmu.getContext(), this.zzmu.zzeJ().zzzH, localBuilder.toString());
    }
  }
}