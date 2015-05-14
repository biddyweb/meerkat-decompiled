package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.drive.zzk;

public class OnListEntriesResponse extends zzk
  implements SafeParcelable
{
  public static final Parcelable.Creator<OnListEntriesResponse> CREATOR = new zzaw();
  final int zzFG;
  final boolean zzTB;
  final DataHolder zzUY;

  OnListEntriesResponse(int paramInt, DataHolder paramDataHolder, boolean paramBoolean)
  {
    this.zzFG = paramInt;
    this.zzUY = paramDataHolder;
    this.zzTB = paramBoolean;
  }

  public int describeContents()
  {
    return 0;
  }

  protected void zzI(Parcel paramParcel, int paramInt)
  {
    zzaw.zza(this, paramParcel, paramInt);
  }

  public DataHolder zzkR()
  {
    return this.zzUY;
  }

  public boolean zzkS()
  {
    return this.zzTB;
  }
}