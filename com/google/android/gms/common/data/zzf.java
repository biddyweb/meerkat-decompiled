package com.google.android.gms.common.data;

import android.database.CursorWindow;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzf
  implements Parcelable.Creator<DataHolder>
{
  static void zza(DataHolder paramDataHolder, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zza(paramParcel, 1, paramDataHolder.zziz(), false);
    zzb.zzc(paramParcel, 1000, paramDataHolder.getVersionCode());
    zzb.zza(paramParcel, 2, paramDataHolder.zziA(), paramInt, false);
    zzb.zzc(paramParcel, 3, paramDataHolder.getStatusCode());
    zzb.zza(paramParcel, 4, paramDataHolder.zziu(), false);
    zzb.zzH(paramParcel, i);
  }

  public DataHolder zzA(Parcel paramParcel)
  {
    int i = 0;
    Bundle localBundle = null;
    int j = zza.zzJ(paramParcel);
    CursorWindow[] arrayOfCursorWindow = null;
    String[] arrayOfString = null;
    int k = 0;
    while (paramParcel.dataPosition() < j)
    {
      int m = zza.zzI(paramParcel);
      switch (zza.zzaP(m))
      {
      default:
        zza.zzb(paramParcel, m);
        break;
      case 1:
        arrayOfString = zza.zzA(paramParcel, m);
        break;
      case 1000:
        k = zza.zzg(paramParcel, m);
        break;
      case 2:
        arrayOfCursorWindow = (CursorWindow[])zza.zzb(paramParcel, m, CursorWindow.CREATOR);
        break;
      case 3:
        i = zza.zzg(paramParcel, m);
        break;
      case 4:
        localBundle = zza.zzq(paramParcel, m);
      }
    }
    if (paramParcel.dataPosition() != j)
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    DataHolder localDataHolder = new DataHolder(k, arrayOfString, arrayOfCursorWindow, i, localBundle);
    localDataHolder.zziy();
    return localDataHolder;
  }

  public DataHolder[] zzaz(int paramInt)
  {
    return new DataHolder[paramInt];
  }
}