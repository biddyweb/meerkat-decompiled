package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzaq
  implements Parcelable.Creator<OnDeviceUsagePreferenceResponse>
{
  static void zza(OnDeviceUsagePreferenceResponse paramOnDeviceUsagePreferenceResponse, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramOnDeviceUsagePreferenceResponse.zzFG);
    zzb.zza(paramParcel, 2, paramOnDeviceUsagePreferenceResponse.zzUQ, paramInt, false);
    zzb.zzH(paramParcel, i);
  }

  public OnDeviceUsagePreferenceResponse zzaD(Parcel paramParcel)
  {
    int i = zza.zzJ(paramParcel);
    int j = 0;
    FileUploadPreferencesImpl localFileUploadPreferencesImpl = null;
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
        localFileUploadPreferencesImpl = (FileUploadPreferencesImpl)zza.zza(paramParcel, k, FileUploadPreferencesImpl.CREATOR);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new OnDeviceUsagePreferenceResponse(j, localFileUploadPreferencesImpl);
  }

  public OnDeviceUsagePreferenceResponse[] zzbW(int paramInt)
  {
    return new OnDeviceUsagePreferenceResponse[paramInt];
  }
}