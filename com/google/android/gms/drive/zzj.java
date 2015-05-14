package com.google.android.gms.drive;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzj
  implements Parcelable.Creator<UserMetadata>
{
  static void zza(UserMetadata paramUserMetadata, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramUserMetadata.zzFG);
    zzb.zza(paramParcel, 2, paramUserMetadata.zzSI, false);
    zzb.zza(paramParcel, 3, paramUserMetadata.zzSJ, false);
    zzb.zza(paramParcel, 4, paramUserMetadata.zzSK, false);
    zzb.zza(paramParcel, 5, paramUserMetadata.zzSL);
    zzb.zza(paramParcel, 6, paramUserMetadata.zzSM, false);
    zzb.zzH(paramParcel, i);
  }

  public UserMetadata zzac(Parcel paramParcel)
  {
    boolean bool = false;
    String str1 = null;
    int i = zza.zzJ(paramParcel);
    String str2 = null;
    String str3 = null;
    String str4 = null;
    int j = 0;
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
        str4 = zza.zzo(paramParcel, k);
        break;
      case 3:
        str3 = zza.zzo(paramParcel, k);
        break;
      case 4:
        str2 = zza.zzo(paramParcel, k);
        break;
      case 5:
        bool = zza.zzc(paramParcel, k);
        break;
      case 6:
        str1 = zza.zzo(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new UserMetadata(j, str4, str3, str2, bool, str1);
  }

  public UserMetadata[] zzbp(int paramInt)
  {
    return new UserMetadata[paramInt];
  }
}