package com.google.android.gms.tagmanager;

import com.google.android.gms.internal.zzd.zza;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

public class zzde
{
  private static final Object zzaBl = null;
  private static Long zzaBm = new Long(0L);
  private static Double zzaBn = new Double(0.0D);
  private static zzdd zzaBo = zzdd.zzI(0L);
  private static String zzaBp = new String("");
  private static Boolean zzaBq = new Boolean(false);
  private static List<Object> zzaBr = new ArrayList(0);
  private static Map<Object, Object> zzaBs = new HashMap();
  private static zzd.zza zzaBt = zzx(zzaBp);

  private static double getDouble(Object paramObject)
  {
    if ((paramObject instanceof Number))
      return ((Number)paramObject).doubleValue();
    zzbf.zzZ("getDouble received non-Number");
    return 0.0D;
  }

  private static long zzA(Object paramObject)
  {
    if ((paramObject instanceof Number))
      return ((Number)paramObject).longValue();
    zzbf.zzZ("getInt64 received non-Number");
    return 0L;
  }

  public static zzd.zza zzdo(String paramString)
  {
    zzd.zza localzza = new zzd.zza();
    localzza.type = 5;
    localzza.zzgA = paramString;
    return localzza;
  }

  private static zzdd zzdp(String paramString)
  {
    try
    {
      zzdd localzzdd = zzdd.zzdn(paramString);
      return localzzdd;
    }
    catch (NumberFormatException localNumberFormatException)
    {
      zzbf.zzZ("Failed to convert '" + paramString + "' to a number.");
    }
    return zzaBo;
  }

  private static Long zzdq(String paramString)
  {
    zzdd localzzdd = zzdp(paramString);
    if (localzzdd == zzaBo)
      return zzaBm;
    return Long.valueOf(localzzdd.longValue());
  }

  private static Double zzdr(String paramString)
  {
    zzdd localzzdd = zzdp(paramString);
    if (localzzdd == zzaBo)
      return zzaBn;
    return Double.valueOf(localzzdd.doubleValue());
  }

  private static Boolean zzds(String paramString)
  {
    if ("true".equalsIgnoreCase(paramString))
      return Boolean.TRUE;
    if ("false".equalsIgnoreCase(paramString))
      return Boolean.FALSE;
    return zzaBq;
  }

  public static String zzg(zzd.zza paramzza)
  {
    return zzs(zzl(paramzza));
  }

  public static zzdd zzh(zzd.zza paramzza)
  {
    return zzt(zzl(paramzza));
  }

  public static Long zzi(zzd.zza paramzza)
  {
    return zzu(zzl(paramzza));
  }

  public static Double zzj(zzd.zza paramzza)
  {
    return zzv(zzl(paramzza));
  }

  public static Boolean zzk(zzd.zza paramzza)
  {
    return zzw(zzl(paramzza));
  }

  public static Object zzl(zzd.zza paramzza)
  {
    int i = 0;
    if (paramzza == null)
      return zzaBl;
    switch (paramzza.type)
    {
    default:
      zzbf.zzZ("Failed to convert a value of type: " + paramzza.type);
      return zzaBl;
    case 1:
      return paramzza.zzgv;
    case 2:
      ArrayList localArrayList = new ArrayList(paramzza.zzgw.length);
      zzd.zza[] arrayOfzza2 = paramzza.zzgw;
      int k = arrayOfzza2.length;
      while (i < k)
      {
        Object localObject3 = zzl(arrayOfzza2[i]);
        if (localObject3 == zzaBl)
          return zzaBl;
        localArrayList.add(localObject3);
        i++;
      }
      return localArrayList;
    case 3:
      if (paramzza.zzgx.length != paramzza.zzgy.length)
      {
        zzbf.zzZ("Converting an invalid value to object: " + paramzza.toString());
        return zzaBl;
      }
      HashMap localHashMap = new HashMap(paramzza.zzgy.length);
      while (i < paramzza.zzgx.length)
      {
        Object localObject1 = zzl(paramzza.zzgx[i]);
        Object localObject2 = zzl(paramzza.zzgy[i]);
        if ((localObject1 == zzaBl) || (localObject2 == zzaBl))
          return zzaBl;
        localHashMap.put(localObject1, localObject2);
        i++;
      }
      return localHashMap;
    case 4:
      zzbf.zzZ("Trying to convert a macro reference to object");
      return zzaBl;
    case 5:
      zzbf.zzZ("Trying to convert a function id to object");
      return zzaBl;
    case 6:
      return Long.valueOf(paramzza.zzgB);
    case 7:
      StringBuffer localStringBuffer = new StringBuffer();
      zzd.zza[] arrayOfzza1 = paramzza.zzgD;
      int j = arrayOfzza1.length;
      while (i < j)
      {
        String str = zzg(arrayOfzza1[i]);
        if (str == zzaBp)
          return zzaBl;
        localStringBuffer.append(str);
        i++;
      }
      return localStringBuffer.toString();
    case 8:
    }
    return Boolean.valueOf(paramzza.zzgC);
  }

  public static String zzs(Object paramObject)
  {
    if (paramObject == null)
      return zzaBp;
    return paramObject.toString();
  }

