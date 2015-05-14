package com.google.android.gms.drive.realtime.internal.event;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import java.util.List;

public class ParcelableEvent
  implements SafeParcelable
{
  public static final Parcelable.Creator<ParcelableEvent> CREATOR = new zzc();
  final int zzFG;
  final String zzWZ;
  final String zzXc;
  final List<String> zzXh;
  final boolean zzXi;
  final boolean zzXj;
  final boolean zzXk;
  final String zzXl;
  final TextInsertedDetails zzXm;
  final TextDeletedDetails zzXn;
  final ValuesAddedDetails zzXo;
  final ValuesRemovedDetails zzXp;
  final ValuesSetDetails zzXq;
  final ValueChangedDetails zzXr;
  final ReferenceShiftedDetails zzXs;
  final ObjectChangedDetails zzXt;
  final FieldChangedDetails zzXu;
  final String zzyL;

  ParcelableEvent(int paramInt, String paramString1, String paramString2, List<String> paramList, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3, String paramString3, String paramString4, TextInsertedDetails paramTextInsertedDetails, TextDeletedDetails paramTextDeletedDetails, ValuesAddedDetails paramValuesAddedDetails, ValuesRemovedDetails paramValuesRemovedDetails, ValuesSetDetails paramValuesSetDetails, ValueChangedDetails paramValueChangedDetails, ReferenceShiftedDetails paramReferenceShiftedDetails, ObjectChangedDetails paramObjectChangedDetails, FieldChangedDetails paramFieldChangedDetails)
  {
    this.zzFG = paramInt;
    this.zzyL = paramString1;
    this.zzWZ = paramString2;
    this.zzXh = paramList;
    this.zzXi = paramBoolean1;
    this.zzXj = paramBoolean2;
    this.zzXk = paramBoolean3;
    this.zzXc = paramString3;
    this.zzXl = paramString4;
    this.zzXm = paramTextInsertedDetails;
    this.zzXn = paramTextDeletedDetails;
    this.zzXo = paramValuesAddedDetails;
    this.zzXp = paramValuesRemovedDetails;
    this.zzXq = paramValuesSetDetails;
    this.zzXr = paramValueChangedDetails;
    this.zzXs = paramReferenceShiftedDetails;
    this.zzXt = paramObjectChangedDetails;
    this.zzXu = paramFieldChangedDetails;
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzc.zza(this, paramParcel, paramInt);
  }
}