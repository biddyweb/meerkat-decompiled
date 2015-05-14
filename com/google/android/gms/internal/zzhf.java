package com.google.android.gms.internal;

import android.os.Bundle;
import android.os.SystemClock;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;

@zzgi
public class zzhf
{
  private final zzhg zzmV;
  private final Object zznh = new Object();
  private boolean zzxJ = false;
  private final LinkedList<zza> zzyA;
  private final String zzyB;
  private final String zzyC;
  private long zzyD = -1L;
  private long zzyE = -1L;
  private long zzyF = -1L;
  private long zzyG = 0L;
  private long zzyH = -1L;
  private long zzyI = -1L;

  public zzhf(zzhg paramzzhg, String paramString1, String paramString2)
  {
    this.zzmV = paramzzhg;
    this.zzyB = paramString1;
    this.zzyC = paramString2;
    this.zzyA = new LinkedList();
  }

  public zzhf(String paramString1, String paramString2)
  {
    this(zzab.zzaP(), paramString1, paramString2);
  }

  public Bundle toBundle()
  {
    Bundle localBundle;
    ArrayList localArrayList;
    synchronized (this.zznh)
    {
      localBundle = new Bundle();
      localBundle.putString("seq_num", this.zzyB);
      localBundle.putString("slotid", this.zzyC);
      localBundle.putBoolean("ismediation", this.zzxJ);
      localBundle.putLong("treq", this.zzyH);
      localBundle.putLong("tresponse", this.zzyI);
      localBundle.putLong("timp", this.zzyE);
      localBundle.putLong("tload", this.zzyF);
      localBundle.putLong("pcc", this.zzyG);
      localBundle.putLong("tfetch", this.zzyD);
      localArrayList = new ArrayList();
      Iterator localIterator = this.zzyA.iterator();
      if (localIterator.hasNext())
        localArrayList.add(((zza)localIterator.next()).toBundle());
    }
    localBundle.putParcelableArrayList("tclick", localArrayList);
    return localBundle;
  }

  public void zzdX()
  {
    synchronized (this.zznh)
    {
      if ((this.zzyI != -1L) && (this.zzyE == -1L))
      {
        this.zzyE = SystemClock.elapsedRealtime();
        this.zzmV.zza(this);
      }
      this.zzmV.zzef().zzdX();
      return;
    }
  }

  public void zzdY()
  {
    synchronized (this.zznh)
    {
      if (this.zzyI != -1L)
      {
        zza localzza = new zza();
        localzza.zzec();
        this.zzyA.add(localzza);
        this.zzyG = (1L + this.zzyG);
        this.zzmV.zzef().zzdY();
        this.zzmV.zza(this);
      }
      return;
    }
  }

  public void zzdZ()
  {
    synchronized (this.zznh)
    {
      if ((this.zzyI != -1L) && (!this.zzyA.isEmpty()))
      {
        zza localzza = (zza)this.zzyA.getLast();
        if (localzza.zzea() == -1L)
        {
          localzza.zzeb();
          this.zzmV.zza(this);
        }
      }
      return;
    }
  }

  public void zze(zzax paramzzax)
  {
    synchronized (this.zznh)
    {
      this.zzyH = SystemClock.elapsedRealtime();
      this.zzmV.zzef().zzb(paramzzax, this.zzyH);
      return;
    }
  }

  public void zzj(long paramLong)
  {
    synchronized (this.zznh)
    {
      this.zzyI = paramLong;
      if (this.zzyI != -1L)
        this.zzmV.zza(this);
      return;
    }
  }

  public void zzk(long paramLong)
  {
    synchronized (this.zznh)
    {
      if (this.zzyI != -1L)
      {
        this.zzyD = paramLong;
        this.zzmV.zza(this);
      }
      return;
    }
  }

  public void zzx(boolean paramBoolean)
  {
    synchronized (this.zznh)
    {
      if (this.zzyI != -1L)
      {
        this.zzyF = SystemClock.elapsedRealtime();
        if (!paramBoolean)
        {
          this.zzyE = this.zzyF;
          this.zzmV.zza(this);
        }
      }
      return;
    }
  }

  public void zzy(boolean paramBoolean)
  {
    synchronized (this.zznh)
    {
      if (this.zzyI != -1L)
      {
        this.zzxJ = paramBoolean;
        this.zzmV.zza(this);
      }
      return;
    }
  }

  @zzgi
  private static final class zza
  {
    private long zzyJ = -1L;
    private long zzyK = -1L;

    public Bundle toBundle()
    {
      Bundle localBundle = new Bundle();
      localBundle.putLong("topen", this.zzyJ);
      localBundle.putLong("tclose", this.zzyK);
      return localBundle;
    }

    public long zzea()
    {
      return this.zzyK;
    }

    public void zzeb()
    {
      this.zzyK = SystemClock.elapsedRealtime();
    }

    public void zzec()
    {
      this.zzyJ = SystemClock.elapsedRealtime();
    }
  }
}