  public static zzdd zzt(Object paramObject)
  {
    if ((paramObject instanceof zzdd))
      return (zzdd)paramObject;
    if (zzz(paramObject))
      return zzdd.zzI(zzA(paramObject));
    if (zzy(paramObject))
      return zzdd.zza(Double.valueOf(getDouble(paramObject)));
    return zzdp(zzs(paramObject));
  }

  public static Object zztZ()
  {
    return zzaBl;
  }

  public static Long zzu(Object paramObject)
  {
    if (zzz(paramObject))
      return Long.valueOf(zzA(paramObject));
    return zzdq(zzs(paramObject));
  }

  public static Long zzua()
  {
    return zzaBm;
  }

  public static Double zzub()
  {
    return zzaBn;
  }

  public static Boolean zzuc()
  {
    return zzaBq;
  }

  public static zzdd zzud()
  {
    return zzaBo;
  }

  public static String zzue()
  {
    return zzaBp;
  }

  public static zzd.zza zzuf()
  {
    return zzaBt;
  }

  public static Double zzv(Object paramObject)
  {
    if (zzy(paramObject))
      return Double.valueOf(getDouble(paramObject));
    return zzdr(zzs(paramObject));
  }

  public static Boolean zzw(Object paramObject)
  {
    if ((paramObject instanceof Boolean))
      return (Boolean)paramObject;
    return zzds(zzs(paramObject));
  }

  public static zzd.zza zzx(Object paramObject)
  {
    boolean bool1 = false;
    zzd.zza localzza1 = new zzd.zza();
    if ((paramObject instanceof zzd.zza))
      return (zzd.zza)paramObject;
    if ((paramObject instanceof String))
    {
      localzza1.type = 1;
      localzza1.zzgv = ((String)paramObject);
    }
    while (true)
    {
      localzza1.zzgF = bool1;
      return localzza1;
      if ((paramObject instanceof List))
      {
        localzza1.type = 2;
        List localList = (List)paramObject;
        ArrayList localArrayList3 = new ArrayList(localList.size());
        Iterator localIterator2 = localList.iterator();
        boolean bool4 = false;
        if (localIterator2.hasNext())
        {
          zzd.zza localzza4 = zzx(localIterator2.next());
          if (localzza4 == zzaBt)
            return zzaBt;
          if ((bool4) || (localzza4.zzgF));
          for (boolean bool5 = true; ; bool5 = false)
          {
            localArrayList3.add(localzza4);
            bool4 = bool5;
            break;
          }
        }
        localzza1.zzgw = ((zzd.zza[])localArrayList3.toArray(new zzd.zza[0]));
        bool1 = bool4;
      }
      else if ((paramObject instanceof Map))
      {
        localzza1.type = 3;
        Set localSet = ((Map)paramObject).entrySet();
        ArrayList localArrayList1 = new ArrayList(localSet.size());
        ArrayList localArrayList2 = new ArrayList(localSet.size());
        Iterator localIterator1 = localSet.iterator();
        boolean bool2 = false;
        if (localIterator1.hasNext())
        {
          Map.Entry localEntry = (Map.Entry)localIterator1.next();
          zzd.zza localzza2 = zzx(localEntry.getKey());
          zzd.zza localzza3 = zzx(localEntry.getValue());
          if ((localzza2 == zzaBt) || (localzza3 == zzaBt))
            return zzaBt;
          if ((bool2) || (localzza2.zzgF) || (localzza3.zzgF));
          for (boolean bool3 = true; ; bool3 = false)
          {
            localArrayList1.add(localzza2);
            localArrayList2.add(localzza3);
            bool2 = bool3;
            break;
          }
        }
        localzza1.zzgx = ((zzd.zza[])localArrayList1.toArray(new zzd.zza[0]));
        localzza1.zzgy = ((zzd.zza[])localArrayList2.toArray(new zzd.zza[0]));
        bool1 = bool2;
      }
      else if (zzy(paramObject))
      {
        localzza1.type = 1;
        localzza1.zzgv = paramObject.toString();
        bool1 = false;
      }
      else if (zzz(paramObject))
      {
        localzza1.type = 6;
        localzza1.zzgB = zzA(paramObject);
        bool1 = false;
      }
      else
      {
        if (!(paramObject instanceof Boolean))
          break;
        localzza1.type = 8;
        localzza1.zzgC = ((Boolean)paramObject).booleanValue();
        bool1 = false;
      }
    }
    StringBuilder localStringBuilder = new StringBuilder().append("Converting to Value from unknown object type: ");
    if (paramObject == null);
    for (String str = "null"; ; str = paramObject.getClass().toString())
    {
      zzbf.zzZ(str);
      return zzaBt;
    }
  }

  private static boolean zzy(Object paramObject)
  {
    return ((paramObject instanceof Double)) || ((paramObject instanceof Float)) || (((paramObject instanceof zzdd)) && (((zzdd)paramObject).zztU()));
  }

  private static boolean zzz(Object paramObject)
  {
    return ((paramObject instanceof Byte)) || ((paramObject instanceof Short)) || ((paramObject instanceof Integer)) || ((paramObject instanceof Long)) || (((paramObject instanceof zzdd)) && (((zzdd)paramObject).zztV()));
  }
}