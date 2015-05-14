package com.google.android.gms.drive.query.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.drive.query.Filter;

public class FilterHolder
  implements SafeParcelable
{
  public static final Parcelable.Creator<FilterHolder> CREATOR = new zzd();
  final int zzFG;
  final ComparisonFilter<?> zzWA;
  final FieldOnlyFilter zzWB;
  final LogicalFilter zzWC;
  final NotFilter zzWD;
  final InFilter<?> zzWE;
  final MatchAllFilter zzWF;
  final HasFilter zzWG;
  final FullTextSearchFilter zzWH;
  private final Filter zzWI;

  FilterHolder(int paramInt, ComparisonFilter<?> paramComparisonFilter, FieldOnlyFilter paramFieldOnlyFilter, LogicalFilter paramLogicalFilter, NotFilter paramNotFilter, InFilter<?> paramInFilter, MatchAllFilter paramMatchAllFilter, HasFilter<?> paramHasFilter, FullTextSearchFilter paramFullTextSearchFilter)
  {
    this.zzFG = paramInt;
    this.zzWA = paramComparisonFilter;
    this.zzWB = paramFieldOnlyFilter;
    this.zzWC = paramLogicalFilter;
    this.zzWD = paramNotFilter;
    this.zzWE = paramInFilter;
    this.zzWF = paramMatchAllFilter;
    this.zzWG = paramHasFilter;
    this.zzWH = paramFullTextSearchFilter;
    if (this.zzWA != null)
    {
      this.zzWI = this.zzWA;
      return;
    }
    if (this.zzWB != null)
    {
      this.zzWI = this.zzWB;
      return;
    }
    if (this.zzWC != null)
    {
      this.zzWI = this.zzWC;
      return;
    }
    if (this.zzWD != null)
    {
      this.zzWI = this.zzWD;
      return;
    }
    if (this.zzWE != null)
    {
      this.zzWI = this.zzWE;
      return;
    }
    if (this.zzWF != null)
    {
      this.zzWI = this.zzWF;
      return;
    }
    if (this.zzWG != null)
    {
      this.zzWI = this.zzWG;
      return;
    }
    if (this.zzWH != null)
    {
      this.zzWI = this.zzWH;
      return;
    }
    throw new IllegalArgumentException("At least one filter must be set.");
  }

  public FilterHolder(Filter paramFilter)
  {
    zzx.zzb(paramFilter, "Null filter.");
    this.zzFG = 2;
    ComparisonFilter localComparisonFilter;
    FieldOnlyFilter localFieldOnlyFilter;
    label46: LogicalFilter localLogicalFilter;
    label65: NotFilter localNotFilter;
    label84: InFilter localInFilter;
    label103: MatchAllFilter localMatchAllFilter;
    label122: HasFilter localHasFilter;
    if ((paramFilter instanceof ComparisonFilter))
    {
      localComparisonFilter = (ComparisonFilter)paramFilter;
      this.zzWA = localComparisonFilter;
      if (!(paramFilter instanceof FieldOnlyFilter))
        break label237;
      localFieldOnlyFilter = (FieldOnlyFilter)paramFilter;
      this.zzWB = localFieldOnlyFilter;
      if (!(paramFilter instanceof LogicalFilter))
        break label243;
      localLogicalFilter = (LogicalFilter)paramFilter;
      this.zzWC = localLogicalFilter;
      if (!(paramFilter instanceof NotFilter))
        break label249;
      localNotFilter = (NotFilter)paramFilter;
      this.zzWD = localNotFilter;
      if (!(paramFilter instanceof InFilter))
        break label255;
      localInFilter = (InFilter)paramFilter;
      this.zzWE = localInFilter;
      if (!(paramFilter instanceof MatchAllFilter))
        break label261;
      localMatchAllFilter = (MatchAllFilter)paramFilter;
      this.zzWF = localMatchAllFilter;
      if (!(paramFilter instanceof HasFilter))
        break label267;
      localHasFilter = (HasFilter)paramFilter;
      label141: this.zzWG = localHasFilter;
      if (!(paramFilter instanceof FullTextSearchFilter))
        break label273;
    }
    label261: label267: label273: for (FullTextSearchFilter localFullTextSearchFilter = (FullTextSearchFilter)paramFilter; ; localFullTextSearchFilter = null)
    {
      this.zzWH = localFullTextSearchFilter;
      if ((this.zzWA != null) || (this.zzWB != null) || (this.zzWC != null) || (this.zzWD != null) || (this.zzWE != null) || (this.zzWF != null) || (this.zzWG != null) || (this.zzWH != null))
        break label279;
      throw new IllegalArgumentException("Invalid filter type.");
      localComparisonFilter = null;
      break;
      label237: localFieldOnlyFilter = null;
      break label46;
      label243: localLogicalFilter = null;
      break label65;
      label249: localNotFilter = null;
      break label84;
      label255: localInFilter = null;
      break label103;
      localMatchAllFilter = null;
      break label122;
      localHasFilter = null;
      break label141;
    }
    label279: this.zzWI = paramFilter;
  }

  public int describeContents()
  {
    return 0;
  }

  public Filter getFilter()
  {
    return this.zzWI;
  }

  public String toString()
  {
    Object[] arrayOfObject = new Object[1];
    arrayOfObject[0] = this.zzWI;
    return String.format("FilterHolder[%s]", arrayOfObject);
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzd.zza(this, paramParcel, paramInt);
  }
}