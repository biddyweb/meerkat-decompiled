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
import com.google.android.gms.internal.zznh;
import com.google.android.gms.internal.zznh.zza;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public class DataSourcesRequest
  implements SafeParcelable
{
  public static final Parcelable.Creator<DataSourcesRequest> CREATOR = new zzj();
  private final int zzFG;
  private final String zzFO;
  private final List<DataType> zzYA;
  private final List<Integer> zzabd;
  private final boolean zzabe;
  private final zznh zzabf;

  DataSourcesRequest(int paramInt, List<DataType> paramList, List<Integer> paramList1, boolean paramBoolean, IBinder paramIBinder, String paramString)
  {
    this.zzFG = paramInt;
    this.zzYA = paramList;
    this.zzabd = paramList1;
    this.zzabe = paramBoolean;
    if (paramIBinder == null);
    for (zznh localzznh = null; ; localzznh = zznh.zza.zzaE(paramIBinder))
    {
      this.zzabf = localzznh;
      this.zzFO = paramString;
      return;
    }
  }

  private DataSourcesRequest(Builder paramBuilder)
  {
    this(zzls.zzb(Builder.zza(paramBuilder)), Arrays.asList(zzls.zza(Builder.zzb(paramBuilder))), Builder.zzc(paramBuilder), null, null);
  }

  public DataSourcesRequest(DataSourcesRequest paramDataSourcesRequest, zznh paramzznh, String paramString)
  {
    this(paramDataSourcesRequest.zzYA, paramDataSourcesRequest.zzabd, paramDataSourcesRequest.zzabe, paramzznh, paramString);
  }

  public DataSourcesRequest(List<DataType> paramList, List<Integer> paramList1, boolean paramBoolean, zznh paramzznh, String paramString)
  {
    this.zzFG = 3;
    this.zzYA = paramList;
    this.zzabd = paramList1;
    this.zzabe = paramBoolean;
    this.zzabf = paramzznh;
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

  int getVersionCode()
  {
    return this.zzFG;
  }

  public String toString()
  {
    zzw.zza localzza = zzw.zzk(this).zza("dataTypes", this.zzYA).zza("sourceTypes", this.zzabd);
    if (this.zzabe)
      localzza.zza("includeDbOnlySources", "true");
    return localzza.toString();
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzj.zza(this, paramParcel, paramInt);
  }

  public IBinder zzlQ()
  {
    if (this.zzabf == null)
      return null;
    return this.zzabf.asBinder();
  }

  public List<Integer> zzlY()
  {
    return this.zzabd;
  }

  public boolean zzlZ()
  {
    return this.zzabe;
  }

  public static class Builder
  {
    private boolean zzabe = false;
    private DataType[] zzabg = new DataType[0];
    private int[] zzabh = { 0, 1 };

    public DataSourcesRequest build()
    {
      boolean bool1 = true;
      boolean bool2;
      if (this.zzabg.length > 0)
      {
        bool2 = bool1;
        zzx.zza(bool2, "Must add at least one data type");
        if (this.zzabh.length <= 0)
          break label47;
      }
      while (true)
      {
        zzx.zza(bool1, "Must add at least one data source type");
        return new DataSourcesRequest(this, null);
        bool2 = false;
        break;
        label47: bool1 = false;
      }
    }

    public Builder setDataSourceTypes(int[] paramArrayOfInt)
    {
      this.zzabh = paramArrayOfInt;
      return this;
    }

    public Builder setDataTypes(DataType[] paramArrayOfDataType)
    {
      this.zzabg = paramArrayOfDataType;
      return this;
    }
  }
}