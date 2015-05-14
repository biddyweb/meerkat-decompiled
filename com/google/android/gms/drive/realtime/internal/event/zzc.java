package com.google.android.gms.drive.realtime.internal.event;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import java.util.ArrayList;

public class zzc
  implements Parcelable.Creator<ParcelableEvent>
{
  static void zza(ParcelableEvent paramParcelableEvent, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramParcelableEvent.zzFG);
    zzb.zza(paramParcel, 2, paramParcelableEvent.zzyL, false);
    zzb.zza(paramParcel, 3, paramParcelableEvent.zzWZ, false);
    zzb.zzb(paramParcel, 4, paramParcelableEvent.zzXh, false);
    zzb.zza(paramParcel, 5, paramParcelableEvent.zzXi);
    zzb.zza(paramParcel, 6, paramParcelableEvent.zzXc, false);
    zzb.zza(paramParcel, 7, paramParcelableEvent.zzXl, false);
    zzb.zza(paramParcel, 8, paramParcelableEvent.zzXm, paramInt, false);
    zzb.zza(paramParcel, 9, paramParcelableEvent.zzXn, paramInt, false);
    zzb.zza(paramParcel, 10, paramParcelableEvent.zzXo, paramInt, false);
    zzb.zza(paramParcel, 11, paramParcelableEvent.zzXp, paramInt, false);
    zzb.zza(paramParcel, 12, paramParcelableEvent.zzXq, paramInt, false);
    zzb.zza(paramParcel, 13, paramParcelableEvent.zzXr, paramInt, false);
    zzb.zza(paramParcel, 14, paramParcelableEvent.zzXs, paramInt, false);
    zzb.zza(paramParcel, 15, paramParcelableEvent.zzXt, paramInt, false);
    zzb.zza(paramParcel, 17, paramParcelableEvent.zzXk);
    zzb.zza(paramParcel, 16, paramParcelableEvent.zzXj);
    zzb.zza(paramParcel, 18, paramParcelableEvent.zzXu, paramInt, false);
    zzb.zzH(paramParcel, i);
  }

  public ParcelableEvent zzbA(Parcel paramParcel)
  {
    int i = zza.zzJ(paramParcel);
    int j = 0;
    String str1 = null;
    String str2 = null;
    ArrayList localArrayList = null;
    boolean bool1 = false;
    boolean bool2 = false;
    boolean bool3 = false;
    String str3 = null;
    String str4 = null;
    TextInsertedDetails localTextInsertedDetails = null;
    TextDeletedDetails localTextDeletedDetails = null;
    ValuesAddedDetails localValuesAddedDetails = null;
    ValuesRemovedDetails localValuesRemovedDetails = null;
    ValuesSetDetails localValuesSetDetails = null;
    ValueChangedDetails localValueChangedDetails = null;
    ReferenceShiftedDetails localReferenceShiftedDetails = null;
    ObjectChangedDetails localObjectChangedDetails = null;
    FieldChangedDetails localFieldChangedDetails = null;
    while (paramParcel.dataPosition() < i)
    {
      int k = zza.zzI(paramParcel);
      switch (zza.zzaP(k))
      {
      default:
        zza.zzb(paramParcel, k);
        break;
      case 1:
        j = zza.zzg(paramParcel, k);
        break;
      case 2:
        str1 = zza.zzo(paramParcel, k);
        break;
      case 3:
        str2 = zza.zzo(paramParcel, k);
        break;
      case 4:
        localArrayList = zza.zzC(paramParcel, k);
        break;
      case 5:
        bool1 = zza.zzc(paramParcel, k);
        break;
      case 6:
        str3 = zza.zzo(paramParcel, k);
        break;
      case 7:
        str4 = zza.zzo(paramParcel, k);
        break;
      case 8:
        localTextInsertedDetails = (TextInsertedDetails)zza.zza(paramParcel, k, TextInsertedDetails.CREATOR);
        break;
      case 9:
        localTextDeletedDetails = (TextDeletedDetails)zza.zza(paramParcel, k, TextDeletedDetails.CREATOR);
        break;
      case 10:
        localValuesAddedDetails = (ValuesAddedDetails)zza.zza(paramParcel, k, ValuesAddedDetails.CREATOR);
        break;
      case 11:
        localValuesRemovedDetails = (ValuesRemovedDetails)zza.zza(paramParcel, k, ValuesRemovedDetails.CREATOR);
        break;
      case 12:
        localValuesSetDetails = (ValuesSetDetails)zza.zza(paramParcel, k, ValuesSetDetails.CREATOR);
        break;
      case 13:
        localValueChangedDetails = (ValueChangedDetails)zza.zza(paramParcel, k, ValueChangedDetails.CREATOR);
        break;
      case 14:
        localReferenceShiftedDetails = (ReferenceShiftedDetails)zza.zza(paramParcel, k, ReferenceShiftedDetails.CREATOR);
        break;
      case 15:
        localObjectChangedDetails = (ObjectChangedDetails)zza.zza(paramParcel, k, ObjectChangedDetails.CREATOR);
        break;
      case 17:
        bool3 = zza.zzc(paramParcel, k);
        break;
      case 16:
        bool2 = zza.zzc(paramParcel, k);
        break;
      case 18:
        localFieldChangedDetails = (FieldChangedDetails)zza.zza(paramParcel, k, FieldChangedDetails.CREATOR);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new ParcelableEvent(j, str1, str2, localArrayList, bool1, bool2, bool3, str3, str4, localTextInsertedDetails, localTextDeletedDetails, localValuesAddedDetails, localValuesRemovedDetails, localValuesSetDetails, localValueChangedDetails, localReferenceShiftedDetails, localObjectChangedDetails, localFieldChangedDetails);
  }

  public ParcelableEvent[] zzcU(int paramInt)
  {
    return new ParcelableEvent[paramInt];
  }
}