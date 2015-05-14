package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.drive.FileUploadPreferences;

public final class FileUploadPreferencesImpl
  implements SafeParcelable, FileUploadPreferences
{
  public static final Parcelable.Creator<FileUploadPreferencesImpl> CREATOR = new zzac();
  final int zzFG;
  int zzUs;
  int zzUt;
  boolean zzUu;

  FileUploadPreferencesImpl(int paramInt1, int paramInt2, int paramInt3, boolean paramBoolean)
  {
    this.zzFG = paramInt1;
    this.zzUs = paramInt2;
    this.zzUt = paramInt3;
    this.zzUu = paramBoolean;
  }

  public static boolean zzbM(int paramInt)
  {
    switch (paramInt)
    {
    default:
      return false;
    case 1:
    case 2:
    }
    return true;
  }

  public static boolean zzbN(int paramInt)
  {
    switch (paramInt)
    {
    default:
      return false;
    case 256:
    case 257:
    }
    return true;
  }

  public int describeContents()
  {
    return 0;
  }

  public int getBatteryUsagePreference()
  {
    if (!zzbN(this.zzUt))
      return 0;
    return this.zzUt;
  }

  public int getNetworkTypePreference()
  {
    if (!zzbM(this.zzUs))
      return 0;
    return this.zzUs;
  }

  public boolean isRoamingAllowed()
  {
    return this.zzUu;
  }

  public void setBatteryUsagePreference(int paramInt)
  {
    if (!zzbN(paramInt))
      throw new IllegalArgumentException("Invalid battery usage preference value.");
    this.zzUt = paramInt;
  }

  public void setNetworkTypePreference(int paramInt)
  {
    if (!zzbM(paramInt))
      throw new IllegalArgumentException("Invalid data connection preference value.");
    this.zzUs = paramInt;
  }

  public void setRoamingAllowed(boolean paramBoolean)
  {
    this.zzUu = paramBoolean;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzac.zza(this, paramParcel, paramInt);
  }
}