package com.google.android.gms.wearable;

import android.net.Uri;
import com.google.android.gms.internal.zzwm;
import com.google.android.gms.internal.zzwm.zza;
import com.google.android.gms.internal.zzwn;
import com.google.android.gms.internal.zzwx;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class DataMapItem
{
  private final Uri mUri;
  private final DataMap zzaFy;

  private DataMapItem(DataItem paramDataItem)
  {
    this.mUri = paramDataItem.getUri();
    this.zzaFy = zza((DataItem)paramDataItem.freeze());
  }

  public static DataMapItem fromDataItem(DataItem paramDataItem)
  {
    if (paramDataItem == null)
      throw new IllegalStateException("provided dataItem is null");
    return new DataMapItem(paramDataItem);
  }

  private DataMap zza(DataItem paramDataItem)
  {
    if ((paramDataItem.getData() == null) && (paramDataItem.getAssets().size() > 0))
      throw new IllegalArgumentException("Cannot create DataMapItem from a DataItem  that wasn't made with DataMapItem.");
    if (paramDataItem.getData() == null)
      return new DataMap();
    ArrayList localArrayList;
    while (true)
    {
      int j;
      DataItemAsset localDataItemAsset;
      try
      {
        localArrayList = new ArrayList();
        int i = paramDataItem.getAssets().size();
        j = 0;
        if (j >= i)
          break;
        localDataItemAsset = (DataItemAsset)paramDataItem.getAssets().get(Integer.toString(j));
        if (localDataItemAsset == null)
          throw new IllegalStateException("Cannot find DataItemAsset referenced in data at " + j + " for " + paramDataItem);
      }
      catch (zzwx localzzwx)
      {
        throw new IllegalStateException("Unable to parse. Not a DataItem.");
      }
      localArrayList.add(Asset.createFromRef(localDataItemAsset.getId()));
      j++;
    }
    DataMap localDataMap = zzwm.zza(new zzwm.zza(zzwn.zzq(paramDataItem.getData()), localArrayList));
    return localDataMap;
  }

  public DataMap getDataMap()
  {
    return this.zzaFy;
  }

  public Uri getUri()
  {
    return this.mUri;
  }
}