package com.google.android.gms.fitness.data;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzw.zza;
import com.google.android.gms.internal.zzmn;
import java.util.Collections;
import java.util.List;

public class BleDevice
  implements SafeParcelable
{
  public static final Parcelable.Creator<BleDevice> CREATOR = new zzc();
  private final String mName;
  private final int zzFG;
  private final List<DataType> zzYA;
  private final String zzYy;
  private final List<String> zzYz;

  BleDevice(int paramInt, String paramString1, String paramString2, List<String> paramList, List<DataType> paramList1)
  {
    this.zzFG = paramInt;
    this.zzYy = paramString1;
    this.mName = paramString2;
    this.zzYz = Collections.unmodifiableList(paramList);
    this.zzYA = Collections.unmodifiableList(paramList1);
  }

  private boolean zza(BleDevice paramBleDevice)
  {
    return (this.mName.equals(paramBleDevice.mName)) && (this.zzYy.equals(paramBleDevice.zzYy)) && (zzmn.zza(paramBleDevice.zzYz, this.zzYz)) && (zzmn.zza(this.zzYA, paramBleDevice.zzYA));
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    return (paramObject == this) || (((paramObject instanceof BleDevice)) && (zza((BleDevice)paramObject)));
  }

  public String getAddress()
  {
    return this.zzYy;
  }

  public List<DataType> getDataTypes()
  {
    return this.zzYA;
  }

  public String getName()
  {
    return this.mName;
  }

  public List<String> getSupportedProfiles()
  {
    return this.zzYz;
  }

  int getVersionCode()
  {
    return this.zzFG;
  }

  public int hashCode()
  {
    Object[] arrayOfObject = new Object[4];
    arrayOfObject[0] = this.mName;
    arrayOfObject[1] = this.zzYy;
    arrayOfObject[2] = this.zzYz;
    arrayOfObject[3] = this.zzYA;
    return zzw.hashCode(arrayOfObject);
  }

  public String toString()
  {
    return zzw.zzk(this).zza("name", this.mName).zza("address", this.zzYy).zza("dataTypes", this.zzYA).zza("supportedProfiles", this.zzYz).toString();
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzc.zza(this, paramParcel, paramInt);
  }
}