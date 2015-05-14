package com.google.android.gms.internal;

import android.content.Context;
import android.os.Handler;
import org.json.JSONObject;

@zzgi
public class zzaj
  implements zzah
{
  private final zzic zzmu;

  public zzaj(Context paramContext, zzhy paramzzhy)
  {
    this.zzmu = zzab.zzaN().zza(paramContext, new zzba(), false, false, null, paramzzhy);
  }

  private void runOnUiThread(Runnable paramRunnable)
  {
    if (zzbe.zzbD().zzeC())
    {
      paramRunnable.run();
      return;
    }
    zzhw.zzzG.post(paramRunnable);
  }

  public void destroy()
  {
    this.zzmu.destroy();
  }

  public void zza(zzah.zza paramzza)
  {
    this.zzmu.zzeG().zza(new zzaj.5(this, paramzza));
  }

  public void zza(zzat paramzzat, zzep paramzzep, zzct paramzzct, zzes paramzzes, boolean paramBoolean, zzcw paramzzcw, zzcy paramzzcy, zzu paramzzu, zzeh paramzzeh)
  {
    this.zzmu.zzeG().zzb(paramzzat, paramzzep, paramzzct, paramzzes, paramBoolean, paramzzcw, paramzzcy, new zzu(false), paramzzeh);
  }

  public void zza(String paramString, zzcv paramzzcv)
  {
    this.zzmu.zzeG().zza(paramString, paramzzcv);
  }

  public void zza(String paramString, JSONObject paramJSONObject)
  {
    runOnUiThread(new zzaj.1(this, paramString, paramJSONObject));
  }

  public void zzb(String paramString, zzcv paramzzcv)
  {
    this.zzmu.zzeG().zzb(paramString, paramzzcv);
  }

  public void zzb(String paramString1, String paramString2)
  {
    runOnUiThread(new zzaj.2(this, paramString1, paramString2));
  }

  public void zzf(String paramString)
  {
    runOnUiThread(new zzaj.3(this, String.format("<!DOCTYPE html><html><head><script src=\"%s\"></script></head><body></body></html>", new Object[] { paramString })));
  }

  public void zzg(String paramString)
  {
    runOnUiThread(new zzaj.4(this, paramString));
  }
}