package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzx;

public class CreateContentsRequest
  implements SafeParcelable
{
  public static final Parcelable.Creator<CreateContentsRequest> CREATOR = new zzh();
  final int zzFG;
  final int zzRW;

  public CreateContentsRequest(int paramInt)
  {
    this(1, paramInt);
  }

  CreateContentsRequest(int paramInt1, int paramInt2)
  {
    this.zzFG = paramInt1;
    if ((paramInt2 == 536870912) || (paramInt2 == 805306368));
    for (boolean bool = true; ; bool = false)
    {
      zzx.zzb(bool, "Cannot create a new read-only contents!");
      this.zzRW = paramInt2;
      return;
    }
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzh.zza(this, paramParcel, paramInt);
  }
}