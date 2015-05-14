package com.google.android.gms.wearable.internal;

import com.google.android.gms.wearable.DataItemAsset;

public class zzl
  implements DataItemAsset
{
  private final String zzFA;
  private final String zzqd;

  public zzl(DataItemAsset paramDataItemAsset)
  {
    this.zzFA = paramDataItemAsset.getId();
    this.zzqd = paramDataItemAsset.getDataItemKey();
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
    localStringBuilder.append("DataItemAssetEntity[");
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

  public DataItemAsset zzvi()
  {
    return this;
  }
}