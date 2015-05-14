package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.drive.Contents;

public class OnContentsResponse
  implements SafeParcelable
{
  public static final Parcelable.Creator<OnContentsResponse> CREATOR = new zzap();
  final int zzFG;
  final Contents zzTO;
  final boolean zzUP;

  OnContentsResponse(int paramInt, Contents paramContents, boolean paramBoolean)
  {
    this.zzFG = paramInt;
    this.zzTO = paramContents;
    this.zzUP = paramBoolean;
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzap.zza(this, paramParcel, paramInt);
  }

  public Contents zzkL()
  {
    return this.zzTO;
  }

  public boolean zzkM()
  {
    return this.zzUP;
  }
}