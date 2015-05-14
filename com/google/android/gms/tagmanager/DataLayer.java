package com.google.android.gms.tagmanager;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.locks.ReentrantLock;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class DataLayer
{
  public static final String EVENT_KEY = "event";
  public static final Object OBJECT_NOT_PRESENT = new Object();
  static final String[] zzayd = "gtm.lifetime".toString().split("\\.");
  private static final Pattern zzaye = Pattern.compile("(\\d+)\\s*([smhd]?)");
  private final ConcurrentHashMap<zzb, Integer> zzayf;
  private final Map<String, Object> zzayg;
  private final ReentrantLock zzayh;
  private final LinkedList<Map<String, Object>> zzayi;
  private final zzc zzayj;
  private final CountDownLatch zzayk;

  DataLayer()
  {
    this(new zzc()
    {
      public void zza(DataLayer.zzc.zza paramAnonymouszza)
      {
        paramAnonymouszza.zzq(new ArrayList());
      }

      public void zza(List<DataLayer.zza> paramAnonymousList, long paramAnonymousLong)
      {
      }

      public void zzcW(String paramAnonymousString)
      {
      }
    });
  }

  DataLayer(zzc paramzzc)
  {
    this.zzayj = paramzzc;
    this.zzayf = new ConcurrentHashMap();
    this.zzayg = new HashMap();
    this.zzayh = new ReentrantLock();
    this.zzayi = new LinkedList();
    this.zzayk = new CountDownLatch(1);
    zzsU();
  }

  public static List<Object> listOf(Object[] paramArrayOfObject)
  {
    ArrayList localArrayList = new ArrayList();
    for (int i = 0; i < paramArrayOfObject.length; i++)
      localArrayList.add(paramArrayOfObject[i]);
    return localArrayList;
  }

  public static Map<String, Object> mapOf(Object[] paramArrayOfObject)
  {
    if (paramArrayOfObject.length % 2 != 0)
      throw new IllegalArgumentException("expected even number of key-value pairs");
    HashMap localHashMap = new HashMap();
    for (int i = 0; i < paramArrayOfObject.length; i += 2)
    {
      if (!(paramArrayOfObject[i] instanceof String))
        throw new IllegalArgumentException("key is not a string: " + paramArrayOfObject[i]);
      localHashMap.put((String)paramArrayOfObject[i], paramArrayOfObject[(i + 1)]);
    }
    return localHashMap;
  }

  private void zzK(Map<String, Object> paramMap)
  {
    this.zzayh.lock();
    try
    {
      this.zzayi.offer(paramMap);
      if (this.zzayh.getHoldCount() == 1)
        zzsV();
      zzL(paramMap);
      return;
    }
    finally
    {
      this.zzayh.unlock();
    }
  }

  private void zzL(Map<String, Object> paramMap)
  {
    Long localLong = zzM(paramMap);
    if (localLong == null)
      return;
    List localList = zzO(paramMap);
    localList.remove("gtm.lifetime");
    this.zzayj.zza(localList, localLong.longValue());
  }

  private Long zzM(Map<String, Object> paramMap)
  {
    Object localObject = zzN(paramMap);
    if (localObject == null)
      return null;
    return zzcV(localObject.toString());
  }

  private Object zzN(Map<String, Object> paramMap)
  {
    String[] arrayOfString = zzayd;
    int i = arrayOfString.length;
    int j = 0;
    Object localObject2;
    for (Object localObject1 = paramMap; ; localObject1 = localObject2)
    {
      String str;
      if (j < i)
      {
        str = arrayOfString[j];
        if (!(localObject1 instanceof Map))
          localObject1 = null;
      }
      else
      {
        return localObject1;
      }
      localObject2 = ((Map)localObject1).get(str);
      j++;
    }
  }

  private List<zza> zzO(Map<String, Object> paramMap)
  {
    ArrayList localArrayList = new ArrayList();
    zza(paramMap, "", localArrayList);
    return localArrayList;
  }

  private void zzP(Map<String, Object> paramMap)
  {
    synchronized (this.zzayg)
    {
      Iterator localIterator = paramMap.keySet().iterator();
      if (localIterator.hasNext())
      {
        String str = (String)localIterator.next();
        zza(zzc(str, paramMap.get(str)), this.zzayg);
      }
    }
    zzQ(paramMap);
  }

  private void zzQ(Map<String, Object> paramMap)
  {
    Iterator localIterator = this.zzayf.keySet().iterator();
    while (localIterator.hasNext())
      ((zzb)localIterator.next()).zzI(paramMap);
  }

  private void zza(Map<String, Object> paramMap, String paramString, Collection<zza> paramCollection)
  {
    Iterator localIterator = paramMap.entrySet().iterator();
    while (localIterator.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)localIterator.next();
      StringBuilder localStringBuilder = new StringBuilder().append(paramString);
      if (paramString.length() == 0);
      String str2;
      for (String str1 = ""; ; str1 = ".")
      {
        str2 = str1 + (String)localEntry.getKey();
        if (!(localEntry.getValue() instanceof Map))
          break label125;
        zza((Map)localEntry.getValue(), str2, paramCollection);
        break;
      }
      label125: if (!str2.equals("gtm.lifetime"))
        paramCollection.add(new zza(str2, localEntry.getValue()));
    }
  }

  static Long zzcV(String paramString)
  {
    Matcher localMatcher = zzaye.matcher(paramString);
    if (!localMatcher.matches())
    {
      zzbf.zzaa("unknown _lifetime: " + paramString);
      return null;
    }
    long l1;
    try
    {
      long l2 = Long.parseLong(localMatcher.group(1));
      l1 = l2;
      if (l1 <= 0L)
      {
        zzbf.zzaa("non-positive _lifetime: " + paramString);
        return null;
      }
    }
    catch (NumberFormatException localNumberFormatException)
    {
      while (true)
      {
        zzbf.zzac("illegal number in _lifetime value: " + paramString);
        l1 = 0L;
      }
      String str = localMatcher.group(2);
      if (str.length() == 0)
        return Long.valueOf(l1);
      switch (str.charAt(0))
      {
      default:
        zzbf.zzac("unknown units in _lifetime: " + paramString);
        return null;
      case 's':
      case 'm':
      case 'h':
      case 'd':
      }
    }
    return Long.valueOf(l1 * 1000L);
    return Long.valueOf(60L * (l1 * 1000L));
    return Long.valueOf(60L * (60L * (l1 * 1000L)));
    return Long.valueOf(24L * (60L * (60L * (l1 * 1000L))));
  }

  private void zzsU()
  {
    this.zzayj.zza(new DataLayer.zzc.zza()
    {
      public void zzq(List<DataLayer.zza> paramAnonymousList)
      {
        Iterator localIterator = paramAnonymousList.iterator();
        while (localIterator.hasNext())
        {
          DataLayer.zza localzza = (DataLayer.zza)localIterator.next();
          DataLayer.zza(DataLayer.this, DataLayer.this.zzc(localzza.zzqd, localzza.zzzt));
        }
        DataLayer.zza(DataLayer.this).countDown();
      }
    });
  }

  private void zzsV()
  {
    int j;
    for (int i = 0; ; i = j)
    {
      Map localMap = (Map)this.zzayi.poll();
      if (localMap != null)
      {
        zzP(localMap);
        j = i + 1;
        if (j > 500)
        {
          this.zzayi.clear();
          throw new RuntimeException("Seems like an infinite loop of pushing to the data layer");
        }
      }
      else
      {
        return;
      }
    }
  }

  public Object get(String paramString)
  {
    while (true)
    {
      int j;
      Object localObject3;
      synchronized (this.zzayg)
      {
        Map localMap2 = this.zzayg;
        String[] arrayOfString = paramString.split("\\.");
        int i = arrayOfString.length;
        localObject2 = localMap2;
        j = 0;
        if (j < i)
        {
          String str = arrayOfString[j];
          if (!(localObject2 instanceof Map))
            return null;
          localObject3 = ((Map)localObject2).get(str);
          if (localObject3 == null)
            return null;
        }
        else
        {
          return localObject2;
        }
      }
      j++;
      Object localObject2 = localObject3;
    }
  }

  public void push(String paramString, Object paramObject)
  {
    push(zzc(paramString, paramObject));
  }

  public void push(Map<String, Object> paramMap)
  {
    try
    {
      this.zzayk.await();
      zzK(paramMap);
      return;
    }
    catch (InterruptedException localInterruptedException)
    {
      while (true)
        zzbf.zzac("DataLayer.push: unexpected InterruptedException");
    }
  }

  public void pushEvent(String paramString, Map<String, Object> paramMap)
  {
    HashMap localHashMap = new HashMap(paramMap);
    localHashMap.put("event", paramString);
    push(localHashMap);
  }

  public String toString()
  {
    StringBuilder localStringBuilder;
    synchronized (this.zzayg)
    {
      localStringBuilder = new StringBuilder();
      Iterator localIterator = this.zzayg.entrySet().iterator();
      if (localIterator.hasNext())
      {
        Map.Entry localEntry = (Map.Entry)localIterator.next();
        Object[] arrayOfObject = new Object[2];
        arrayOfObject[0] = localEntry.getKey();
        arrayOfObject[1] = localEntry.getValue();
        localStringBuilder.append(String.format("{\n\tKey: %s\n\tValue: %s\n}\n", arrayOfObject));
      }
    }
    String str = localStringBuilder.toString();
    return str;
  }

  void zza(zzb paramzzb)
  {
    this.zzayf.put(paramzzb, Integer.valueOf(0));
  }

  void zza(Map<String, Object> paramMap1, Map<String, Object> paramMap2)
  {
    Iterator localIterator = paramMap1.keySet().iterator();
    while (localIterator.hasNext())
    {
      String str = (String)localIterator.next();
      Object localObject = paramMap1.get(str);
      if ((localObject instanceof List))
      {
        if (!(paramMap2.get(str) instanceof List))
          paramMap2.put(str, new ArrayList());
        zzb((List)localObject, (List)paramMap2.get(str));
      }
      else if ((localObject instanceof Map))
      {
        if (!(paramMap2.get(str) instanceof Map))
          paramMap2.put(str, new HashMap());
        zza((Map)localObject, (Map)paramMap2.get(str));
      }
      else
      {
        paramMap2.put(str, localObject);
      }
    }
  }

  void zzb(List<Object> paramList1, List<Object> paramList2)
  {
    while (paramList2.size() < paramList1.size())
      paramList2.add(null);
    int i = 0;
    if (i < paramList1.size())
    {
      Object localObject = paramList1.get(i);
      if ((localObject instanceof List))
      {
        if (!(paramList2.get(i) instanceof List))
          paramList2.set(i, new ArrayList());
        zzb((List)localObject, (List)paramList2.get(i));
      }
      while (true)
      {
        i++;
        break;
        if ((localObject instanceof Map))
        {
          if (!(paramList2.get(i) instanceof Map))
            paramList2.set(i, new HashMap());
          zza((Map)localObject, (Map)paramList2.get(i));
        }
        else if (localObject != OBJECT_NOT_PRESENT)
        {
          paramList2.set(i, localObject);
        }
      }
    }
  }

  Map<String, Object> zzc(String paramString, Object paramObject)
  {
    HashMap localHashMap1 = new HashMap();
    String[] arrayOfString = paramString.toString().split("\\.");
    int i = 0;
    HashMap localHashMap2;
    for (Object localObject = localHashMap1; i < -1 + arrayOfString.length; localObject = localHashMap2)
    {
      localHashMap2 = new HashMap();
      ((Map)localObject).put(arrayOfString[i], localHashMap2);
      i++;
    }
    ((Map)localObject).put(arrayOfString[(-1 + arrayOfString.length)], paramObject);
    return localHashMap1;
  }

  void zzcU(String paramString)
  {
    push(paramString, null);
    this.zzayj.zzcW(paramString);
  }

  static final class zza
  {
    public final String zzqd;
    public final Object zzzt;

    zza(String paramString, Object paramObject)
    {
      this.zzqd = paramString;
      this.zzzt = paramObject;
    }

    public boolean equals(Object paramObject)
    {
      if (!(paramObject instanceof zza));
      zza localzza;
      do
      {
        return false;
        localzza = (zza)paramObject;
      }
      while ((!this.zzqd.equals(localzza.zzqd)) || (!this.zzzt.equals(localzza.zzzt)));
      return true;
    }

    public int hashCode()
    {
      Integer[] arrayOfInteger = new Integer[2];
      arrayOfInteger[0] = Integer.valueOf(this.zzqd.hashCode());
      arrayOfInteger[1] = Integer.valueOf(this.zzzt.hashCode());
      return Arrays.hashCode(arrayOfInteger);
    }

    public String toString()
    {
      return "Key: " + this.zzqd + " value: " + this.zzzt.toString();
    }
  }

  static abstract interface zzb
  {
    public abstract void zzI(Map<String, Object> paramMap);
  }

  static abstract interface zzc
  {
    public abstract void zza(zza paramzza);

    public abstract void zza(List<DataLayer.zza> paramList, long paramLong);

    public abstract void zzcW(String paramString);

    public static abstract interface zza
    {
      public abstract void zzq(List<DataLayer.zza> paramList);
    }
  }
}