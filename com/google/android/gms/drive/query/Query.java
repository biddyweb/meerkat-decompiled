package com.google.android.gms.drive.query;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.drive.DriveSpace;
import com.google.android.gms.drive.query.internal.LogicalFilter;
import com.google.android.gms.drive.query.internal.MatchAllFilter;
import com.google.android.gms.drive.query.internal.Operator;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Set;

public class Query
  implements SafeParcelable
{
  public static final Parcelable.Creator<Query> CREATOR = new zza();
  final int zzFG;
  final List<DriveSpace> zzUx;
  private final Set<DriveSpace> zzUy;
  final LogicalFilter zzWm;
  final String zzWn;
  final SortOrder zzWo;
  final List<String> zzWp;
  final boolean zzWq;

  Query(int paramInt, LogicalFilter paramLogicalFilter, String paramString, SortOrder paramSortOrder, List<String> paramList, boolean paramBoolean, List<DriveSpace> paramList1)
  {
  }

  private Query(int paramInt, LogicalFilter paramLogicalFilter, String paramString, SortOrder paramSortOrder, List<String> paramList, boolean paramBoolean, List<DriveSpace> paramList1, Set<DriveSpace> paramSet)
  {
    this.zzFG = paramInt;
    this.zzWm = paramLogicalFilter;
    this.zzWn = paramString;
    this.zzWo = paramSortOrder;
    this.zzWp = paramList;
    this.zzWq = paramBoolean;
    this.zzUx = paramList1;
    this.zzUy = paramSet;
  }

  private Query(LogicalFilter paramLogicalFilter, String paramString, SortOrder paramSortOrder, List<String> paramList, boolean paramBoolean, Set<DriveSpace> paramSet)
  {
  }

  public int describeContents()
  {
    return 0;
  }

  public Filter getFilter()
  {
    return this.zzWm;
  }

  @Deprecated
  public String getPageToken()
  {
    return this.zzWn;
  }

  public SortOrder getSortOrder()
  {
    return this.zzWo;
  }

  public String toString()
  {
    Locale localLocale = Locale.US;
    Object[] arrayOfObject = new Object[4];
    arrayOfObject[0] = this.zzWm;
    arrayOfObject[1] = this.zzWo;
    arrayOfObject[2] = this.zzWn;
    arrayOfObject[3] = this.zzUx;
    return String.format(localLocale, "Query[%s,%s,PageToken=%s,Spaces=%s]", arrayOfObject);
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zza.zza(this, paramParcel, paramInt);
  }

  public List<String> zzlb()
  {
    return this.zzWp;
  }

  public boolean zzlc()
  {
    return this.zzWq;
  }

  public Set<DriveSpace> zzld()
  {
    return this.zzUy;
  }

  public static class Builder
  {
    private Set<DriveSpace> zzUy;
    private String zzWn;
    private SortOrder zzWo;
    private List<String> zzWp;
    private boolean zzWq;
    private final List<Filter> zzWr = new ArrayList();

    public Builder()
    {
    }

    public Builder(Query paramQuery)
    {
      this.zzWr.add(paramQuery.getFilter());
      this.zzWn = paramQuery.getPageToken();
      this.zzWo = paramQuery.getSortOrder();
      this.zzWp = paramQuery.zzlb();
      this.zzWq = paramQuery.zzlc();
      this.zzUy = paramQuery.zzld();
    }

    public Builder addFilter(Filter paramFilter)
    {
      if (!(paramFilter instanceof MatchAllFilter))
        this.zzWr.add(paramFilter);
      return this;
    }

    public Query build()
    {
      return new Query(new LogicalFilter(Operator.zzWR, this.zzWr), this.zzWn, this.zzWo, this.zzWp, this.zzWq, this.zzUy, null);
    }

    @Deprecated
    public Builder setPageToken(String paramString)
    {
      this.zzWn = paramString;
      return this;
    }

    public Builder setSortOrder(SortOrder paramSortOrder)
    {
      this.zzWo = paramSortOrder;
      return this;
    }
  }
}