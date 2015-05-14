package com.google.android.gms.drive.realtime.internal.event;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzg
  implements Parcelable.Creator<TextInsertedDetails>
{
  static void zza(TextInsertedDetails paramTextInsertedDetails, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramTextInsertedDetails.zzFG);
    zzb.zzc(paramParcel, 2, paramTextInsertedDetails.mIndex);
    zzb.zzc(paramParcel, 3, paramTextInsertedDetails.zzXC);
    zzb.zzH(paramParcel, i);
  }

  public TextInsertedDetails zzbE(Parcel paramParcel)
  {
    int i = 0;
    int j = zza.zzJ(paramParcel);
    int k = 0;
    int m = 0;
    while (paramParcel.dataPosition() < j)
    {
      int n = zza.zzI(paramParcel);
      switch (zza.zzaP(n))
      {
      default:
        zza.zzb(paramParcel, n);
        break;
      case 1:
        m = zza.zzg(paramParcel, n);
        break;
      case 2:
        k = zza.zzg(paramParcel, n);
        break;
      case 3:
        i = zza.zzg(paramParcel, n);
      }
    }
    if (paramParcel.dataPosition() != j)
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    return new TextInsertedDetails(m, k, i);
  }

  public TextInsertedDetails[] zzcY(int paramInt)
  {
    return new TextInsertedDetails[paramInt];
  }
}