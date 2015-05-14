package com.google.android.gms.internal;

import android.content.Context;
import android.net.Uri;
import android.net.Uri.Builder;
import android.text.TextUtils;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class zzcc
{
  private final Context mContext;
  private final String zznf;
  private int zzqP;
  private int zzqQ;
  private int zzqR;
  private int zzqS;
  private String zzqT;
  private BlockingQueue<zzcf> zzqV;
  private ExecutorService zzqW;
  private LinkedHashMap<String, String> zzqX = new LinkedHashMap();

  public zzcc(Context paramContext, String paramString1, String paramString2, int paramInt1, int paramInt2, int paramInt3, int paramInt4, Map<String, String> paramMap, int paramInt5)
  {
    this.mContext = paramContext;
    this.zznf = paramString1;
    this.zzqT = paramString2;
    this.zzqQ = paramInt1;
    this.zzqR = paramInt2;
    this.zzqS = paramInt3;
    zzk(paramInt4);
    Iterator localIterator = paramMap.entrySet().iterator();
    while (localIterator.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)localIterator.next();
      zze((String)localEntry.getKey(), (String)localEntry.getValue());
    }
    if (paramInt5 == 1)
      zzck();
    if (paramInt5 == 2)
      zzcl();
    init();
  }

  private void init()
  {
    this.zzqV = new ArrayBlockingQueue(this.zzqQ);
    this.zzqW = Executors.newSingleThreadExecutor();
    this.zzqW.execute(new Runnable()
    {
      public void run()
      {
        zzcc.zza(zzcc.this);
      }
    });
  }

  private boolean zzb(Map<String, String> paramMap)
  {
    boolean bool = false;
    int i = 0;
    while (true)
      if ((!bool) && (i < this.zzqR))
        try
        {
          Thread.sleep(this.zzqS);
          String str = zza(this.zzqT, paramMap);
          zzab.zzaM().zzc(this.mContext, this.zznf, str);
          bool = true;
          i++;
        }
        catch (InterruptedException localInterruptedException)
        {
          while (true)
          {
            zzhx.zzd("CsiReporter:interrupted in sendReport()", localInterruptedException);
            Thread.currentThread().interrupt();
          }
        }
    return bool;
  }

  private void zzck()
  {
    zzca.zza(new Runnable()
    {
      public void run()
      {
        if (!zzca.zzcb().isEmpty())
          zzcc.this.zze("eid", TextUtils.join(",", zzca.zzcb()));
      }
    });
  }

  private void zzcl()
  {
    if (!zzca.zzca().isEmpty())
      zze("eid", TextUtils.join(",", zzca.zzca()));
  }

  private void zzcm()
  {
    try
    {
      List localList;
      do
        localList = zzj(this.zzqP);
      while (localList == null);
      Iterator localIterator = zzc(localList).values().iterator();
      while (localIterator.hasNext())
        zzb((Map)localIterator.next());
    }
    catch (InterruptedException localInterruptedException)
    {
      zzhx.zzd("CsiReporter:reporter interrupted", localInterruptedException);
    }
  }

  private List<zzcf> zzj(int paramInt)
    throws InterruptedException
  {
    ArrayList localArrayList = new ArrayList();
    for (int i = 0; i < paramInt; i++)
      localArrayList.add(this.zzqV.take());
    return localArrayList;
  }

  private void zzk(int paramInt)
  {
    if (paramInt < 1)
    {
      zzhx.zzac("CsiReporter - too small batch size :" + paramInt + ", changed to 1");
      paramInt = 1;
    }
    if (paramInt > this.zzqQ)
    {
      zzhx.zzac("CsiReporter - batch size :" + paramInt + " bigger than buffer size, " + "change to buffer limit");
      paramInt = this.zzqQ;
    }
    this.zzqP = paramInt;
  }

  String zza(String paramString, Map<String, String> paramMap)
  {
    Uri.Builder localBuilder = Uri.parse(paramString).buildUpon();
    Iterator localIterator = paramMap.entrySet().iterator();
    while (localIterator.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)localIterator.next();
      localBuilder.appendQueryParameter((String)localEntry.getKey(), (String)localEntry.getValue());
    }
    return localBuilder.build().toString();
  }

  public boolean zza(zzcf paramzzcf)
  {
    return this.zzqV.offer(paramzzcf);
  }

  Map<String, Map<String, String>> zzc(List<zzcf> paramList)
  {
    LinkedHashMap localLinkedHashMap1 = new LinkedHashMap();
    Iterator localIterator1 = paramList.iterator();
    while (localIterator1.hasNext())
    {
      zzcf localzzcf = (zzcf)localIterator1.next();
      String str = localzzcf.zzct();
      if (localLinkedHashMap1.containsKey(str))
      {
        ((List)localLinkedHashMap1.get(str)).add(localzzcf);
      }
      else
      {
        ArrayList localArrayList = new ArrayList();
        localArrayList.add(localzzcf);
        localLinkedHashMap1.put(str, localArrayList);
      }
    }
    LinkedHashMap localLinkedHashMap2 = new LinkedHashMap();
    Iterator localIterator2 = localLinkedHashMap1.entrySet().iterator();
    while (localIterator2.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)localIterator2.next();
      List localList = (List)localEntry.getValue();
      LinkedHashMap localLinkedHashMap3 = new LinkedHashMap(this.zzqX);
      try
      {
        Map localMap = zzcf.zza((zzcf[])localList.toArray(new zzcf[localList.size()]));
        localLinkedHashMap3.putAll(localMap);
        localLinkedHashMap2.put(localEntry.getKey(), localLinkedHashMap3);
      }
      catch (IllegalArgumentException localIllegalArgumentException)
      {
        zzhx.zzd("CsiReporter:failed to merge tickers:" + localList, localIllegalArgumentException);
      }
    }
    return localLinkedHashMap2;
  }

  void zze(String paramString1, String paramString2)
  {
    this.zzqX.put(paramString1, paramString2);
  }
}