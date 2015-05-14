package com.google.android.gms.drive;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import android.text.TextUtils;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzx;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

public class DriveSpace
  implements SafeParcelable
{
  public static final Parcelable.Creator<DriveSpace> CREATOR = new zzg();
  public static final DriveSpace zzSl = new DriveSpace("DRIVE");
  public static final DriveSpace zzSm = new DriveSpace("APP_DATA_FOLDER");
  public static final DriveSpace zzSn = new DriveSpace("GOOGLE_PHOTOS");
  public static final Set<DriveSpace> zzSo = Collections.unmodifiableSet(new HashSet(Arrays.asList(arrayOfDriveSpace)));
  public static final String zzSp = TextUtils.join(",", zzSo.toArray());
  private final String mName;
  final int zzFG;

  static
  {
    DriveSpace[] arrayOfDriveSpace = new DriveSpace[3];
    arrayOfDriveSpace[0] = zzSl;
    arrayOfDriveSpace[1] = zzSm;
    arrayOfDriveSpace[2] = zzSn;
  }

  DriveSpace(int paramInt, String paramString)
  {
    this.zzFG = paramInt;
    this.mName = ((String)zzx.zzl(paramString));
  }

  private DriveSpace(String paramString)
  {
    this(1, paramString);
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    if ((paramObject == null) || (paramObject.getClass() != DriveSpace.class))
      return false;
    return this.mName.equals(((DriveSpace)paramObject).mName);
  }

  public String getName()
  {
    return this.mName;
  }

  public int hashCode()
  {
    return 0x4A54C0DE ^ this.mName.hashCode();
  }

  public String toString()
  {
    return this.mName;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzg.zza(this, paramParcel, paramInt);
  }
}