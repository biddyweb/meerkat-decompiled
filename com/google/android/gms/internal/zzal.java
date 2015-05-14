package com.google.android.gms.internal;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

@zzgi
public class zzal
{
  private final Object zznh = new Object();
  private int zzog;
  private List<zzak> zzoh = new LinkedList();

  public boolean zza(zzak paramzzak)
  {
    synchronized (this.zznh)
    {
      return this.zzoh.contains(paramzzak);
    }
  }

  public boolean zzb(zzak paramzzak)
  {
    synchronized (this.zznh)
    {
      Iterator localIterator = this.zzoh.iterator();
      while (localIterator.hasNext())
      {
        zzak localzzak = (zzak)localIterator.next();
        if ((paramzzak != localzzak) && (localzzak.zzbm().equals(paramzzak.zzbm())))
        {
          localIterator.remove();
          return true;
        }
      }
      return false;
    }
  }

  public zzak zzbs()
  {
    Object localObject4;
    for (Object localObject1 = null; ; localObject1 = localObject4)
    {
      synchronized (this.zznh)
      {
        if (this.zzoh.size() == 0)
        {
          zzhx.zzY("Queue empty");
          return null;
        }
        if (this.zzoh.size() >= 2)
        {
          i = -2147483648;
          Iterator localIterator = this.zzoh.iterator();
          if (localIterator.hasNext())
          {
            zzak localzzak1 = (zzak)localIterator.next();
            int j = localzzak1.getScore();
            if (j <= i)
              break label150;
            localObject4 = localzzak1;
            k = j;
            break label160;
          }
          this.zzoh.remove(localObject1);
          return localObject1;
        }
      }
      zzak localzzak2 = (zzak)this.zzoh.get(0);
      localzzak2.zzbn();
      return localzzak2;
      label150: int k = i;
      localObject4 = localObject1;
      label160: int i = k;
    }
  }

  public void zzc(zzak paramzzak)
  {
    synchronized (this.zznh)
    {
      if (this.zzoh.size() >= 10)
      {
        zzhx.zzY("Queue is full, current size = " + this.zzoh.size());
        this.zzoh.remove(0);
      }
      int i = this.zzog;
      this.zzog = (i + 1);
      paramzzak.zzc(i);
      this.zzoh.add(paramzzak);
      return;
    }
  }
}