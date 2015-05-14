package com.google.android.gms.drive.realtime.internal.event;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import java.util.List;

public class ParcelableEventList
  implements SafeParcelable
{
  public static final Parcelable.Creator<ParcelableEventList> CREATOR = new zzd();
  final int zzFG;
  final DataHolder zzXv;
  final boolean zzXw;
  final List<String> zzXx;
  final List<ParcelableEvent> zzmv;

  ParcelableEventList(int paramInt, List<ParcelableEvent> paramList, DataHolder paramDataHolder, boolean paramBoolean, List<String> paramList1)
  {
    this.zzFG = paramInt;
    this.zzmv = paramList;
    this.zzXv = paramDataHolder;
    this.zzXw = paramBoolean;
    this.zzXx = paramList1;
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzd.zza(this, paramParcel, paramInt);
  }
}