package com.google.android.gms.drive.query.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.drive.query.Filter;

public class NotFilter extends AbstractFilter
{
  public static final Parcelable.Creator<NotFilter> CREATOR = new zzl();
  final int zzFG;
  final FilterHolder zzWL;

  NotFilter(int paramInt, FilterHolder paramFilterHolder)
  {
    this.zzFG = paramInt;
    this.zzWL = paramFilterHolder;
  }

  public NotFilter(Filter paramFilter)
  {
    this(1, new FilterHolder(paramFilter));
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzl.zza(this, paramParcel, paramInt);
  }

  public <T> T zza(zzf<T> paramzzf)
  {
    return paramzzf.zzm(this.zzWL.getFilter().zza(paramzzf));
  }
}