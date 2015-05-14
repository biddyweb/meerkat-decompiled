package com.google.android.gms.internal;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzx;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

public class zzlh
  implements SafeParcelable
{
  public static final zzli CREATOR = new zzli();
  private final int zzFG;
  private final HashMap<String, Map<String, zzld.zza<?, ?>>> zzQZ;
  private final ArrayList<zza> zzRa;
  private final String zzRb;

  zzlh(int paramInt, ArrayList<zza> paramArrayList, String paramString)
  {
    this.zzFG = paramInt;
    this.zzRa = null;
    this.zzQZ = zzc(paramArrayList);
    this.zzRb = ((String)zzx.zzl(paramString));
    zzjM();
  }

  public zzlh(Class<? extends zzld> paramClass)
  {
    this.zzFG = 1;
    this.zzRa = null;
    this.zzQZ = new HashMap();
    this.zzRb = paramClass.getCanonicalName();
  }

  private static HashMap<String, Map<String, zzld.zza<?, ?>>> zzc(ArrayList<zza> paramArrayList)
  {
    HashMap localHashMap = new HashMap();
    int i = paramArrayList.size();
    for (int j = 0; j < i; j++)
    {
      zza localzza = (zza)paramArrayList.get(j);
      localHashMap.put(localzza.className, localzza.zzjQ());
    }
    return localHashMap;
  }

  public int describeContents()
  {
    return 0;
  }

  int getVersionCode()
  {
    return this.zzFG;
  }

  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    Iterator localIterator1 = this.zzQZ.keySet().iterator();
    while (localIterator1.hasNext())
    {
      String str1 = (String)localIterator1.next();
      localStringBuilder.append(str1).append(":\n");
      Map localMap = (Map)this.zzQZ.get(str1);
      Iterator localIterator2 = localMap.keySet().iterator();
      while (localIterator2.hasNext())
      {
        String str2 = (String)localIterator2.next();
        localStringBuilder.append("  ").append(str2).append(": ");
        localStringBuilder.append(localMap.get(str2));
      }
    }
    return localStringBuilder.toString();
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzli.zza(this, paramParcel, paramInt);
  }

  public void zza(Class<? extends zzld> paramClass, Map<String, zzld.zza<?, ?>> paramMap)
  {
    this.zzQZ.put(paramClass.getCanonicalName(), paramMap);
  }

  public boolean zzb(Class<? extends zzld> paramClass)
  {
    return this.zzQZ.containsKey(paramClass.getCanonicalName());
  }

  public Map<String, zzld.zza<?, ?>> zzbs(String paramString)
  {
    return (Map)this.zzQZ.get(paramString);
  }

  public void zzjM()
  {
    Iterator localIterator1 = this.zzQZ.keySet().iterator();
    while (localIterator1.hasNext())
    {
      String str = (String)localIterator1.next();
      Map localMap = (Map)this.zzQZ.get(str);
      Iterator localIterator2 = localMap.keySet().iterator();
      while (localIterator2.hasNext())
        ((zzld.zza)localMap.get((String)localIterator2.next())).zza(this);
    }
  }

  public void zzjN()
  {
    Iterator localIterator1 = this.zzQZ.keySet().iterator();
    while (localIterator1.hasNext())
    {
      String str1 = (String)localIterator1.next();
      Map localMap = (Map)this.zzQZ.get(str1);
      HashMap localHashMap = new HashMap();
      Iterator localIterator2 = localMap.keySet().iterator();
      while (localIterator2.hasNext())
      {
        String str2 = (String)localIterator2.next();
        localHashMap.put(str2, ((zzld.zza)localMap.get(str2)).zzjC());
      }
      this.zzQZ.put(str1, localHashMap);
    }
  }

  ArrayList<zza> zzjO()
  {
    ArrayList localArrayList = new ArrayList();
    Iterator localIterator = this.zzQZ.keySet().iterator();
    while (localIterator.hasNext())
    {
      String str = (String)localIterator.next();
      localArrayList.add(new zza(str, (Map)this.zzQZ.get(str)));
    }
    return localArrayList;
  }

  public String zzjP()
  {
    return this.zzRb;
  }

  public static class zza
    implements SafeParcelable
  {
    public static final zzlj CREATOR = new zzlj();
    final String className;
    final int versionCode;
    final ArrayList<zzlh.zzb> zzRc;

    zza(int paramInt, String paramString, ArrayList<zzlh.zzb> paramArrayList)
    {
      this.versionCode = paramInt;
      this.className = paramString;
      this.zzRc = paramArrayList;
    }

    zza(String paramString, Map<String, zzld.zza<?, ?>> paramMap)
    {
      this.versionCode = 1;
      this.className = paramString;
      this.zzRc = zzE(paramMap);
    }

    private static ArrayList<zzlh.zzb> zzE(Map<String, zzld.zza<?, ?>> paramMap)
    {
      if (paramMap == null)
        return null;
      ArrayList localArrayList = new ArrayList();
      Iterator localIterator = paramMap.keySet().iterator();
      while (localIterator.hasNext())
      {
        String str = (String)localIterator.next();
        localArrayList.add(new zzlh.zzb(str, (zzld.zza)paramMap.get(str)));
      }
      return localArrayList;
    }

    public int describeContents()
    {
      return 0;
    }

    public void writeToParcel(Parcel paramParcel, int paramInt)
    {
      zzlj.zza(this, paramParcel, paramInt);
    }

    HashMap<String, zzld.zza<?, ?>> zzjQ()
    {
      HashMap localHashMap = new HashMap();
      int i = this.zzRc.size();
      for (int j = 0; j < i; j++)
      {
        zzlh.zzb localzzb = (zzlh.zzb)this.zzRc.get(j);
        localHashMap.put(localzzb.zzfv, localzzb.zzRd);
      }
      return localHashMap;
    }
  }

  public static class zzb
    implements SafeParcelable
  {
    public static final zzlg CREATOR = new zzlg();
    final int versionCode;
    final zzld.zza<?, ?> zzRd;
    final String zzfv;

    zzb(int paramInt, String paramString, zzld.zza<?, ?> paramzza)
    {
      this.versionCode = paramInt;
      this.zzfv = paramString;
      this.zzRd = paramzza;
    }

    zzb(String paramString, zzld.zza<?, ?> paramzza)
    {
      this.versionCode = 1;
      this.zzfv = paramString;
      this.zzRd = paramzza;
    }

    public int describeContents()
    {
      return 0;
    }

    public void writeToParcel(Parcel paramParcel, int paramInt)
    {
      zzlg.zza(this, paramParcel, paramInt);
    }
  }
}