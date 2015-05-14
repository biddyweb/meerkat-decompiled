package com.google.android.gms.location;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public final class zzb
  implements SafeParcelable
{
  public static final zzc CREATOR = new zzc();
  private static final List<Integer> zzama;
  private static final List<Integer> zzamb;
  private static final List<Integer> zzamc;
  private static final List<Integer> zzamd;
  private final int zzFG;
  private final List<Integer> zzame;

  static
  {
    Integer[] arrayOfInteger1 = new Integer[18];
    arrayOfInteger1[0] = Integer.valueOf(1);
    arrayOfInteger1[1] = Integer.valueOf(2);
    arrayOfInteger1[2] = Integer.valueOf(3);
    arrayOfInteger1[3] = Integer.valueOf(4);
    arrayOfInteger1[4] = Integer.valueOf(5);
    arrayOfInteger1[5] = Integer.valueOf(6);
    arrayOfInteger1[6] = Integer.valueOf(7);
    arrayOfInteger1[7] = Integer.valueOf(8);
    arrayOfInteger1[8] = Integer.valueOf(9);
    arrayOfInteger1[9] = Integer.valueOf(10);
    arrayOfInteger1[10] = Integer.valueOf(11);
    arrayOfInteger1[11] = Integer.valueOf(12);
    arrayOfInteger1[12] = Integer.valueOf(13);
    arrayOfInteger1[13] = Integer.valueOf(14);
    arrayOfInteger1[14] = Integer.valueOf(15);
    arrayOfInteger1[15] = Integer.valueOf(16);
    arrayOfInteger1[16] = Integer.valueOf(17);
    arrayOfInteger1[17] = Integer.valueOf(18);
    zzama = Collections.unmodifiableList(Arrays.asList(arrayOfInteger1));
    Integer[] arrayOfInteger2 = new Integer[2];
    arrayOfInteger2[0] = Integer.valueOf(1);
    arrayOfInteger2[1] = Integer.valueOf(18);
    zzamb = Collections.unmodifiableList(Arrays.asList(arrayOfInteger2));
    Integer[] arrayOfInteger3 = new Integer[8];
    arrayOfInteger3[0] = Integer.valueOf(2);
    arrayOfInteger3[1] = Integer.valueOf(4);
    arrayOfInteger3[2] = Integer.valueOf(6);
    arrayOfInteger3[3] = Integer.valueOf(8);
    arrayOfInteger3[4] = Integer.valueOf(10);
    arrayOfInteger3[5] = Integer.valueOf(12);
    arrayOfInteger3[6] = Integer.valueOf(14);
    arrayOfInteger3[7] = Integer.valueOf(16);
    zzamc = Collections.unmodifiableList(Arrays.asList(arrayOfInteger3));
    Integer[] arrayOfInteger4 = new Integer[8];
    arrayOfInteger4[0] = Integer.valueOf(3);
    arrayOfInteger4[1] = Integer.valueOf(5);
    arrayOfInteger4[2] = Integer.valueOf(7);
    arrayOfInteger4[3] = Integer.valueOf(9);
    arrayOfInteger4[4] = Integer.valueOf(11);
    arrayOfInteger4[5] = Integer.valueOf(13);
    arrayOfInteger4[6] = Integer.valueOf(15);
    arrayOfInteger4[7] = Integer.valueOf(17);
    zzamd = Collections.unmodifiableList(Arrays.asList(arrayOfInteger4));
  }

  zzb(int paramInt, List<Integer> paramList)
  {
    this.zzFG = paramInt;
    this.zzame = paramList;
  }

  public int describeContents()
  {
    return 0;
  }

  public int getVersionCode()
  {
    return this.zzFG;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzc.zza(this, paramParcel, paramInt);
  }

  public List<Integer> zzpq()
  {
    return this.zzame;
  }
}