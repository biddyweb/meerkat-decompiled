package com.google.android.gms.internal;

import android.content.Context;
import java.util.Timer;
import java.util.WeakHashMap;

@zzgi
public class zzdf
{
  private final Context mContext;
  private final Object zznh = new Object();
  private final zzhy zznl;
  private final String zzrR;
  private final WeakHashMap<zzia<zzah>, Integer> zzrS;
  private zzia.zzd<zzah> zzrT;
  private zzia.zzd<zzah> zzrU;
  private zzia<zzah> zzrV;
  private zzah zzrW;
  private int zzrX = 1;

  public zzdf(Context paramContext, zzhy paramzzhy, String paramString)
  {
    this.zzrR = paramString;
    this.mContext = paramContext.getApplicationContext();
    this.zznl = paramzzhy;
    this.zzrS = new WeakHashMap();
    this.zzrT = new zzia.zzc();
    this.zzrU = new zzia.zzc();
  }

  public zzdf(Context paramContext, zzhy paramzzhy, String paramString, zzia.zzd<zzah> paramzzd1, zzia.zzd<zzah> paramzzd2)
  {
    this(paramContext, paramzzhy, paramString);
    this.zzrT = paramzzd1;
    this.zzrU = paramzzd2;
  }

  private void zza(zzia<zzah> paramzzia)
  {
    this.zzrX = 2;
    this.zzrW = zza(this.mContext, this.zznl);
    this.zzrW.zza(new zzdf.1(this, paramzzia));
    this.zzrW.zza("/jsLoaded", new zzdf.2(this, paramzzia));
    zzhv localzzhv = new zzhv();
    zzdf.3 local3 = new zzdf.3(this, localzzhv);
    localzzhv.set(local3);
    this.zzrW.zza("/requestReload", local3);
    if (this.zzrR.endsWith(".js"))
      this.zzrW.zzf(this.zzrR);
    while (true)
    {
      new Timer().schedule(new zzdf.4(this, paramzzia), zzdf.zza.zzsc);
      return;
      this.zzrW.zzg(this.zzrR);
    }
  }

  protected zzah zza(Context paramContext, zzhy paramzzhy)
  {
    return new zzaj(paramContext, paramzzhy);
  }

  public void zzb(zzia<zzah> paramzzia)
  {
    synchronized (this.zznh)
    {
      zzd(paramzzia);
      return;
    }
  }

  protected void zzc(zzia<zzah> paramzzia)
  {
    synchronized (this.zznh)
    {
      Integer localInteger1 = (Integer)this.zzrS.get(paramzzia);
      if (localInteger1 == null)
        localInteger1 = Integer.valueOf(0);
      zzhx.zzab("Incremented use-counter for js engine.");
      Integer localInteger2 = Integer.valueOf(1 + localInteger1.intValue());
      this.zzrS.put(paramzzia, localInteger2);
      return;
    }
  }

  public zzia<zzah> zzcJ()
  {
    synchronized (this.zznh)
    {
      if ((this.zzrV == null) || (this.zzrV.getStatus() == -1))
      {
        zzib localzzib = new zzib();
        this.zzrV = localzzib;
        zza(localzzib);
        zzc(localzzib);
        return localzzib;
      }
      if (this.zzrX == 0)
      {
        zzc(this.zzrV);
        zzia localzzia4 = this.zzrV;
        return localzzia4;
      }
    }
    if (this.zzrX == 1)
    {
      zza(new zzib());
      zzc(this.zzrV);
      zzia localzzia3 = this.zzrV;
      return localzzia3;
    }
    if (this.zzrX == 2)
    {
      zzc(this.zzrV);
      zzia localzzia2 = this.zzrV;
      return localzzia2;
    }
    zzc(this.zzrV);
    zzia localzzia1 = this.zzrV;
    return localzzia1;
  }

  protected void zzd(zzia<zzah> paramzzia)
  {
    while (true)
    {
      synchronized (this.zznh)
      {
        Integer localInteger1 = (Integer)this.zzrS.get(paramzzia);
        if ((localInteger1 == null) || (localInteger1.intValue() == 0))
          return;
        Integer localInteger2 = Integer.valueOf(-1 + localInteger1.intValue());
        if (localInteger2.intValue() != 0)
        {
          zzhx.zzab("Decremented use-counter for js engine.");
          this.zzrS.put(paramzzia, localInteger2);
          return;
        }
      }
      zzhx.zzab("Removing js engine.");
      this.zzrS.remove(paramzzia);
      paramzzia.zza(this.zzrU, new zzia.zzb());
      paramzzia.zza(new zzdf.5(this), new zzia.zzb());
    }
  }
}