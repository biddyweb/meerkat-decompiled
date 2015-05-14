package com.google.android.gms.wearable.internal;

import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.common.data.zzd;
import com.google.android.gms.wearable.DataItemAsset;

public class zzn extends zzd
  implements DataItemAsset
{
  public zzn(DataHolder paramDataHolder, int paramInt)
  {
    super(paramDataHolder, paramInt);
  }

  public String getDataItemKey()
  {
    return getString("asset_key");
  }

  public String getId()
  {
    return getString("asset_id");
  }

  public DataItemAsset zzvi()
  {
    return new zzl(this);
  }
}