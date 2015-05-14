package com.google.android.gms.internal;

import android.os.Parcel;
import com.google.android.gms.plus.model.moments.ItemScope;
import com.google.android.gms.plus.model.moments.Moment;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

public final class zztt extends zzle
  implements Moment
{
  public static final zztu CREATOR = new zztu();
  private static final HashMap<String, zzld.zza<?, ?>> zzauW = new HashMap();
  String zzFA;
  final int zzFG;
  final Set<Integer> zzauX;
  String zzavK;
  zztr zzavS;
  zztr zzavT;
  String zzxV;

  static
  {
    zzauW.put("id", zzld.zza.zzl("id", 2));
    zzauW.put("result", zzld.zza.zza("result", 4, zztr.class));
    zzauW.put("startDate", zzld.zza.zzl("startDate", 5));
    zzauW.put("target", zzld.zza.zza("target", 6, zztr.class));
    zzauW.put("type", zzld.zza.zzl("type", 7));
  }

  public zztt()
  {
    this.zzFG = 1;
    this.zzauX = new HashSet();
  }

  zztt(Set<Integer> paramSet, int paramInt, String paramString1, zztr paramzztr1, String paramString2, zztr paramzztr2, String paramString3)
  {
    this.zzauX = paramSet;
    this.zzFG = paramInt;
    this.zzFA = paramString1;
    this.zzavS = paramzztr1;
    this.zzavK = paramString2;
    this.zzavT = paramzztr2;
    this.zzxV = paramString3;
  }

  public zztt(Set<Integer> paramSet, String paramString1, zztr paramzztr1, String paramString2, zztr paramzztr2, String paramString3)
  {
    this.zzauX = paramSet;
    this.zzFG = 1;
    this.zzFA = paramString1;
    this.zzavS = paramzztr1;
    this.zzavK = paramString2;
    this.zzavT = paramzztr2;
    this.zzxV = paramString3;
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    if (!(paramObject instanceof zztt))
      return false;
    if (this == paramObject)
      return true;
    zztt localzztt = (zztt)paramObject;
    Iterator localIterator = zzauW.values().iterator();
    while (localIterator.hasNext())
    {
      zzld.zza localzza = (zzld.zza)localIterator.next();
      if (zza(localzza))
      {
        if (localzztt.zza(localzza))
        {
          if (!zzb(localzza).equals(localzztt.zzb(localzza)))
            return false;
        }
        else
          return false;
      }
      else if (localzztt.zza(localzza))
        return false;
    }
    return true;
  }

  public String getId()
  {
    return this.zzFA;
  }

  public ItemScope getResult()
  {
    return this.zzavS;
  }

  public String getStartDate()
  {
    return this.zzavK;
  }

  public ItemScope getTarget()
  {
    return this.zzavT;
  }

  public String getType()
  {
    return this.zzxV;
  }

  public boolean hasId()
  {
    return this.zzauX.contains(Integer.valueOf(2));
  }

  public boolean hasResult()
  {
    return this.zzauX.contains(Integer.valueOf(4));
  }

  public boolean hasStartDate()
  {
    return this.zzauX.contains(Integer.valueOf(5));
  }

  public boolean hasTarget()
  {
    return this.zzauX.contains(Integer.valueOf(6));
  }

  public boolean hasType()
  {
    return this.zzauX.contains(Integer.valueOf(7));
  }

  public int hashCode()
  {
    Iterator localIterator = zzauW.values().iterator();
    int i = 0;
    zzld.zza localzza;
    if (localIterator.hasNext())
    {
      localzza = (zzld.zza)localIterator.next();
      if (!zza(localzza))
        break label66;
    }
    label66: for (int j = i + localzza.zzjG() + zzb(localzza).hashCode(); ; j = i)
    {
      i = j;
      break;
      return i;
    }
  }

  public boolean isDataValid()
  {
    return true;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zztu.zza(this, paramParcel, paramInt);
  }

  protected boolean zza(zzld.zza paramzza)
  {
    return this.zzauX.contains(Integer.valueOf(paramzza.zzjG()));
  }

  protected Object zzb(zzld.zza paramzza)
  {
    switch (paramzza.zzjG())
    {
    case 3:
    default:
      throw new IllegalStateException("Unknown safe parcelable id=" + paramzza.zzjG());
    case 2:
      return this.zzFA;
    case 4:
      return this.zzavS;
    case 5:
      return this.zzavK;
    case 6:
      return this.zzavT;
    case 7:
    }
    return this.zzxV;
  }

  public HashMap<String, zzld.zza<?, ?>> zzsb()
  {
    return zzauW;
  }

  public zztt zzsd()
  {
    return this;
  }
}