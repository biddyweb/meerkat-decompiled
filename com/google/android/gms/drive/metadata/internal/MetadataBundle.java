package com.google.android.gms.drive.metadata.internal;

import android.content.Context;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.data.zza;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.drive.metadata.MetadataField;
import com.google.android.gms.internal.zzmi;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

public final class MetadataBundle
  implements SafeParcelable
{
  public static final Parcelable.Creator<MetadataBundle> CREATOR = new zzh();
  final int zzFG;
  final Bundle zzVq;

  MetadataBundle(int paramInt, Bundle paramBundle)
  {
    this.zzFG = paramInt;
    this.zzVq = ((Bundle)zzx.zzl(paramBundle));
    this.zzVq.setClassLoader(getClass().getClassLoader());
    ArrayList localArrayList = new ArrayList();
    Iterator localIterator1 = this.zzVq.keySet().iterator();
    while (localIterator1.hasNext())
    {
      String str2 = (String)localIterator1.next();
      if (zze.zzby(str2) == null)
      {
        localArrayList.add(str2);
        com.google.android.gms.drive.internal.zzw.zzr("MetadataBundle", "Ignored unknown metadata field in bundle: " + str2);
      }
    }
    Iterator localIterator2 = localArrayList.iterator();
    while (localIterator2.hasNext())
    {
      String str1 = (String)localIterator2.next();
      this.zzVq.remove(str1);
    }
  }

  private MetadataBundle(Bundle paramBundle)
  {
    this(1, paramBundle);
  }

  public static <T> MetadataBundle zza(MetadataField<T> paramMetadataField, T paramT)
  {
    MetadataBundle localMetadataBundle = zzkZ();
    localMetadataBundle.zzb(paramMetadataField, paramT);
    return localMetadataBundle;
  }

  public static MetadataBundle zza(MetadataBundle paramMetadataBundle)
  {
    return new MetadataBundle(new Bundle(paramMetadataBundle.zzVq));
  }

  public static MetadataBundle zzkZ()
  {
    return new MetadataBundle(new Bundle());
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject)
      return true;
    if (!(paramObject instanceof MetadataBundle))
      return false;
    MetadataBundle localMetadataBundle = (MetadataBundle)paramObject;
    Set localSet = this.zzVq.keySet();
    if (!localSet.equals(localMetadataBundle.zzVq.keySet()))
      return false;
    Iterator localIterator = localSet.iterator();
    while (localIterator.hasNext())
    {
      String str = (String)localIterator.next();
      if (!com.google.android.gms.common.internal.zzw.equal(this.zzVq.get(str), localMetadataBundle.zzVq.get(str)))
        return false;
    }
    return true;
  }

  public int hashCode()
  {
    Iterator localIterator = this.zzVq.keySet().iterator();
    String str;
    for (int i = 1; localIterator.hasNext(); i = i * 31 + this.zzVq.get(str).hashCode())
      str = (String)localIterator.next();
    return i;
  }

  public void setContext(Context paramContext)
  {
    zza localzza = (zza)zza(zzmi.zzVU);
    if (localzza != null)
      localzza.zza(paramContext.getCacheDir());
  }

  public String toString()
  {
    return "MetadataBundle [values=" + this.zzVq + "]";
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzh.zza(this, paramParcel, paramInt);
  }

  public <T> T zza(MetadataField<T> paramMetadataField)
  {
    return paramMetadataField.zza(this.zzVq);
  }

  public <T> void zzb(MetadataField<T> paramMetadataField, T paramT)
  {
    if (zze.zzby(paramMetadataField.getName()) == null)
      throw new IllegalArgumentException("Unregistered field: " + paramMetadataField.getName());
    paramMetadataField.zza(paramT, this.zzVq);
  }

  public boolean zzc(MetadataField<?> paramMetadataField)
  {
    return this.zzVq.containsKey(paramMetadataField.getName());
  }

  public Set<MetadataField<?>> zzla()
  {
    HashSet localHashSet = new HashSet();
    Iterator localIterator = this.zzVq.keySet().iterator();
    while (localIterator.hasNext())
      localHashSet.add(zze.zzby((String)localIterator.next()));
    return localHashSet;
  }
}