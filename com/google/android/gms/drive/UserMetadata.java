package com.google.android.gms.drive;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public class UserMetadata
  implements SafeParcelable
{
  public static final Parcelable.Creator<UserMetadata> CREATOR = new zzj();
  final int zzFG;
  final String zzSI;
  final String zzSJ;
  final String zzSK;
  final boolean zzSL;
  final String zzSM;

  UserMetadata(int paramInt, String paramString1, String paramString2, String paramString3, boolean paramBoolean, String paramString4)
  {
    this.zzFG = paramInt;
    this.zzSI = paramString1;
    this.zzSJ = paramString2;
    this.zzSK = paramString3;
    this.zzSL = paramBoolean;
    this.zzSM = paramString4;
  }

  public UserMetadata(String paramString1, String paramString2, String paramString3, boolean paramBoolean, String paramString4)
  {
    this(1, paramString1, paramString2, paramString3, paramBoolean, paramString4);
  }

  public int describeContents()
  {
    return 0;
  }

  public String toString()
  {
    Object[] arrayOfObject = new Object[5];
    arrayOfObject[0] = this.zzSI;
    arrayOfObject[1] = this.zzSJ;
    arrayOfObject[2] = this.zzSK;
    arrayOfObject[3] = Boolean.valueOf(this.zzSL);
    arrayOfObject[4] = this.zzSM;
    return String.format("Permission ID: '%s', Display Name: '%s', Picture URL: '%s', Authenticated User: %b, Email: '%s'", arrayOfObject);
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzj.zza(this, paramParcel, paramInt);
  }
}