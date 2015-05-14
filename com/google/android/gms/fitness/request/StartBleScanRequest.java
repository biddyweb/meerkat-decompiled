package com.google.android.gms.fitness.request;

import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzw.zza;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.fitness.data.DataType;
import com.google.android.gms.internal.zzls;
import com.google.android.gms.internal.zznv;
import com.google.android.gms.internal.zznv.zza;
import java.util.Collections;
import java.util.List;

public class StartBleScanRequest
  implements SafeParcelable
{
  public static final Parcelable.Creator<StartBleScanRequest> CREATOR = new zzaq();
  private final int zzFG;
  private final String zzFO;
  private final List<DataType> zzYA;
  private final zznv zzaaN;
  private final zzt zzabH;
  private final int zzabI;

  StartBleScanRequest(int paramInt1, List<DataType> paramList, IBinder paramIBinder1, int paramInt2, IBinder paramIBinder2, String paramString)
  {
    this.zzFG = paramInt1;
    this.zzYA = paramList;
    this.zzabH = zzt.zza.zzaV(paramIBinder1);
    this.zzabI = paramInt2;
    if (paramIBinder2 == null);
    for (zznv localzznv = null; ; localzznv = zznv.zza.zzaS(paramIBinder2))
    {
      this.zzaaN = localzznv;
      this.zzFO = paramString;
      return;
    }
  }

  private StartBleScanRequest(Builder paramBuilder)
  {
    this(zzls.zzb(Builder.zza(paramBuilder)), Builder.zzb(paramBuilder), Builder.zzc(paramBuilder), null, null);
  }

  public StartBleScanRequest(StartBleScanRequest paramStartBleScanRequest, zznv paramzznv, String paramString)
  {
    this(paramStartBleScanRequest.zzYA, paramStartBleScanRequest.zzabH, paramStartBleScanRequest.zzabI, paramzznv, paramString);
  }

  public StartBleScanRequest(List<DataType> paramList, zzt paramzzt, int paramInt, zznv paramzznv, String paramString)
  {
    this.zzFG = 3;
    this.zzYA = paramList;
    this.zzabH = paramzzt;
    this.zzabI = paramInt;
    this.zzaaN = paramzznv;
    this.zzFO = paramString;
  }

  public int describeContents()
  {
    return 0;
  }

  public List<DataType> getDataTypes()
  {
    return Collections.unmodifiableList(this.zzYA);
  }

  public String getPackageName()
  {
    return this.zzFO;
  }

  public int getTimeoutSecs()
  {
    return this.zzabI;
  }

  int getVersionCode()
  {
    return this.zzFG;
  }

  public String toString()
  {
    return zzw.zzk(this).zza("dataTypes", this.zzYA).zza("timeoutSecs", Integer.valueOf(this.zzabI)).toString();
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzaq.zza(this, paramParcel, paramInt);
  }

  public IBinder zzlQ()
  {
    if (this.zzaaN == null)
      return null;
    return this.zzaaN.asBinder();
  }

  public IBinder zzmk()
  {
    return this.zzabH.asBinder();
  }

  public static class Builder
  {
    private zzt zzabH;
    private int zzabI = 10;
    private DataType[] zzabg = new DataType[0];

    public StartBleScanRequest build()
    {
      if (this.zzabH != null);
      for (boolean bool = true; ; bool = false)
      {
        zzx.zza(bool, "Must set BleScanCallback");
        return new StartBleScanRequest(this, null);
      }
    }

    public Builder setBleScanCallback(BleScanCallback paramBleScanCallback)
    {
      zza(zza.zza.zzlO().zza(paramBleScanCallback));
      return this;
    }

    public Builder setDataTypes(DataType[] paramArrayOfDataType)
    {
      this.zzabg = paramArrayOfDataType;
      return this;
    }

    public Builder setTimeoutSecs(int paramInt)
    {
      boolean bool1 = true;
      boolean bool2;
      if (paramInt > 0)
      {
        bool2 = bool1;
        zzx.zzb(bool2, "Stop time must be greater than zero");
        if (paramInt > 60)
          break label38;
      }
      while (true)
      {
        zzx.zzb(bool1, "Stop time must be less than 1 minute");
        this.zzabI = paramInt;
        return this;
        bool2 = false;
        break;
        label38: bool1 = false;
      }
    }

    public Builder zza(zzt paramzzt)
    {
      this.zzabH = paramzzt;
      return this;
    }
  }
}