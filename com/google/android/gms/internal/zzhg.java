package com.google.android.gms.internal;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.res.Resources;
import android.os.Bundle;
import com.google.android.gms.common.GooglePlayServicesUtil;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.Set;

@zzgi
public class zzhg
{
  private Context mContext;
  private zzae zzlG;
  private boolean zzmE = false;
  private final Object zznh = new Object();
  private zzhy zznl;
  private zzam zzol = null;
  private zzal zzom = null;
  private final zzgh zzon = null;
  private boolean zzxO = true;
  private boolean zzxP = true;
  private final String zzyL;
  private final zzhh zzyM;
  private BigInteger zzyN = BigInteger.ONE;
  private final HashSet<zzhf> zzyO = new HashSet();
  private final HashMap<String, zzhj> zzyP = new HashMap();
  private boolean zzyQ = false;
  private int zzyR = 0;
  private zzcc zzyS = null;
  private zzan zzyT = null;
  private final LinkedList<Thread> zzyU = new LinkedList();
  private Boolean zzyV = null;
  private String zzyW;

  public zzhg(zzho paramzzho)
  {
    this.zzyL = paramzzho.zzeu();
    this.zzyM = new zzhh(this.zzyL);
  }

  public String getSessionId()
  {
    return this.zzyL;
  }

  public Bundle zza(Context paramContext, zzhi paramzzhi, String paramString)
  {
    Bundle localBundle1;
    Bundle localBundle2;
    synchronized (this.zznh)
    {
      localBundle1 = new Bundle();
      localBundle1.putBundle("app", this.zzyM.zzc(paramContext, paramString));
      localBundle2 = new Bundle();
      Iterator localIterator1 = this.zzyP.keySet().iterator();
      if (localIterator1.hasNext())
      {
        String str = (String)localIterator1.next();
        localBundle2.putBundle(str, ((zzhj)this.zzyP.get(str)).toBundle());
      }
    }
    localBundle1.putBundle("slots", localBundle2);
    ArrayList localArrayList = new ArrayList();
    Iterator localIterator2 = this.zzyO.iterator();
    while (localIterator2.hasNext())
      localArrayList.add(((zzhf)localIterator2.next()).toBundle());
    localBundle1.putParcelableArrayList("ads", localArrayList);
    paramzzhi.zza(this.zzyO);
    this.zzyO.clear();
    return localBundle1;
  }

  public void zza(Context paramContext, boolean paramBoolean)
  {
    synchronized (this.zznh)
    {
      if (paramBoolean != this.zzxO)
      {
        this.zzxO = paramBoolean;
        zzhm.zza(paramContext, paramBoolean);
      }
      return;
    }
  }

  public void zza(zzhf paramzzhf)
  {
    synchronized (this.zznh)
    {
      this.zzyO.add(paramzzhf);
      return;
    }
  }

  public void zza(String paramString, zzhj paramzzhj)
  {
    synchronized (this.zznh)
    {
      this.zzyP.put(paramString, paramzzhj);
      return;
    }
  }

  public void zza(Thread paramThread)
  {
    zzca.zza(new zzhg.1(this, paramThread));
  }

  public void zzb(Context paramContext, zzhy paramzzhy)
  {
    synchronized (this.zznh)
    {
      if (!this.zzmE)
      {
        this.mContext = paramContext.getApplicationContext();
        this.zznl = paramzzhy;
        this.zzxO = zzhm.zzr(paramContext);
        this.zzyR = zzhm.zzs(paramContext);
        zza(Thread.currentThread());
        this.zzyW = zzab.zzaM().zze(paramContext, paramzzhy.zzzH);
        this.zzlG = new zzae(paramContext.getApplicationContext(), this.zznl, new zzdf(paramContext.getApplicationContext(), this.zznl, (String)zzca.zzql.get()));
        zzen();
        this.zzmE = true;
      }
      return;
    }
  }

  public void zzb(Boolean paramBoolean)
  {
    synchronized (this.zznh)
    {
      this.zzyV = paramBoolean;
      return;
    }
  }

  public void zzb(HashSet<zzhf> paramHashSet)
  {
    synchronized (this.zznh)
    {
      this.zzyO.addAll(paramHashSet);
      return;
    }
  }

  public String zzc(int paramInt, String paramString)
  {
    if (this.zznl.zzzK);
    for (Resources localResources = this.mContext.getResources(); localResources == null; localResources = GooglePlayServicesUtil.getRemoteResource(this.mContext))
      return paramString;
    return localResources.getString(paramInt);
  }

  public void zze(Throwable paramThrowable)
  {
    new zzgh(this.mContext, this.zznl, null, null).zzb(paramThrowable);
  }

  public boolean zzed()
  {
    synchronized (this.zznh)
    {
      boolean bool = this.zzxP;
      return bool;
    }
  }

  public String zzee()
  {
    synchronized (this.zznh)
    {
      String str = this.zzyN.toString();
      this.zzyN = this.zzyN.add(BigInteger.ONE);
      return str;
    }
  }

  public zzhh zzef()
  {
    synchronized (this.zznh)
    {
      zzhh localzzhh = this.zzyM;
      return localzzhh;
    }
  }

  public zzcc zzeg()
  {
    synchronized (this.zznh)
    {
      zzcc localzzcc = this.zzyS;
      return localzzcc;
    }
  }

  public boolean zzeh()
  {
    synchronized (this.zznh)
    {
      boolean bool = this.zzyQ;
      this.zzyQ = true;
      return bool;
    }
  }

  public boolean zzei()
  {
    synchronized (this.zznh)
    {
      boolean bool = this.zzxO;
      return bool;
    }
  }

  public String zzej()
  {
    synchronized (this.zznh)
    {
      String str = this.zzyW;
      return str;
    }
  }

  public Boolean zzek()
  {
    synchronized (this.zznh)
    {
      Boolean localBoolean = this.zzyV;
      return localBoolean;
    }
  }

  public zzae zzel()
  {
    return this.zzlG;
  }

  public boolean zzem()
  {
    synchronized (this.zznh)
    {
      if (this.zzyR < ((Integer)zzca.zzqN.get()).intValue())
      {
        this.zzyR = ((Integer)zzca.zzqN.get()).intValue();
        zzhm.zza(this.mContext, this.zzyR);
        return true;
      }
      return false;
    }
  }

  void zzen()
  {
    zzca.zza(new zzhg.2(this));
  }

  public zzan zzo(Context paramContext)
  {
    if ((!((Boolean)zzca.zzqB.get()).booleanValue()) || (!zzme.zzkg()) || (zzed()))
      return null;
    synchronized (this.zznh)
    {
      if (this.zzol == null)
      {
        if (!(paramContext instanceof Activity))
          return null;
        this.zzol = new zzam((Application)paramContext.getApplicationContext(), (Activity)paramContext);
      }
      if (this.zzom == null)
        this.zzom = new zzal();
      if (this.zzyT == null)
        this.zzyT = new zzan(this.zzol, this.zzom, new zzgh(this.mContext, this.zznl, null, null));
      this.zzyT.zzbt();
      zzan localzzan = this.zzyT;
      return localzzan;
    }
  }

  public void zzz(boolean paramBoolean)
  {
    synchronized (this.zznh)
    {
      this.zzxP = paramBoolean;
      return;
    }
  }
}