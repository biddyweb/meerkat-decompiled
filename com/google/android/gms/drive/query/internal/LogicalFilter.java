package com.google.android.gms.drive.query.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.drive.query.Filter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class LogicalFilter extends AbstractFilter
{
  public static final Parcelable.Creator<LogicalFilter> CREATOR = new zzj();
  final int zzFG;
  final List<FilterHolder> zzWK;
  private List<Filter> zzWr;
  final Operator zzWw;

  LogicalFilter(int paramInt, Operator paramOperator, List<FilterHolder> paramList)
  {
    this.zzFG = paramInt;
    this.zzWw = paramOperator;
    this.zzWK = paramList;
  }

  public LogicalFilter(Operator paramOperator, Filter paramFilter, Filter[] paramArrayOfFilter)
  {
    this.zzFG = 1;
    this.zzWw = paramOperator;
    this.zzWK = new ArrayList(1 + paramArrayOfFilter.length);
    this.zzWK.add(new FilterHolder(paramFilter));
    this.zzWr = new ArrayList(1 + paramArrayOfFilter.length);
    this.zzWr.add(paramFilter);
    int i = paramArrayOfFilter.length;
    for (int j = 0; j < i; j++)
    {
      Filter localFilter = paramArrayOfFilter[j];
      this.zzWK.add(new FilterHolder(localFilter));
      this.zzWr.add(localFilter);
    }
  }

  public LogicalFilter(Operator paramOperator, Iterable<Filter> paramIterable)
  {
    this.zzFG = 1;
    this.zzWw = paramOperator;
    this.zzWr = new ArrayList();
    this.zzWK = new ArrayList();
    Iterator localIterator = paramIterable.iterator();
    while (localIterator.hasNext())
    {
      Filter localFilter = (Filter)localIterator.next();
      this.zzWr.add(localFilter);
      this.zzWK.add(new FilterHolder(localFilter));
    }
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzj.zza(this, paramParcel, paramInt);
  }

  public <T> T zza(zzf<T> paramzzf)
  {
    ArrayList localArrayList = new ArrayList();
    Iterator localIterator = this.zzWK.iterator();
    while (localIterator.hasNext())
      localArrayList.add(((FilterHolder)localIterator.next()).getFilter().zza(paramzzf));
    return paramzzf.zzb(this.zzWw, localArrayList);
  }
}