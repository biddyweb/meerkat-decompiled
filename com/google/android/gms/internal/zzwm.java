package com.google.android.gms.internal;

import com.google.android.gms.wearable.Asset;
import com.google.android.gms.wearable.DataMap;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

public final class zzwm
{
  private static int zza(String paramString, zzwn.zza.zza[] paramArrayOfzza)
  {
    int i = paramArrayOfzza.length;
    int j = 0;
    int k = 14;
    if (j < i)
    {
      zzwn.zza.zza localzza = paramArrayOfzza[j];
      if (k == 14)
        if ((localzza.type == 9) || (localzza.type == 2) || (localzza.type == 6))
          k = localzza.type;
      while (localzza.type == k)
      {
        do
        {
          j++;
          break;
        }
        while (localzza.type == 14);
        throw new IllegalArgumentException("Unexpected TypedValue type: " + localzza.type + " for key " + paramString);
      }
      throw new IllegalArgumentException("The ArrayList elements should all be the same type, but ArrayList with key " + paramString + " contains items of type " + k + " and " + localzza.type);
    }
    return k;
  }

  static int zza(List<Asset> paramList, Asset paramAsset)
  {
    paramList.add(paramAsset);
    return -1 + paramList.size();
  }

  public static zza zza(DataMap paramDataMap)
  {
    zzwn localzzwn = new zzwn();
    ArrayList localArrayList = new ArrayList();
    localzzwn.zzaGS = zza(paramDataMap, localArrayList);
    return new zza(localzzwn, localArrayList);
  }

  private static zzwn.zza.zza zza(List<Asset> paramList, Object paramObject)
  {
    zzwn.zza.zza localzza1 = new zzwn.zza.zza();
    if (paramObject == null)
    {
      localzza1.type = 14;
      return localzza1;
    }
    localzza1.zzaGW = new zzwn.zza.zza.zza();
    if ((paramObject instanceof String))
    {
      localzza1.type = 2;
      localzza1.zzaGW.zzaGY = ((String)paramObject);
    }
    while (true)
    {
      return localzza1;
      if ((paramObject instanceof Integer))
      {
        localzza1.type = 6;
        localzza1.zzaGW.zzaHc = ((Integer)paramObject).intValue();
      }
      else if ((paramObject instanceof Long))
      {
        localzza1.type = 5;
        localzza1.zzaGW.zzaHb = ((Long)paramObject).longValue();
      }
      else if ((paramObject instanceof Double))
      {
        localzza1.type = 3;
        localzza1.zzaGW.zzaGZ = ((Double)paramObject).doubleValue();
      }
      else if ((paramObject instanceof Float))
      {
        localzza1.type = 4;
        localzza1.zzaGW.zzaHa = ((Float)paramObject).floatValue();
      }
      else if ((paramObject instanceof Boolean))
      {
        localzza1.type = 8;
        localzza1.zzaGW.zzaHe = ((Boolean)paramObject).booleanValue();
      }
      else if ((paramObject instanceof Byte))
      {
        localzza1.type = 7;
        localzza1.zzaGW.zzaHd = ((Byte)paramObject).byteValue();
      }
      else if ((paramObject instanceof byte[]))
      {
        localzza1.type = 1;
        localzza1.zzaGW.zzaGX = ((byte[])paramObject);
      }
      else if ((paramObject instanceof String[]))
      {
        localzza1.type = 11;
        localzza1.zzaGW.zzaHh = ((String[])paramObject);
      }
      else if ((paramObject instanceof long[]))
      {
        localzza1.type = 12;
        localzza1.zzaGW.zzaHi = ((long[])paramObject);
      }
      else if ((paramObject instanceof float[]))
      {
        localzza1.type = 15;
        localzza1.zzaGW.zzaHj = ((float[])paramObject);
      }
      else if ((paramObject instanceof Asset))
      {
        localzza1.type = 13;
        localzza1.zzaGW.zzaHk = zza(paramList, (Asset)paramObject);
      }
      else
      {
        if (!(paramObject instanceof DataMap))
          break;
        localzza1.type = 9;
        DataMap localDataMap = (DataMap)paramObject;
        Set localSet = localDataMap.keySet();
        zzwn.zza[] arrayOfzza1 = new zzwn.zza[localSet.size()];
        Iterator localIterator = localSet.iterator();
        for (int n = 0; localIterator.hasNext(); n++)
        {
          String str = (String)localIterator.next();
          arrayOfzza1[n] = new zzwn.zza();
          arrayOfzza1[n].name = str;
          arrayOfzza1[n].zzaGU = zza(paramList, localDataMap.get(str));
        }
        localzza1.zzaGW.zzaHf = arrayOfzza1;
      }
    }
    zzwn.zza.zza[] arrayOfzza;
    Object localObject1;
    int j;
    int k;
    label558: Object localObject2;
    zzwn.zza.zza localzza2;
    if ((paramObject instanceof ArrayList))
    {
      localzza1.type = 10;
      ArrayList localArrayList = (ArrayList)paramObject;
      arrayOfzza = new zzwn.zza.zza[localArrayList.size()];
      localObject1 = null;
      int i = localArrayList.size();
      j = 0;
      k = 14;
      if (j < i)
      {
        localObject2 = localArrayList.get(j);
        localzza2 = zza(paramList, localObject2);
        if ((localzza2.type != 14) && (localzza2.type != 2) && (localzza2.type != 6) && (localzza2.type != 9))
          throw new IllegalArgumentException("The only ArrayList element types supported by DataBundleUtil are String, Integer, Bundle, and null, but this ArrayList contains a " + localObject2.getClass());
        if ((k != 14) || (localzza2.type == 14));
      }
    }
    for (int m = localzza2.type; ; m = k)
    {
      arrayOfzza[j] = localzza2;
      j++;
      k = m;
      localObject1 = localObject2;
      break label558;
      if (localzza2.type != k)
      {
        throw new IllegalArgumentException("ArrayList elements must all be of the sameclass, but this one contains a " + localObject1.getClass() + " and a " + localObject2.getClass());
        localzza1.zzaGW.zzaHg = arrayOfzza;
        break;
        throw new RuntimeException("newFieldValueFromValue: unexpected value " + paramObject.getClass().getSimpleName());
      }
      localObject2 = localObject1;
    }
  }

