package com.google.android.gms.internal;

import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.Map;

public class zzcf
{
  private static int zzrd;
  private final Object zznh = new Object();
  final String zzrc;
  private final LinkedList<zzce> zzre;
  private zzce zzrf;

  public zzcf(String paramString)
  {
    this.zzrc = paramString;
    zzrd = ((Integer)zzca.zzqz.get()).intValue();
    synchronized (this.zznh)
    {
      this.zzre = new LinkedList();
      return;
    }
  }

  private zzce zza(long paramLong)
  {
    return new zzce(paramLong, null, null);
  }

  private static Map<String, String> zza(String paramString, StringBuilder paramStringBuilder)
  {
    int i = paramStringBuilder.length();
    LinkedHashMap localLinkedHashMap = null;
    if (i > 0)
    {
      localLinkedHashMap = new LinkedHashMap();
      if (paramString != null)
        localLinkedHashMap.put("action", paramString);
      paramStringBuilder.setLength(-1 + paramStringBuilder.length());
      localLinkedHashMap.put("it", paramStringBuilder.toString());
    }
    return localLinkedHashMap;
  }

  public static Map<String, String> zza(zzcf[] paramArrayOfzzcf)
    throws IllegalArgumentException
  {
    String str = null;
    StringBuilder localStringBuilder = new StringBuilder(20 * (10 * zzrd));
    int i = 0;
    if (i < paramArrayOfzzcf.length)
    {
      Map localMap = paramArrayOfzzcf[i].zzcs();
      if (localMap == null);
      while (true)
      {
        i++;
        break;
        if (i == 0)
        {
          str = (String)localMap.get("action");
          localStringBuilder.append((String)localMap.get("it")).append(",");
        }
        else
        {
          if (((!localMap.containsKey("action")) && (str != null)) || ((localMap.containsKey("action")) && (!((String)localMap.get("action")).equals(str))))
            throw new IllegalArgumentException("Can not merge report items for the tickers with different action names.");
          localStringBuilder.append((String)localMap.get("it")).append(",");
        }
      }
    }
    return zza(str, localStringBuilder);
  }

  private boolean zza(zzce paramzzce, long paramLong, String[] paramArrayOfString)
  {
    synchronized (this.zznh)
    {
      int i = paramArrayOfString.length;
      for (int j = 0; j < i; j++)
      {
        zzce localzzce = new zzce(paramLong, paramArrayOfString[j], paramzzce);
        this.zzre.add(localzzce);
      }
      return true;
    }
  }

  public boolean zza(zzce paramzzce, String[] paramArrayOfString)
  {
    if ((!zzab.zzaR().zzcd()) || (paramzzce == null))
      return false;
    return zza(paramzzce, zzab.zzaQ().elapsedRealtime(), paramArrayOfString);
  }

  public zzce zzcq()
  {
    if (!zzab.zzaR().zzcd())
      return null;
    return zza(zzab.zzaQ().elapsedRealtime());
  }

  public void zzcr()
  {
    this.zzrf = zzcq();
  }

  Map<String, String> zzcs()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    synchronized (this.zznh)
    {
      Iterator localIterator = this.zzre.iterator();
      while (localIterator.hasNext())
      {
        zzce localzzce1 = (zzce)localIterator.next();
        Long localLong = localzzce1.zzcn();
        String str = localzzce1.zzco();
        zzce localzzce2 = localzzce1.zzcp();
        if ((localzzce2 != null) && (localLong.longValue() > 0L))
        {
          long l = localLong.longValue() - localzzce2.zzcn().longValue();
          localStringBuilder.append(str).append('.').append(l).append(',');
        }
      }
    }
    this.zzre.clear();
    return zza(this.zzrc, localStringBuilder);
  }

  public String zzct()
  {
    return this.zzrc;
  }

  public zzce zzcu()
  {
    return this.zzrf;
  }
}