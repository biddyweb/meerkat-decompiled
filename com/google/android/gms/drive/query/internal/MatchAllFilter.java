package com.google.android.gms.drive.query.internal;

import android.os.Parcel;

public class MatchAllFilter extends AbstractFilter
{
  public static final zzk CREATOR = new zzk();
  final int zzFG;

  public MatchAllFilter()
  {
    this(1);
  }

  MatchAllFilter(int paramInt)
  {
    this.zzFG = paramInt;
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzk.zza(this, paramParcel, paramInt);
  }

  public <F> F zza(zzf<F> paramzzf)
  {
    return paramzzf.zzlf();
  }
}