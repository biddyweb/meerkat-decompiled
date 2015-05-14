package com.google.android.gms.drive.query.internal;

import android.os.Parcel;

public class FullTextSearchFilter extends AbstractFilter
{
  public static final zzg CREATOR = new zzg();
  final String mValue;
  final int zzFG;

  FullTextSearchFilter(int paramInt, String paramString)
  {
    this.zzFG = paramInt;
    this.mValue = paramString;
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzg.zza(this, paramParcel, paramInt);
  }

  public <F> F zza(zzf<F> paramzzf)
  {
    return paramzzf.zzbE(this.mValue);
  }
}