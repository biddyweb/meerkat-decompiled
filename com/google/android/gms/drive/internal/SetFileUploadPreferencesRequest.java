package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public class SetFileUploadPreferencesRequest
  implements SafeParcelable
{
  public static final Parcelable.Creator<SetFileUploadPreferencesRequest> CREATOR = new zzbj();
  final int zzFG;
  final FileUploadPreferencesImpl zzUQ;

  SetFileUploadPreferencesRequest(int paramInt, FileUploadPreferencesImpl paramFileUploadPreferencesImpl)
  {
    this.zzFG = paramInt;
    this.zzUQ = paramFileUploadPreferencesImpl;
  }

  public SetFileUploadPreferencesRequest(FileUploadPreferencesImpl paramFileUploadPreferencesImpl)
  {
    this(1, paramFileUploadPreferencesImpl);
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzbj.zza(this, paramParcel, paramInt);
  }
}