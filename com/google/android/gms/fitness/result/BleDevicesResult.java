package com.google.android.gms.fitness.result;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzw.zza;
import com.google.android.gms.fitness.data.BleDevice;
import com.google.android.gms.fitness.data.DataType;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

public class BleDevicesResult
  implements Result, SafeParcelable
{
  public static final Parcelable.Creator<BleDevicesResult> CREATOR = new zza();
  private final int zzFG;
  private final Status zzHb;
  private final List<BleDevice> zzabL;

  BleDevicesResult(int paramInt, List<BleDevice> paramList, Status paramStatus)
  {
    this.zzFG = paramInt;
    this.zzabL = Collections.unmodifiableList(paramList);
    this.zzHb = paramStatus;
  }

  public BleDevicesResult(List<BleDevice> paramList, Status paramStatus)
  {
    this.zzFG = 3;
    this.zzabL = Collections.unmodifiableList(paramList);
    this.zzHb = paramStatus;
  }

  public static BleDevicesResult zzB(Status paramStatus)
  {
    return new BleDevicesResult(Collections.emptyList(), paramStatus);
  }

  private boolean zzb(BleDevicesResult paramBleDevicesResult)
  {
    return (this.zzHb.equals(paramBleDevicesResult.zzHb)) && (zzw.equal(this.zzabL, paramBleDevicesResult.zzabL));
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    return (this == paramObject) || (((paramObject instanceof BleDevicesResult)) && (zzb((BleDevicesResult)paramObject)));
  }

  public List<BleDevice> getClaimedBleDevices()
  {
    return this.zzabL;
  }

  public List<BleDevice> getClaimedBleDevices(DataType paramDataType)
  {
    ArrayList localArrayList = new ArrayList();
    Iterator localIterator = this.zzabL.iterator();
    while (localIterator.hasNext())
    {
      BleDevice localBleDevice = (BleDevice)localIterator.next();
      if (localBleDevice.getDataTypes().contains(paramDataType))
        localArrayList.add(localBleDevice);
    }
    return Collections.unmodifiableList(localArrayList);
  }

  public Status getStatus()
  {
    return this.zzHb;
  }

  int getVersionCode()
  {
    return this.zzFG;
  }

  public int hashCode()
  {
    Object[] arrayOfObject = new Object[2];
    arrayOfObject[0] = this.zzHb;
    arrayOfObject[1] = this.zzabL;
    return zzw.hashCode(arrayOfObject);
  }

  public String toString()
  {
    return zzw.zzk(this).zza("status", this.zzHb).zza("bleDevices", this.zzabL).toString();
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zza.zza(this, paramParcel, paramInt);
  }
}