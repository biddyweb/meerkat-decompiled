package com.google.android.gms.drive;

import android.os.Parcel;
import android.os.ParcelFileDescriptor;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;

public class Contents
  implements SafeParcelable
{
  public static final Parcelable.Creator<Contents> CREATOR = new zzb();
  final int zzFG;
  final ParcelFileDescriptor zzOx;
  final int zzRV;
  final int zzRW;
  final DriveId zzRX;
  final boolean zzRY;

  Contents(int paramInt1, ParcelFileDescriptor paramParcelFileDescriptor, int paramInt2, int paramInt3, DriveId paramDriveId, boolean paramBoolean)
  {
    this.zzFG = paramInt1;
    this.zzOx = paramParcelFileDescriptor;
    this.zzRV = paramInt2;
    this.zzRW = paramInt3;
    this.zzRX = paramDriveId;
    this.zzRY = paramBoolean;
  }

  public int describeContents()
  {
    return 0;
  }

  public DriveId getDriveId()
  {
    return this.zzRX;
  }

  public InputStream getInputStream()
  {
    return new FileInputStream(this.zzOx.getFileDescriptor());
  }

  public int getMode()
  {
    return this.zzRW;
  }

  public OutputStream getOutputStream()
  {
    return new FileOutputStream(this.zzOx.getFileDescriptor());
  }

  public ParcelFileDescriptor getParcelFileDescriptor()
  {
    return this.zzOx;
  }

  public int getRequestId()
  {
    return this.zzRV;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzb.zza(this, paramParcel, paramInt);
  }

  public boolean zzko()
  {
    return this.zzRY;
  }
}