package com.google.android.gms.location.places;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzx;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

public final class zzj
  implements SafeParcelable
{
  public static final zzk CREATOR = new zzk();
  public static final zzj zzaod = zzB("test_type", 1);
  public static final zzj zzaoe = zzB("labeled_place", 6);
  public static final zzj zzaof = zzB("here_content", 7);
  public static final Set<zzj> zzaog;
  final int zzFG;
  final int zzaoh;
  final String zzxV;

  static
  {
    zzj[] arrayOfzzj = new zzj[3];
    arrayOfzzj[0] = zzaod;
    arrayOfzzj[1] = zzaoe;
    arrayOfzzj[2] = zzaof;
    zzaog = Collections.unmodifiableSet(new HashSet(Arrays.asList(arrayOfzzj)));
  }

  zzj(int paramInt1, String paramString, int paramInt2)
  {
    zzx.zzbn(paramString);
    this.zzFG = paramInt1;
    this.zzxV = paramString;
    this.zzaoh = paramInt2;
  }

  private static zzj zzB(String paramString, int paramInt)
  {
    return new zzj(0, paramString, paramInt);
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    zzj localzzj;
    do
    {
      return true;
      if (!(paramObject instanceof zzj))
        return false;
      localzzj = (zzj)paramObject;
    }
    while ((this.zzxV.equals(localzzj.zzxV)) && (this.zzaoh == localzzj.zzaoh));
    return false;
  }

  public int hashCode()
  {
    return this.zzxV.hashCode();
  }

  public String toString()
  {
    return this.zzxV;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzk.zza(this, paramParcel, paramInt);
  }
}