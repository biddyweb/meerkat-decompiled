package com.google.android.gms.internal;

import android.os.Bundle;
import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import com.google.android.gms.common.internal.zzx;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

public class zzlk extends zzld
  implements SafeParcelable
{
  public static final zzll CREATOR = new zzll();
  private final String mClassName;
  private final int zzFG;
  private final zzlh zzQX;
  private final Parcel zzRe;
  private final int zzRf;
  private int zzRg;
  private int zzRh;

  zzlk(int paramInt, Parcel paramParcel, zzlh paramzzlh)
  {
    this.zzFG = paramInt;
    this.zzRe = ((Parcel)zzx.zzl(paramParcel));
    this.zzRf = 2;
    this.zzQX = paramzzlh;
    if (this.zzQX == null);
    for (this.mClassName = null; ; this.mClassName = this.zzQX.zzjP())
    {
      this.zzRg = 2;
      return;
    }
  }

  private zzlk(SafeParcelable paramSafeParcelable, zzlh paramzzlh, String paramString)
  {
    this.zzFG = 1;
    this.zzRe = Parcel.obtain();
    paramSafeParcelable.writeToParcel(this.zzRe, 0);
    this.zzRf = 1;
    this.zzQX = ((zzlh)zzx.zzl(paramzzlh));
    this.mClassName = ((String)zzx.zzl(paramString));
    this.zzRg = 2;
  }

  private static HashMap<Integer, Map.Entry<String, zzld.zza<?, ?>>> zzF(Map<String, zzld.zza<?, ?>> paramMap)
  {
    HashMap localHashMap = new HashMap();
    Iterator localIterator = paramMap.entrySet().iterator();
    while (localIterator.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)localIterator.next();
      localHashMap.put(Integer.valueOf(((zzld.zza)localEntry.getValue()).zzjG()), localEntry);
    }
    return localHashMap;
  }

  public static <T extends zzld,  extends SafeParcelable> zzlk zza(T paramT)
  {
    String str = paramT.getClass().getCanonicalName();
    zzlh localzzlh = zzb(paramT);
    return new zzlk((SafeParcelable)paramT, localzzlh, str);
  }

  private static void zza(zzlh paramzzlh, zzld paramzzld)
  {
    Class localClass1 = paramzzld.getClass();
    if (!paramzzlh.zzb(localClass1))
    {
      Map localMap = paramzzld.zzjz();
      paramzzlh.zza(localClass1, localMap);
      Iterator localIterator = localMap.keySet().iterator();
      while (localIterator.hasNext())
      {
        zzld.zza localzza = (zzld.zza)localMap.get((String)localIterator.next());
        Class localClass2 = localzza.zzjH();
        if (localClass2 != null)
          try
          {
            zza(paramzzlh, (zzld)localClass2.newInstance());
          }
          catch (InstantiationException localInstantiationException)
          {
            throw new IllegalStateException("Could not instantiate an object of type " + localzza.zzjH().getCanonicalName(), localInstantiationException);
          }
          catch (IllegalAccessException localIllegalAccessException)
          {
            throw new IllegalStateException("Could not access object of type " + localzza.zzjH().getCanonicalName(), localIllegalAccessException);
          }
      }
    }
  }

  private void zza(StringBuilder paramStringBuilder, int paramInt, Object paramObject)
  {
    switch (paramInt)
    {
    default:
      throw new IllegalArgumentException("Unknown type = " + paramInt);
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
      paramStringBuilder.append(paramObject);
      return;
    case 7:
      paramStringBuilder.append("\"").append(zzma.zzbt(paramObject.toString())).append("\"");
      return;
    case 8:
      paramStringBuilder.append("\"").append(zzlt.zze((byte[])paramObject)).append("\"");
      return;
    case 9:
      paramStringBuilder.append("\"").append(zzlt.zzf((byte[])paramObject));
      paramStringBuilder.append("\"");
      return;
    case 10:
      zzmb.zza(paramStringBuilder, (HashMap)paramObject);
      return;
    case 11:
    }
    throw new IllegalArgumentException("Method does not accept concrete type.");
  }

  private void zza(StringBuilder paramStringBuilder, zzld.zza<?, ?> paramzza, Parcel paramParcel, int paramInt)
  {
    switch (paramzza.zzjy())
    {
    default:
      throw new IllegalArgumentException("Unknown field out type = " + paramzza.zzjy());
    case 0:
      zzb(paramStringBuilder, paramzza, zza(paramzza, Integer.valueOf(zza.zzg(paramParcel, paramInt))));
      return;
    case 1:
      zzb(paramStringBuilder, paramzza, zza(paramzza, zza.zzk(paramParcel, paramInt)));
      return;
    case 2:
      zzb(paramStringBuilder, paramzza, zza(paramzza, Long.valueOf(zza.zzi(paramParcel, paramInt))));
      return;
    case 3:
      zzb(paramStringBuilder, paramzza, zza(paramzza, Float.valueOf(zza.zzl(paramParcel, paramInt))));
      return;
    case 4:
      zzb(paramStringBuilder, paramzza, zza(paramzza, Double.valueOf(zza.zzm(paramParcel, paramInt))));
      return;
    case 5:
      zzb(paramStringBuilder, paramzza, zza(paramzza, zza.zzn(paramParcel, paramInt)));
      return;
    case 6:
      zzb(paramStringBuilder, paramzza, zza(paramzza, Boolean.valueOf(zza.zzc(paramParcel, paramInt))));
      return;
    case 7:
      zzb(paramStringBuilder, paramzza, zza(paramzza, zza.zzo(paramParcel, paramInt)));
      return;
    case 8:
    case 9:
      zzb(paramStringBuilder, paramzza, zza(paramzza, zza.zzr(paramParcel, paramInt)));
      return;
    case 10:
      zzb(paramStringBuilder, paramzza, zza(paramzza, zzk(zza.zzq(paramParcel, paramInt))));
      return;
    case 11:
    }
    throw new IllegalArgumentException("Method does not accept concrete type.");
  }

  private void zza(StringBuilder paramStringBuilder, String paramString, zzld.zza<?, ?> paramzza, Parcel paramParcel, int paramInt)
  {
    paramStringBuilder.append("\"").append(paramString).append("\":");
    if (paramzza.zzjJ())
    {
      zza(paramStringBuilder, paramzza, paramParcel, paramInt);
      return;
    }
    zzb(paramStringBuilder, paramzza, paramParcel, paramInt);
  }

  private void zza(StringBuilder paramStringBuilder, Map<String, zzld.zza<?, ?>> paramMap, Parcel paramParcel)
  {
    HashMap localHashMap = zzF(paramMap);
    paramStringBuilder.append('{');
    int i = zza.zzJ(paramParcel);
    int j = 0;
    while (paramParcel.dataPosition() < i)
    {
      int k = zza.zzI(paramParcel);
      Map.Entry localEntry = (Map.Entry)localHashMap.get(Integer.valueOf(zza.zzaP(k)));
      if (localEntry != null)
      {
        if (j != 0)
          paramStringBuilder.append(",");
        zza(paramStringBuilder, (String)localEntry.getKey(), (zzld.zza)localEntry.getValue(), paramParcel, k);
        j = 1;
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    paramStringBuilder.append('}');
  }

  private static zzlh zzb(zzld paramzzld)
  {
    zzlh localzzlh = new zzlh(paramzzld.getClass());
    zza(localzzlh, paramzzld);
    localzzlh.zzjN();
    localzzlh.zzjM();
    return localzzlh;
  }

  private void zzb(StringBuilder paramStringBuilder, zzld.zza<?, ?> paramzza, Parcel paramParcel, int paramInt)
  {
    if (paramzza.zzjE())
    {
      paramStringBuilder.append("[");
      switch (paramzza.zzjy())
      {
      default:
        throw new IllegalStateException("Unknown field type out.");
      case 0:
        zzls.zza(paramStringBuilder, zza.zzu(paramParcel, paramInt));
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
      case 6:
      case 7:
      case 8:
      case 9:
      case 10:
      case 11:
      }
      while (true)
      {
        paramStringBuilder.append("]");
        return;
        zzls.zza(paramStringBuilder, zza.zzw(paramParcel, paramInt));
        continue;
        zzls.zza(paramStringBuilder, zza.zzv(paramParcel, paramInt));
        continue;
        zzls.zza(paramStringBuilder, zza.zzx(paramParcel, paramInt));
        continue;
        zzls.zza(paramStringBuilder, zza.zzy(paramParcel, paramInt));
        continue;
        zzls.zza(paramStringBuilder, zza.zzz(paramParcel, paramInt));
        continue;
        zzls.zza(paramStringBuilder, zza.zzt(paramParcel, paramInt));
        continue;
        zzls.zza(paramStringBuilder, zza.zzA(paramParcel, paramInt));
        continue;
        throw new UnsupportedOperationException("List of type BASE64, BASE64_URL_SAFE, or STRING_MAP is not supported");
        Parcel[] arrayOfParcel = zza.zzE(paramParcel, paramInt);
        int j = arrayOfParcel.length;
        for (int k = 0; k < j; k++)
        {
          if (k > 0)
            paramStringBuilder.append(",");
          arrayOfParcel[k].setDataPosition(0);
          zza(paramStringBuilder, paramzza.zzjL(), arrayOfParcel[k]);
        }
      }
    }
    switch (paramzza.zzjy())
    {
    default:
      throw new IllegalStateException("Unknown field type out");
    case 0:
      paramStringBuilder.append(zza.zzg(paramParcel, paramInt));
      return;
    case 1:
      paramStringBuilder.append(zza.zzk(paramParcel, paramInt));
      return;
    case 2:
      paramStringBuilder.append(zza.zzi(paramParcel, paramInt));
      return;
    case 3:
      paramStringBuilder.append(zza.zzl(paramParcel, paramInt));
      return;
    case 4:
      paramStringBuilder.append(zza.zzm(paramParcel, paramInt));
      return;
    case 5:
      paramStringBuilder.append(zza.zzn(paramParcel, paramInt));
      return;
    case 6:
      paramStringBuilder.append(zza.zzc(paramParcel, paramInt));
      return;
    case 7:
      String str2 = zza.zzo(paramParcel, paramInt);
      paramStringBuilder.append("\"").append(zzma.zzbt(str2)).append("\"");
      return;
    case 8:
      byte[] arrayOfByte2 = zza.zzr(paramParcel, paramInt);
      paramStringBuilder.append("\"").append(zzlt.zze(arrayOfByte2)).append("\"");
      return;
    case 9:
      byte[] arrayOfByte1 = zza.zzr(paramParcel, paramInt);
      paramStringBuilder.append("\"").append(zzlt.zzf(arrayOfByte1));
      paramStringBuilder.append("\"");
      return;
    case 10:
      Bundle localBundle = zza.zzq(paramParcel, paramInt);
      Set localSet = localBundle.keySet();
      localSet.size();
      paramStringBuilder.append("{");
      Iterator localIterator = localSet.iterator();
      for (int i = 1; localIterator.hasNext(); i = 0)
      {
        String str1 = (String)localIterator.next();
        if (i == 0)
          paramStringBuilder.append(",");
        paramStringBuilder.append("\"").append(str1).append("\"");
        paramStringBuilder.append(":");
        paramStringBuilder.append("\"").append(zzma.zzbt(localBundle.getString(str1))).append("\"");
      }
      paramStringBuilder.append("}");
      return;
    case 11:
    }
    Parcel localParcel = zza.zzD(paramParcel, paramInt);
    localParcel.setDataPosition(0);
    zza(paramStringBuilder, paramzza.zzjL(), localParcel);
  }

  private void zzb(StringBuilder paramStringBuilder, zzld.zza<?, ?> paramzza, Object paramObject)
  {
    if (paramzza.zzjD())
    {
      zzb(paramStringBuilder, paramzza, (ArrayList)paramObject);
      return;
    }
    zza(paramStringBuilder, paramzza.zzjx(), paramObject);
  }

  private void zzb(StringBuilder paramStringBuilder, zzld.zza<?, ?> paramzza, ArrayList<?> paramArrayList)
  {
    paramStringBuilder.append("[");
    int i = paramArrayList.size();
    for (int j = 0; j < i; j++)
    {
      if (j != 0)
        paramStringBuilder.append(",");
      zza(paramStringBuilder, paramzza.zzjx(), paramArrayList.get(j));
    }
    paramStringBuilder.append("]");
  }

  public static HashMap<String, String> zzk(Bundle paramBundle)
  {
    HashMap localHashMap = new HashMap();
    Iterator localIterator = paramBundle.keySet().iterator();
    while (localIterator.hasNext())
    {
      String str = (String)localIterator.next();
      localHashMap.put(str, paramBundle.getString(str));
    }
    return localHashMap;
  }

  public int describeContents()
  {
    return 0;
  }

  public int getVersionCode()
  {
    return this.zzFG;
  }

  public String toString()
  {
    zzx.zzb(this.zzQX, "Cannot convert to JSON on client side.");
    Parcel localParcel = zzjR();
    localParcel.setDataPosition(0);
    StringBuilder localStringBuilder = new StringBuilder(100);
    zza(localStringBuilder, this.zzQX.zzbs(this.mClassName), localParcel);
    return localStringBuilder.toString();
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzll.zza(this, paramParcel, paramInt);
  }

  protected Object zzbo(String paramString)
  {
    throw new UnsupportedOperationException("Converting to JSON does not require this method.");
  }

  protected boolean zzbp(String paramString)
  {
    throw new UnsupportedOperationException("Converting to JSON does not require this method.");
  }

  public Parcel zzjR()
  {
    switch (this.zzRg)
    {
    default:
    case 0:
    case 1:
    }
    while (true)
    {
      return this.zzRe;
      this.zzRh = zzb.zzK(this.zzRe);
      zzb.zzH(this.zzRe, this.zzRh);
      this.zzRg = 2;
      continue;
      zzb.zzH(this.zzRe, this.zzRh);
      this.zzRg = 2;
    }
  }

  zzlh zzjS()
  {
    switch (this.zzRf)
    {
    default:
      throw new IllegalStateException("Invalid creation type: " + this.zzRf);
    case 0:
      return null;
    case 1:
      return this.zzQX;
    case 2:
    }
    return this.zzQX;
  }

  public Map<String, zzld.zza<?, ?>> zzjz()
  {
    if (this.zzQX == null)
      return null;
    return this.zzQX.zzbs(this.mClassName);
  }
}