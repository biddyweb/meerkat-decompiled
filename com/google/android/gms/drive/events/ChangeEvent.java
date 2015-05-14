package com.google.android.gms.drive.events;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.drive.DriveId;
import java.util.Locale;

public final class ChangeEvent
  implements SafeParcelable, ResourceEvent
{
  public static final Parcelable.Creator<ChangeEvent> CREATOR = new zza();
  final int zzFG;
  final DriveId zzRX;
  final int zzSO;

  ChangeEvent(int paramInt1, DriveId paramDriveId, int paramInt2)
  {
    this.zzFG = paramInt1;
    this.zzRX = paramDriveId;
    this.zzSO = paramInt2;
  }

  public int describeContents()
  {
    return 0;
  }

  public DriveId getDriveId()
  {
    return this.zzRX;
  }

  public int getType()
  {
    return 1;
  }

  public boolean hasBeenDeleted()
  {
    return (0x4 & this.zzSO) != 0;
  }

  public boolean hasContentChanged()
  {
    return (0x2 & this.zzSO) != 0;
  }

  public boolean hasMetadataChanged()
  {
    return (0x1 & this.zzSO) != 0;
  }

  public String toString()
  {
    Locale localLocale = Locale.US;
    Object[] arrayOfObject = new Object[2];
    arrayOfObject[0] = this.zzRX;
    arrayOfObject[1] = Integer.valueOf(this.zzSO);
    return String.format(localLocale, "ChangeEvent [id=%s,changeFlags=%x]", arrayOfObject);
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zza.zza(this, paramParcel, paramInt);
  }
}