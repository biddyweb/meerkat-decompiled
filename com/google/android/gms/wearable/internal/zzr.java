package com.google.android.gms.wearable.internal;

import android.net.Uri;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.common.data.zzd;
import com.google.android.gms.wearable.DataItem;
import com.google.android.gms.wearable.DataItemAsset;
import java.util.HashMap;
import java.util.Map;

public final class zzr extends zzd
  implements DataItem
{
  private final int zzadF;

  public zzr(DataHolder paramDataHolder, int paramInt1, int paramInt2)
  {
    super(paramDataHolder, paramInt1);
    this.zzadF = paramInt2;
  }

  public Map<String, DataItemAsset> getAssets()
  {
    HashMap localHashMap = new HashMap(this.zzadF);
    int i = 0;
    if (i < this.zzadF)
    {
      zzn localzzn = new zzn(this.zzMd, i + this.zzNQ);
      if (localzzn.getDataItemKey() == null);
      while (true)
      {
        i++;
        break;
        localHashMap.put(localzzn.getDataItemKey(), localzzn);
      }
    }
    return localHashMap;
  }

  public byte[] getData()
  {
    return getByteArray("data");
  }

  public Uri getUri()
  {
    return Uri.parse(getString("path"));
  }

  public DataItem setData(byte[] paramArrayOfByte)
  {
    throw new UnsupportedOperationException();
  }

  public DataItem zzvj()
  {
    return new zzo(this);
  }
}