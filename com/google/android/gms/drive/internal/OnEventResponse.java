package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.drive.events.ChangeEvent;
import com.google.android.gms.drive.events.CompletionEvent;
import com.google.android.gms.drive.events.DriveEvent;
import com.google.android.gms.drive.events.QueryEvent;

public class OnEventResponse
  implements SafeParcelable
{
  public static final Parcelable.Creator<OnEventResponse> CREATOR = new zzau();
  final int zzFG;
  final int zzTe;
  final ChangeEvent zzUU;
  final CompletionEvent zzUV;
  final QueryEvent zzUW;

  OnEventResponse(int paramInt1, int paramInt2, ChangeEvent paramChangeEvent, CompletionEvent paramCompletionEvent, QueryEvent paramQueryEvent)
  {
    this.zzFG = paramInt1;
    this.zzTe = paramInt2;
    this.zzUU = paramChangeEvent;
    this.zzUV = paramCompletionEvent;
    this.zzUW = paramQueryEvent;
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzau.zza(this, paramParcel, paramInt);
  }

  public DriveEvent zzkQ()
  {
    switch (this.zzTe)
    {
    default:
      throw new IllegalStateException("Unexpected event type " + this.zzTe);
    case 1:
      return this.zzUU;
    case 2:
      return this.zzUV;
    case 3:
    }
    return this.zzUW;
  }
}