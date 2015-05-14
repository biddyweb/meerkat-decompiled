package com.google.android.gms.wearable.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.wearable.DataItemAsset;

public class DataItemAssetParcelable
  implements SafeParcelable, DataItemAsset
{
  public static final Parcelable.Creator<DataItemAssetParcelable> CREATOR = new zzm();
  private final String zzFA;
  final int zzFG;
  private final String zzqd;

  DataItemAssetParcelable(int paramInt, String paramString1, String paramString2)
  {
    this.zzFG = paramInt;
    this.zzFA = paramString1;
    this.zzqd = paramString2;
  }

  public DataItemAssetParcelable(DataItemAsset paramDataItemAsset)
  {
    this.zzFG = 1;
    this.zzFA = ((String)zzx.zzl(paramDataItemAsset.getId()));
    this.zzqd = ((String)zzx.zzl(paramDataItemAsset.getDataItemKey()));
  }

  public int describeContents()
  {
    return 0;
  }

  public String getDataItemKey()
  {
    return this.zzqd;
  }

  public String getId()
  {
    return this.zzFA;
  }

  public boolean isDataValid()
  {
    return true;
  }

  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("DataItemAssetParcelable[");
    localStringBuilder.append("@");
    localStringBuilder.append(Integer.toHexString(hashCode()));
    if (this.zzFA == null)
      localStringBuilder.append(",noid");
    while (true)
    {
      localStringBuilder.append(", key=");
      localStringBuilder.append(this.zzqd);
      localStringBuilder.append("]");
      return localStringBuilder.toString();
      localStringBuilder.append(",");
      localStringBuilder.append(this.zzFA);
    }
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzm.zza(this, paramParcel, paramInt);
  }

  public DataItemAsset zzvi()
  {
    return this;
  }
}