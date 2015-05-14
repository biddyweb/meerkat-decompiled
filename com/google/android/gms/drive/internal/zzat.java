package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import com.google.android.gms.drive.DrivePreferences;

public class zzat
  implements Parcelable.Creator<OnDrivePreferencesResponse>
{
  static void zza(OnDrivePreferencesResponse paramOnDrivePreferencesResponse, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramOnDrivePreferencesResponse.zzFG);
    zzb.zza(paramParcel, 2, paramOnDrivePreferencesResponse.zzUT, paramInt, false);
    zzb.zzH(paramParcel, i);
  }

  public OnDrivePreferencesResponse zzaG(Parcel paramParcel)
  {
    int i = zza.zzJ(paramParcel);
    int j = 0;
    DrivePreferences localDrivePreferences = null;
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
        localDrivePreferences = (DrivePreferences)zza.zza(paramParcel, k, DrivePreferences.CREATOR);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new OnDrivePreferencesResponse(j, localDrivePreferences);
  }

  public OnDrivePreferencesResponse[] zzbZ(int paramInt)
  {
    return new OnDrivePreferencesResponse[paramInt];
  }
}