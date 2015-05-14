package com.google.android.gms.drive.query.internal;

import android.os.Parcel;
import com.google.android.gms.drive.metadata.SearchableCollectionMetadataField;
import com.google.android.gms.drive.metadata.internal.MetadataBundle;
import com.google.android.gms.drive.metadata.zzb;
import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;

public class InFilter<T> extends AbstractFilter
{
  public static final zzi CREATOR = new zzi();
  final int zzFG;
  private final zzb<T> zzWJ;
  final MetadataBundle zzWx;

  InFilter(int paramInt, MetadataBundle paramMetadataBundle)
  {
    this.zzFG = paramInt;
    this.zzWx = paramMetadataBundle;
    this.zzWJ = ((zzb)zze.zzb(paramMetadataBundle));
  }

  public InFilter(SearchableCollectionMetadataField<T> paramSearchableCollectionMetadataField, T paramT)
  {
    this(1, MetadataBundle.zza(paramSearchableCollectionMetadataField, Collections.singleton(paramT)));
  }

  public int describeContents()
  {
    return 0;
  }

  public T getValue()
  {
    return ((Collection)this.zzWx.zza(this.zzWJ)).iterator().next();
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzi.zza(this, paramParcel, paramInt);
  }

  public <F> F zza(zzf<F> paramzzf)
  {
    return paramzzf.zzb(this.zzWJ, getValue());
  }
}