  public static DataMap zza(zza paramzza)
  {
    DataMap localDataMap = new DataMap();
    for (zzwn.zza localzza : paramzza.zzaGQ.zzaGS)
      zza(paramzza.zzaGR, localDataMap, localzza.name, localzza.zzaGU);
    return localDataMap;
  }

  private static ArrayList zza(List<Asset> paramList, zzwn.zza.zza.zza paramzza, int paramInt)
  {
    ArrayList localArrayList = new ArrayList(paramzza.zzaHg.length);
    zzwn.zza.zza[] arrayOfzza = paramzza.zzaHg;
    int i = arrayOfzza.length;
    int j = 0;
    if (j < i)
    {
      zzwn.zza.zza localzza = arrayOfzza[j];
      if (localzza.type == 14)
        localArrayList.add(null);
      while (true)
      {
        j++;
        break;
        if (paramInt == 9)
        {
          DataMap localDataMap = new DataMap();
          for (zzwn.zza localzza1 : localzza.zzaGW.zzaHf)
            zza(paramList, localDataMap, localzza1.name, localzza1.zzaGU);
          localArrayList.add(localDataMap);
        }
        else if (paramInt == 2)
        {
          localArrayList.add(localzza.zzaGW.zzaGY);
        }
        else
        {
          if (paramInt != 6)
            break label188;
          localArrayList.add(Integer.valueOf(localzza.zzaGW.zzaHc));
        }
      }
      label188: throw new IllegalArgumentException("Unexpected typeOfArrayList: " + paramInt);
    }
    return localArrayList;
  }

