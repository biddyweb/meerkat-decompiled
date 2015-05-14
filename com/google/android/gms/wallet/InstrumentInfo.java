package com.google.android.gms.wallet;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public final class InstrumentInfo
  implements SafeParcelable
{
  public static final Parcelable.Creator<InstrumentInfo> CREATOR = new zzi();
  private final int zzFG;
  private String zzaDr;
  private String zzaDs;

  InstrumentInfo(int paramInt, String paramString1, String paramString2)
  {
    this.zzFG = paramInt;
    this.zzaDr = paramString1;
    this.zzaDs = paramString2;
  }

  public int describeContents()
  {
    return 0;
  }

  public String getInstrumentDetails()
  {
    return this.zzaDs;
  }

  public String getInstrumentType()
  {
    return this.zzaDr;
  }

  public int getVersionCode()
  {
    return this.zzFG;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzi.zza(this, paramParcel, paramInt);
  }
}