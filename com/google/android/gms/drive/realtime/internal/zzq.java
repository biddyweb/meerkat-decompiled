package com.google.android.gms.drive.realtime.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzq
  implements Parcelable.Creator<ParcelableIndexReference>
{
  static void zza(ParcelableIndexReference paramParcelableIndexReference, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramParcelableIndexReference.zzFG);
    zzb.zza(paramParcel, 2, paramParcelableIndexReference.zzXc, false);
    zzb.zzc(paramParcel, 3, paramParcelableIndexReference.mIndex);
    zzb.zza(paramParcel, 4, paramParcelableIndexReference.zzXd);
    zzb.zzH(paramParcel, i);
  }

  public ParcelableIndexReference zzbx(Parcel paramParcel)
  {
    boolean bool = false;
    int i = zza.zzJ(paramParcel);
    String str = null;
    int j = 0;
    int k = 0;
    while (paramParcel.dataPosition() < i)
    {
      int m = zza.zzI(paramParcel);
      switch (zza.zzaP(m))
      {
      default:
        zza.zzb(paramParcel, m);
        break;
      case 1:
        k = zza.zzg(paramParcel, m);
        break;
      case 2:
        str = zza.zzo(paramParcel, m);
        break;
      case 3:
        j = zza.zzg(paramParcel, m);
        break;
      case 4:
        bool = zza.zzc(paramParcel, m);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new ParcelableIndexReference(k, str, j, bool);
  }

  public ParcelableIndexReference[] zzcR(int paramInt)
  {
    return new ParcelableIndexReference[paramInt];
  }
}