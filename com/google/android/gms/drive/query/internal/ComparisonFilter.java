package com.google.android.gms.drive.query.internal;

import android.os.Parcel;
import com.google.android.gms.drive.metadata.MetadataField;
import com.google.android.gms.drive.metadata.SearchableMetadataField;
import com.google.android.gms.drive.metadata.internal.MetadataBundle;

public class ComparisonFilter<T> extends AbstractFilter
{
  public static final zza CREATOR = new zza();
  final int zzFG;
  final Operator zzWw;
  final MetadataBundle zzWx;
  final MetadataField<T> zzWy;

  ComparisonFilter(int paramInt, Operator paramOperator, MetadataBundle paramMetadataBundle)
  {
    this.zzFG = paramInt;
    this.zzWw = paramOperator;
    this.zzWx = paramMetadataBundle;
    this.zzWy = zze.zzb(paramMetadataBundle);
  }

  public ComparisonFilter(Operator paramOperator, SearchableMetadataField<T> paramSearchableMetadataField, T paramT)
  {
    this(1, paramOperator, MetadataBundle.zza(paramSearchableMetadataField, paramT));
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
    zza.zza(this, paramParcel, paramInt);
  }

  public <F> F zza(zzf<F> paramzzf)
  {
    return paramzzf.zzb(this.zzWw, this.zzWy, getValue());
  }
}