  private static void zza(List<Asset> paramList, DataMap paramDataMap, String paramString, zzwn.zza.zza paramzza)
  {
    int i = paramzza.type;
    if (i == 14)
    {
      paramDataMap.putString(paramString, null);
      return;
    }
    zzwn.zza.zza.zza localzza = paramzza.zzaGW;
    if (i == 1)
    {
      paramDataMap.putByteArray(paramString, localzza.zzaGX);
      return;
    }
    if (i == 11)
    {
      paramDataMap.putStringArray(paramString, localzza.zzaHh);
      return;
    }
    if (i == 12)
    {
      paramDataMap.putLongArray(paramString, localzza.zzaHi);
      return;
    }
    if (i == 15)
    {
      paramDataMap.putFloatArray(paramString, localzza.zzaHj);
      return;
    }
    if (i == 2)
    {
      paramDataMap.putString(paramString, localzza.zzaGY);
      return;
    }
    if (i == 3)
    {
      paramDataMap.putDouble(paramString, localzza.zzaGZ);
      return;
    }
    if (i == 4)
    {
      paramDataMap.putFloat(paramString, localzza.zzaHa);
      return;
    }
    if (i == 5)
    {
      paramDataMap.putLong(paramString, localzza.zzaHb);
      return;
    }
    if (i == 6)
    {
      paramDataMap.putInt(paramString, localzza.zzaHc);
      return;
    }
    if (i == 7)
    {
      paramDataMap.putByte(paramString, (byte)localzza.zzaHd);
      return;
    }
    if (i == 8)
    {
      paramDataMap.putBoolean(paramString, localzza.zzaHe);
      return;
    }
    if (i == 13)
    {
      if (paramList == null)
        throw new RuntimeException("populateBundle: unexpected type for: " + paramString);
      paramDataMap.putAsset(paramString, (Asset)paramList.get((int)localzza.zzaHk));
      return;
    }
    if (i == 9)
    {
      DataMap localDataMap = new DataMap();
      for (zzwn.zza localzza1 : localzza.zzaHf)
        zza(paramList, localDataMap, localzza1.name, localzza1.zzaGU);
      paramDataMap.putDataMap(paramString, localDataMap);
      return;
    }
    if (i == 10)
    {
      int m = zza(paramString, localzza.zzaHg);
      ArrayList localArrayList = zza(paramList, localzza, m);
      if (m == 14)
      {
        paramDataMap.putStringArrayList(paramString, localArrayList);
        return;
      }
      if (m == 9)
      {
        paramDataMap.putDataMapArrayList(paramString, localArrayList);
        return;
      }
      if (m == 2)
      {
        paramDataMap.putStringArrayList(paramString, localArrayList);
        return;
      }
      if (m == 6)
      {
        paramDataMap.putIntegerArrayList(paramString, localArrayList);
        return;
      }
      throw new IllegalStateException("Unexpected typeOfArrayList: " + m);
    }
    throw new RuntimeException("populateBundle: unexpected type " + i);
  }

  private static zzwn.zza[] zza(DataMap paramDataMap, List<Asset> paramList)
  {
    Set localSet = paramDataMap.keySet();
    zzwn.zza[] arrayOfzza = new zzwn.zza[localSet.size()];
    Iterator localIterator = localSet.iterator();
    for (int i = 0; localIterator.hasNext(); i++)
    {
      String str = (String)localIterator.next();
      Object localObject = paramDataMap.get(str);
      arrayOfzza[i] = new zzwn.zza();
      arrayOfzza[i].name = str;
      arrayOfzza[i].zzaGU = zza(paramList, localObject);
    }
    return arrayOfzza;
  }

  public static class zza
  {
    public final zzwn zzaGQ;
    public final List<Asset> zzaGR;

    public zza(zzwn paramzzwn, List<Asset> paramList)
    {
      this.zzaGQ = paramzzwn;
      this.zzaGR = paramList;
    }
  }
}