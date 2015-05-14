package com.google.android.gms.location.places;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzw.zza;
import java.util.concurrent.TimeUnit;

public final class zzf
  implements SafeParcelable
{
  public static final zzg CREATOR = new zzg();
  static final long zzanO = TimeUnit.HOURS.toMillis(1L);
  private final int mPriority;
  final int zzFG;
  private final long zzalO;
  private final long zzamf;
  private final PlaceFilter zzanP;

  public zzf(int paramInt1, PlaceFilter paramPlaceFilter, long paramLong1, int paramInt2, long paramLong2)
  {
    this.zzFG = paramInt1;
    this.zzanP = paramPlaceFilter;
    this.zzamf = paramLong1;
    this.mPriority = paramInt2;
    this.zzalO = paramLong2;
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    zzf localzzf;
    do
    {
      return true;
      if (!(paramObject instanceof zzf))
        return false;
      localzzf = (zzf)paramObject;
    }
    while ((zzw.equal(this.zzanP, localzzf.zzanP)) && (this.zzamf == localzzf.zzamf) && (this.mPriority == localzzf.mPriority) && (this.zzalO == localzzf.zzalO));
    return false;
  }

  public long getExpirationTime()
  {
    return this.zzalO;
  }

  public long getInterval()
  {
    return this.zzamf;
  }

  public int getPriority()
  {
    return this.mPriority;
  }

  public int hashCode()
  {
    Object[] arrayOfObject = new Object[4];
    arrayOfObject[0] = this.zzanP;
    arrayOfObject[1] = Long.valueOf(this.zzamf);
    arrayOfObject[2] = Integer.valueOf(this.mPriority);
    arrayOfObject[3] = Long.valueOf(this.zzalO);
    return zzw.hashCode(arrayOfObject);
  }

  public String toString()
  {
    return zzw.zzk(this).zza("filter", this.zzanP).zza("interval", Long.valueOf(this.zzamf)).zza("priority", Integer.valueOf(this.mPriority)).zza("expireAt", Long.valueOf(this.zzalO)).toString();
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzg.zza(this, paramParcel, paramInt);
  }

  public PlaceFilter zzpH()
  {
    return this.zzanP;
  }
}