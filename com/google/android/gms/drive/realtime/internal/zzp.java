package com.google.android.gms.drive.realtime.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzp
  implements Parcelable.Creator<ParcelableCollaborator>
{
  static void zza(ParcelableCollaborator paramParcelableCollaborator, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramParcelableCollaborator.zzFG);
    zzb.zza(paramParcel, 2, paramParcelableCollaborator.zzWX);
    zzb.zza(paramParcel, 3, paramParcelableCollaborator.zzWY);
    zzb.zza(paramParcel, 4, paramParcelableCollaborator.zzyL, false);
    zzb.zza(paramParcel, 5, paramParcelableCollaborator.zzWZ, false);
    zzb.zza(paramParcel, 6, paramParcelableCollaborator.zzSJ, false);
    zzb.zza(paramParcel, 7, paramParcelableCollaborator.zzXa, false);
    zzb.zza(paramParcel, 8, paramParcelableCollaborator.zzXb, false);
    zzb.zzH(paramParcel, i);
  }

  public ParcelableCollaborator zzbw(Parcel paramParcel)
  {
    boolean bool1 = false;
    String str1 = null;
    int i = zza.zzJ(paramParcel);
    String str2 = null;
    String str3 = null;
    String str4 = null;
    String str5 = null;
    boolean bool2 = false;
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
        bool2 = zza.zzc(paramParcel, k);
        break;
      case 3:
        bool1 = zza.zzc(paramParcel, k);
        break;
      case 4:
        str5 = zza.zzo(paramParcel, k);
        break;
      case 5:
        str4 = zza.zzo(paramParcel, k);
        break;
      case 6:
        str3 = zza.zzo(paramParcel, k);
        break;
      case 7:
        str2 = zza.zzo(paramParcel, k);
        break;
      case 8:
        str1 = zza.zzo(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new ParcelableCollaborator(j, bool2, bool1, str5, str4, str3, str2, str1);
  }

  public ParcelableCollaborator[] zzcQ(int paramInt)
  {
    return new ParcelableCollaborator[paramInt];
  }
}