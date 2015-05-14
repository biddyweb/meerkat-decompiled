package com.google.android.gms.internal;

import android.content.Context;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.tagmanager.zzbf;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class zzvg
{
  private final Context mContext;
  private final zzvn zzaBP;
  Map<String, zzc<zzvl.zzc>> zzaBQ = new HashMap();
  private final Map<String, zzvv> zzaBR;
  private String zzaya = null;
  private final zzlv zzmW;

  public zzvg(Context paramContext)
  {
    this(paramContext, new HashMap(), new zzvn(paramContext), zzlx.zzkc());
  }

  zzvg(Context paramContext, Map<String, zzvv> paramMap, zzvn paramzzvn, zzlv paramzzlv)
  {
    this.mContext = paramContext;
    this.zzmW = paramzzlv;
    this.zzaBP = paramzzvn;
    this.zzaBR = paramMap;
  }

  private void zza(zzvj paramzzvj, zza paramzza)
  {
    int i = 1;
    List localList = paramzzvj.zzun();
    if (localList.size() == i);
    while (true)
    {
      zzx.zzO(i);
      zza((zzve)localList.get(0), paramzza);
      return;
      int j = 0;
    }
  }

  void zza(final zzve paramzzve, final zza paramzza)
  {
    this.zzaBP.zza(paramzzve.zzuj(), paramzzve.zzuh(), zzvi.zzaBX, new zzvm()
    {
      public void zza(Status paramAnonymousStatus, Object paramAnonymousObject, Integer paramAnonymousInteger, long paramAnonymousLong)
      {
        zzvk.zza.zza localzza1;
        if (paramAnonymousStatus.isSuccess())
          if (paramAnonymousInteger == zzvn.zzaCx)
            localzza1 = zzvk.zza.zza.zzaCh;
        for (zzvk.zza localzza = new zzvk.zza(Status.zzNo, paramzzve, null, (zzvl.zzc)paramAnonymousObject, localzza1, paramAnonymousLong); ; localzza = new zzvk.zza(new Status(16, "There is no valid resource for the container: " + paramzzve.getContainerId()), null, zzvk.zza.zza.zzaCg))
        {
          paramzza.zza(new zzvk(localzza));
          return;
          localzza1 = zzvk.zza.zza.zzaCg;
          break;
        }
      }
    });
  }

  void zza(zzvj paramzzvj, zza paramzza, zzvt paramzzvt)
  {
    Iterator localIterator = paramzzvj.zzun().iterator();
    int i = 0;
    zzve localzzve;
    long l;
    if (localIterator.hasNext())
    {
      localzzve = (zzve)localIterator.next();
      zzc localzzc = (zzc)this.zzaBQ.get(localzzve.getContainerId());
      if (localzzc != null)
      {
        l = localzzc.zzum();
        label67: if (l + 900000L >= this.zzmW.currentTimeMillis())
          break label220;
      }
    }
    label213: label220: for (int j = 1; ; j = i)
    {
      i = j;
      break;
      l = this.zzaBP.zzdD(localzzve.getContainerId());
      break label67;
      zzvv localzzvv1;
      zzvv localzzvv3;
      if (i != 0)
      {
        localzzvv1 = (zzvv)this.zzaBR.get(paramzzvj.getId());
        if (localzzvv1 != null)
          break label213;
        if (this.zzaya == null)
        {
          localzzvv3 = new zzvv();
          this.zzaBR.put(paramzzvj.getId(), localzzvv3);
        }
      }
      for (zzvv localzzvv2 = localzzvv3; ; localzzvv2 = localzzvv1)
      {
        localzzvv2.zza(this.mContext, paramzzvj, 0L, paramzzvt);
        return;
        localzzvv3 = new zzvv(this.zzaya);
        break;
        zza(paramzzvj, paramzza);
        return;
      }
    }
  }

  void zza(zzvk.zza paramzza)
  {
    String str = paramzza.zzur().getContainerId();
    Status localStatus = paramzza.getStatus();
    zzvl.zzc localzzc = paramzza.zzus();
    if (this.zzaBQ.containsKey(str))
    {
      zzc localzzc1 = (zzc)this.zzaBQ.get(str);
      localzzc1.zzJ(this.zzmW.currentTimeMillis());
      if (localStatus == Status.zzNo)
      {
        localzzc1.zzaO(localStatus);
        localzzc1.zzD(localzzc);
      }
      return;
    }
    this.zzaBQ.put(str, new zzc(localStatus, localzzc, this.zzmW.currentTimeMillis()));
  }

  public void zza(String paramString1, Integer paramInteger, String paramString2, zza paramzza)
  {
    zzvj localzzvj = new zzvj().zzb(new zzve(paramString1, paramInteger, paramString2, false));
    zza(localzzvj, paramzza, new zzb(localzzvj, zzvi.zzaBX, paramzza));
  }

  public void zzdx(String paramString)
  {
    this.zzaya = paramString;
  }

  public static abstract interface zza
  {
    public abstract void zza(zzvk paramzzvk);
  }

  class zzb extends zzvt
  {
    private final zzvg.zza zzaBV;

    zzb(zzvj paramzzvh, zzvh paramzza, zzvg.zza arg4)
    {
      super(paramzza);
      Object localObject;
      this.zzaBV = localObject;
    }

    protected zzvt.zzb zza(zzve paramzzve)
    {
      return null;
    }

    protected void zza(zzvk paramzzvk)
    {
      zzvk.zza localzza = paramzzvk.zzuo();
      zzvg.this.zza(localzza);
      if ((localzza.getStatus() == Status.zzNo) && (localzza.zzup() == zzvk.zza.zza.zzaCf) && (localzza.zzuq() != null) && (localzza.zzuq().length > 0))
      {
        zzvg.zza(zzvg.this).zzf(localzza.zzur().zzuj(), localzza.zzuq());
        zzbf.zzab("Resource successfully load from Network.");
        this.zzaBV.zza(paramzzvk);
        return;
      }
      StringBuilder localStringBuilder = new StringBuilder().append("Response status: ");
      if (localzza.getStatus().isSuccess());
      for (String str = "SUCCESS"; ; str = "FAILURE")
      {
        zzbf.zzab(str);
        if (localzza.getStatus().isSuccess())
        {
          zzbf.zzab("Response source: " + localzza.zzup().toString());
          zzbf.zzab("Response size: " + localzza.zzuq().length);
        }
        zzvg.this.zza(localzza.zzur(), this.zzaBV);
        return;
      }
    }
  }

  static class zzc<T>
  {
    private T mData;
    private Status zzHb;
    private long zzaBW;

    public zzc(Status paramStatus, T paramT, long paramLong)
    {
      this.zzHb = paramStatus;
      this.mData = paramT;
      this.zzaBW = paramLong;
    }

    public void zzD(T paramT)
    {
      this.mData = paramT;
    }

    public void zzJ(long paramLong)
    {
      this.zzaBW = paramLong;
    }

    public void zzaO(Status paramStatus)
    {
      this.zzHb = paramStatus;
    }

    public long zzum()
    {
      return this.zzaBW;
    }
  }
}