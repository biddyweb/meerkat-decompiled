package com.google.android.gms.drive.query.internal;

import android.os.Parcel;
import com.google.android.gms.drive.metadata.MetadataField;
import com.google.android.gms.drive.metadata.SearchableMetadataField;
import com.google.android.gms.drive.metadata.internal.MetadataBundle;

public class HasFilter<T> extends AbstractFilter
{
  public static final zzh CREATOR = new zzh();
  final int zzFG;
  final MetadataBundle zzWx;
  final MetadataField<T> zzWy;

  HasFilter(int paramInt, MetadataBundle paramMetadataBundle)
  {
    this.zzFG = paramInt;
    this.zzWx = paramMetadataBundle;
    this.zzWy = zze.zzb(paramMetadataBundle);
  }

  public HasFilter(SearchableMetadataField<T> paramSearchableMetadataField, T paramT)
  {
    this(1, MetadataBundle.zza(paramSearchableMetadataField, paramT));
  }

  public int describeContents()
  {
    return 0;
  }

  public T getValue()
  {
    return this.zzWx.zza(this.zzWy);
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzh.zza(this, paramParcel, paramInt);
  }

  public <F> F zza(zzf<F> paramzzf)
  {
    return paramzzf.zzd(this.zzWy, getValue());
  }
}