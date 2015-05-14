package com.google.android.gms.internal;

import android.os.Binder;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

@zzgi
public class zzby
{
  Collection<zzbw> zzqf = new ArrayList();
  Collection<zzbx<String>> zzqg = new ArrayList();

  public void zza(zzbw paramzzbw)
  {
    this.zzqf.add(paramzzbw);
  }

  public void zza(zzbx<String> paramzzbx)
  {
    this.zzqg.add(paramzzbx);
  }

  public List<String> zzca()
  {
    ArrayList localArrayList = new ArrayList();
    long l = Binder.clearCallingIdentity();
    try
    {
      Iterator localIterator = this.zzqg.iterator();
      while (localIterator.hasNext())
      {
        String str = (String)((zzbx)localIterator.next()).zzbZ().get();
        if (str != null)
          localArrayList.add(str);
      }
    }
    finally
    {
      Binder.restoreCallingIdentity(l);
    }
    Binder.restoreCallingIdentity(l);
    return localArrayList;
  }

  public List<String> zzcb()
  {
    ArrayList localArrayList = new ArrayList();
    Iterator localIterator = this.zzqg.iterator();
    while (localIterator.hasNext())
    {
      String str = (String)((zzbx)localIterator.next()).get();
      if (str != null)
        localArrayList.add(str);
    }
    return localArrayList;
  }
}