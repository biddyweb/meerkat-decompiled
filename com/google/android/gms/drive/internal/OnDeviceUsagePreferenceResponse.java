package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public class OnDeviceUsagePreferenceResponse
  implements SafeParcelable
{
  public static final Parcelable.Creator<OnDeviceUsagePreferenceResponse> CREATOR = new zzaq();
  final int zzFG;
  final FileUploadPreferencesImpl zzUQ;

  OnDeviceUsagePreferenceResponse(int paramInt, FileUploadPreferencesImpl paramFileUploadPreferencesImpl)
  {
    this.zzFG = paramInt;
    this.zzUQ = paramFileUploadPreferencesImpl;
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzaq.zza(this, paramParcel, paramInt);
  }

  public FileUploadPreferencesImpl zzkN()
  {
    return this.zzUQ;
  }
}