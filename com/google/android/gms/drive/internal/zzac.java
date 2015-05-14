package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzac
  implements Parcelable.Creator<FileUploadPreferencesImpl>
{
  static void zza(FileUploadPreferencesImpl paramFileUploadPreferencesImpl, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramFileUploadPreferencesImpl.zzFG);
    zzb.zzc(paramParcel, 2, paramFileUploadPreferencesImpl.zzUs);
    zzb.zzc(paramParcel, 3, paramFileUploadPreferencesImpl.zzUt);
    zzb.zza(paramParcel, 4, paramFileUploadPreferencesImpl.zzUu);
    zzb.zzH(paramParcel, i);
  }

  public FileUploadPreferencesImpl zzav(Parcel paramParcel)
  {
    boolean bool = false;
    int i = zza.zzJ(paramParcel);
    int j = 0;
    int k = 0;
    int m = 0;
    while (paramParcel.dataPosition() < i)
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
        j = zza.zzg(paramParcel, n);
        break;
      case 4:
        bool = zza.zzc(paramParcel, n);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new FileUploadPreferencesImpl(m, k, j, bool);
  }

  public FileUploadPreferencesImpl[] zzbO(int paramInt)
  {
    return new FileUploadPreferencesImpl[paramInt];
  }
}