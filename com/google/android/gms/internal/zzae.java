package com.google.android.gms.internal;

import android.content.Context;
import android.view.View;
import java.util.ArrayList;
import java.util.WeakHashMap;

@zzgi
public class zzae
  implements zzag
{
  private final Object zznh = new Object();
  private final WeakHashMap<zzhe, zzaf> zzni = new WeakHashMap();
  private final ArrayList<zzaf> zznj = new ArrayList();
  private final Context zznk;
  private final zzhy zznl;
  private final zzdf zznm;

  public zzae(Context paramContext, zzhy paramzzhy, zzdf paramzzdf)
  {
    this.zznk = paramContext.getApplicationContext();
    this.zznl = paramzzhy;
    this.zznm = paramzzdf;
  }

  public zzaf zza(zzba paramzzba, zzhe paramzzhe)
  {
    return zza(paramzzba, paramzzhe, paramzzhe.zzuq.getWebView());
  }

  public zzaf zza(zzba paramzzba, zzhe paramzzhe, View paramView)
  {
    synchronized (this.zznh)
    {
      if (zzc(paramzzhe))
      {
        zzaf localzzaf2 = (zzaf)this.zzni.get(paramzzhe);
        return localzzaf2;
      }
      zzaf localzzaf1 = new zzaf(paramzzba, paramzzhe, this.zznl, paramView, this.zznm);
      localzzaf1.zza(this);
      this.zzni.put(paramzzhe, localzzaf1);
      this.zznj.add(localzzaf1);
      return localzzaf1;
    }
  }

  public void zza(zzaf paramzzaf)
  {
    synchronized (this.zznh)
    {
      if (!paramzzaf.zzbf())
        this.zznj.remove(paramzzaf);
      return;
    }
  }

  public boolean zzc(zzhe paramzzhe)
  {
    while (true)
    {
      synchronized (this.zznh)
      {
        zzaf localzzaf = (zzaf)this.zzni.get(paramzzhe);
        if ((localzzaf != null) && (localzzaf.zzbf()))
        {
          bool = true;
          return bool;
        }
      }
      boolean bool = false;
    }
  }

  public void zzd(zzhe paramzzhe)
  {
    synchronized (this.zznh)
    {
      zzaf localzzaf = (zzaf)this.zzni.get(paramzzhe);
      if (localzzaf != null)
        localzzaf.zzbd();
      return;
    }
  }

  public void zze(zzhe paramzzhe)
  {
    synchronized (this.zznh)
    {
      zzaf localzzaf = (zzaf)this.zzni.get(paramzzhe);
      if (localzzaf != null)
        localzzaf.stop();
      return;
    }
  }

  public void zzf(zzhe paramzzhe)
  {
    synchronized (this.zznh)
    {
      zzaf localzzaf = (zzaf)this.zzni.get(paramzzhe);
      if (localzzaf != null)
        localzzaf.pause();
      return;
    }
  }

  public void zzg(zzhe paramzzhe)
  {
    synchronized (this.zznh)
    {
      zzaf localzzaf = (zzaf)this.zzni.get(paramzzhe);
      if (localzzaf != null)
        localzzaf.resume();
      return;
    }
  }
}