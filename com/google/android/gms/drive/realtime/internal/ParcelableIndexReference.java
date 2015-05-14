package com.google.android.gms.drive.realtime.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public class ParcelableIndexReference
  implements SafeParcelable
{
  public static final Parcelable.Creator<ParcelableIndexReference> CREATOR = new zzq();
  final int mIndex;
  final int zzFG;
  final String zzXc;
  final boolean zzXd;

  ParcelableIndexReference(int paramInt1, String paramString, int paramInt2, boolean paramBoolean)
  {
    this.zzFG = paramInt1;
    this.zzXc = paramString;
    this.mIndex = paramInt2;
    this.zzXd = paramBoolean;
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzq.zza(this, paramParcel, paramInt);
  }
}