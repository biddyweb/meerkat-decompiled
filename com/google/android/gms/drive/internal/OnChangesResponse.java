package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.drive.ChangeSequenceNumber;
import com.google.android.gms.drive.DriveId;
import java.util.List;

public class OnChangesResponse
  implements SafeParcelable
{
  public static final Parcelable.Creator<OnChangesResponse> CREATOR = new zzao();
  final int zzFG;
  final DataHolder zzUL;
  final List<DriveId> zzUM;
  final ChangeSequenceNumber zzUN;
  final boolean zzUO;

  OnChangesResponse(int paramInt, DataHolder paramDataHolder, List<DriveId> paramList, ChangeSequenceNumber paramChangeSequenceNumber, boolean paramBoolean)
  {
    this.zzFG = paramInt;
    this.zzUL = paramDataHolder;
    this.zzUM = paramList;
    this.zzUN = paramChangeSequenceNumber;
    this.zzUO = paramBoolean;
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzao.zza(this, paramParcel, paramInt | 0x1);
  }
}