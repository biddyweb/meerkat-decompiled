package com.google.android.gms.internal;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

public final class zzla
  implements SafeParcelable, zzld.zzb<String, Integer>
{
  public static final zzlb CREATOR = new zzlb();
  private final int zzFG;
  private final HashMap<String, Integer> zzQK;
  private final HashMap<Integer, String> zzQL;
  private final ArrayList<zza> zzQM;

  public zzla()
  {
    this.zzFG = 1;
    this.zzQK = new HashMap();
    this.zzQL = new HashMap();
    this.zzQM = null;
  }

  zzla(int paramInt, ArrayList<zza> paramArrayList)
  {
    this.zzFG = paramInt;
    this.zzQK = new HashMap();
    this.zzQL = new HashMap();
    this.zzQM = null;
    zzb(paramArrayList);
  }

  private void zzb(ArrayList<zza> paramArrayList)
  {
    Iterator localIterator = paramArrayList.iterator();
    while (localIterator.hasNext())
    {
      zza localzza = (zza)localIterator.next();
      zzh(localzza.zzQN, localzza.zzQO);
    }
  }

  public int describeContents()
  {
    return 0;
  }

  int getVersionCode()
  {
    return this.zzFG;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzlb.zza(this, paramParcel, paramInt);
  }

  public String zzb(Integer paramInteger)
  {
    String str = (String)this.zzQL.get(paramInteger);
    if ((str == null) && (this.zzQK.containsKey("gms_unknown")))
      str = "gms_unknown";
    return str;
  }

  public zzla zzh(String paramString, int paramInt)
  {
    this.zzQK.put(paramString, Integer.valueOf(paramInt));
    this.zzQL.put(Integer.valueOf(paramInt), paramString);
    return this;
  }

  ArrayList<zza> zzjw()
  {
    ArrayList localArrayList = new ArrayList();
    Iterator localIterator = this.zzQK.keySet().iterator();
    while (localIterator.hasNext())
    {
      String str = (String)localIterator.next();
      localArrayList.add(new zza(str, ((Integer)this.zzQK.get(str)).intValue()));
    }
    return localArrayList;
  }

  public int zzjx()
  {
    return 7;
  }

  public int zzjy()
  {
    return 0;
  }

  public static final class zza
    implements SafeParcelable
  {
    public static final zzlc CREATOR = new zzlc();
    final int versionCode;
    final String zzQN;
    final int zzQO;

    zza(int paramInt1, String paramString, int paramInt2)
    {
      this.versionCode = paramInt1;
      this.zzQN = paramString;
      this.zzQO = paramInt2;
    }

    zza(String paramString, int paramInt)
    {
      this.versionCode = 1;
      this.zzQN = paramString;
      this.zzQO = paramInt;
    }

    public int describeContents()
    {
      return 0;
    }

    public void writeToParcel(Parcel paramParcel, int paramInt)
    {
      zzlc.zza(this, paramParcel, paramInt);
    }
  }
}