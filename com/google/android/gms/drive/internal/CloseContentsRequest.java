package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.drive.Contents;

public class CloseContentsRequest
  implements SafeParcelable
{
  public static final Parcelable.Creator<CloseContentsRequest> CREATOR = new zzg();
  final int zzFG;
  final Contents zzTj;
  final Boolean zzTl;

  CloseContentsRequest(int paramInt, Contents paramContents, Boolean paramBoolean)
  {
    this.zzFG = paramInt;
    this.zzTj = paramContents;
    this.zzTl = paramBoolean;
  }

  public CloseContentsRequest(Contents paramContents, boolean paramBoolean)
  {
    this(1, paramContents, Boolean.valueOf(paramBoolean));
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzg.zza(this, paramParcel, paramInt);
  }
}