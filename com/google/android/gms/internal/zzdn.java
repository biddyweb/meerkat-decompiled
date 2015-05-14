package com.google.android.gms.internal;

import android.content.Context;
import android.os.Handler;
import android.os.RemoteException;
import android.os.SystemClock;
import android.text.TextUtils;
import com.google.android.gms.dynamic.zze;

@zzgi
public final class zzdn
  implements zzdo.zza
{
  private final Context mContext;
  private final zzdr zzlD;
  private final zzax zzmH;
  private final Object zznh = new Object();
  private final zzhy zznl;
  private final String zzsC;
  private final long zzsD;
  private final zzdj zzsE;
  private final zzba zzsF;
  private zzds zzsG;
  private int zzsH = -2;

  public zzdn(Context paramContext, String paramString, zzdr paramzzdr, zzdk paramzzdk, zzdj paramzzdj, zzax paramzzax, zzba paramzzba, zzhy paramzzhy)
  {
    this.mContext = paramContext;
    this.zzlD = paramzzdr;
    this.zzsE = paramzzdj;
    if ("com.google.ads.mediation.customevent.CustomEventAdapter".equals(paramString))
    {
      this.zzsC = zzcK();
      if (paramzzdk.zzss == -1L)
        break label106;
    }
    label106: for (long l = paramzzdk.zzss; ; l = 10000L)
    {
      this.zzsD = l;
      this.zzmH = paramzzax;
      this.zzsF = paramzzba;
      this.zznl = paramzzhy;
      return;
      this.zzsC = paramString;
      break;
    }
  }

  private void zza(long paramLong1, long paramLong2, long paramLong3, long paramLong4)
  {
    while (true)
    {
      if (this.zzsH != -2)
        return;
      zzb(paramLong1, paramLong2, paramLong3, paramLong4);
    }
  }

  private void zza(zzdm paramzzdm)
  {
    try
    {
      if (this.zznl.zzzJ < 4100000)
      {
        if (this.zzsF.zzpb)
        {
          this.zzsG.zza(zze.zzn(this.mContext), this.zzmH, this.zzsE.zzsq, paramzzdm);
          return;
        }
        this.zzsG.zza(zze.zzn(this.mContext), this.zzsF, this.zzmH, this.zzsE.zzsq, paramzzdm);
        return;
      }
    }
    catch (RemoteException localRemoteException)
    {
      zzhx.zzd("Could not request ad from mediation adapter.", localRemoteException);
      zzm(5);
      return;
    }
    if (this.zzsF.zzpb)
    {
      this.zzsG.zza(zze.zzn(this.mContext), this.zzmH, this.zzsE.zzsq, this.zzsE.zzsk, paramzzdm);
      return;
    }
    this.zzsG.zza(zze.zzn(this.mContext), this.zzsF, this.zzmH, this.zzsE.zzsq, this.zzsE.zzsk, paramzzdm);
  }

  private void zzb(long paramLong1, long paramLong2, long paramLong3, long paramLong4)
  {
    long l1 = SystemClock.elapsedRealtime();
    long l2 = paramLong2 - (l1 - paramLong1);
    long l3 = paramLong4 - (l1 - paramLong3);
    if ((l2 <= 0L) || (l3 <= 0L))
    {
      zzhx.zzaa("Timed out waiting for adapter.");
      this.zzsH = 3;
      return;
    }
    try
    {
      this.zznh.wait(Math.min(l2, l3));
      return;
    }
    catch (InterruptedException localInterruptedException)
    {
      this.zzsH = -1;
    }
  }

  private String zzcK()
  {
    try
    {
      if (!TextUtils.isEmpty(this.zzsE.zzso))
      {
        if (this.zzlD.zzC(this.zzsE.zzso))
          return "com.google.android.gms.ads.mediation.customevent.CustomEventAdapter";
        return "com.google.ads.mediation.customevent.CustomEventAdapter";
      }
    }
    catch (RemoteException localRemoteException)
    {
      zzhx.zzac("Fail to determine the custom event's version, assuming the old one.");
    }
    return "com.google.ads.mediation.customevent.CustomEventAdapter";
  }

  private zzds zzcL()
  {
    zzhx.zzaa("Instantiating mediation adapter: " + this.zzsC);
    try
    {
      zzds localzzds = this.zzlD.zzB(this.zzsC);
      return localzzds;
    }
    catch (RemoteException localRemoteException)
    {
      zzhx.zza("Could not instantiate mediation adapter: " + this.zzsC, localRemoteException);
    }
    return null;
  }

  public void cancel()
  {
    synchronized (this.zznh)
    {
      try
      {
        if (this.zzsG != null)
          this.zzsG.destroy();
        this.zzsH = -1;
        this.zznh.notify();
        return;
      }
      catch (RemoteException localRemoteException)
      {
        while (true)
          zzhx.zzd("Could not destroy mediation adapter.", localRemoteException);
      }
    }
  }

  public zzdo zzb(long paramLong1, long paramLong2)
  {
    synchronized (this.zznh)
    {
      long l = SystemClock.elapsedRealtime();
      zzdm localzzdm = new zzdm();
      zzhw.zzzG.post(new zzdn.1(this, localzzdm));
      zza(l, this.zzsD, paramLong1, paramLong2);
      zzdo localzzdo = new zzdo(this.zzsE, this.zzsG, this.zzsC, localzzdm, this.zzsH);
      return localzzdo;
    }
  }

  public void zzm(int paramInt)
  {
    synchronized (this.zznh)
    {
      this.zzsH = paramInt;
      this.zznh.notify();
      return;
    }
  }
}