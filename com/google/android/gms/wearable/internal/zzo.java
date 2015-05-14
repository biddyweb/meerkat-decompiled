package com.google.android.gms.wearable.internal;

import android.net.Uri;
import android.util.Log;
import com.google.android.gms.wearable.DataItem;
import com.google.android.gms.wearable.DataItemAsset;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

public class zzo
  implements DataItem
{
  private Uri mUri;
  private Map<String, DataItemAsset> zzaGg;
  private byte[] zzakd;

  public zzo(DataItem paramDataItem)
  {
    this.mUri = paramDataItem.getUri();
    this.zzakd = paramDataItem.getData();
    HashMap localHashMap = new HashMap();
    Iterator localIterator = paramDataItem.getAssets().entrySet().iterator();
    while (localIterator.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)localIterator.next();
      if (localEntry.getKey() != null)
        localHashMap.put(localEntry.getKey(), ((DataItemAsset)localEntry.getValue()).freeze());
    }
    this.zzaGg = Collections.unmodifiableMap(localHashMap);
  }

  public Map<String, DataItemAsset> getAssets()
  {
    return this.zzaGg;
  }

  public byte[] getData()
  {
    return this.zzakd;
  }

  public Uri getUri()
  {
    return this.mUri;
  }

  public boolean isDataValid()
  {
    return true;
  }

  public DataItem setData(byte[] paramArrayOfByte)
  {
    throw new UnsupportedOperationException();
  }

  public String toString()
  {
    return toString(Log.isLoggable("DataItem", 3));
  }

  public String toString(boolean paramBoolean)
  {
    StringBuilder localStringBuilder1 = new StringBuilder("DataItemEntity[");
    localStringBuilder1.append("@");
    localStringBuilder1.append(Integer.toHexString(hashCode()));
    StringBuilder localStringBuilder2 = new StringBuilder().append(",dataSz=");
    if (this.zzakd == null);
    for (Object localObject = "null"; ; localObject = Integer.valueOf(this.zzakd.length))
    {
      localStringBuilder1.append(localObject);
      localStringBuilder1.append(", numAssets=" + this.zzaGg.size());
      localStringBuilder1.append(", uri=" + this.mUri);
      if (paramBoolean)
        break;
      localStringBuilder1.append("]");
      return localStringBuilder1.toString();
    }
    localStringBuilder1.append("]\n  assets: ");
    Iterator localIterator = this.zzaGg.keySet().iterator();
    while (localIterator.hasNext())
    {
      String str = (String)localIterator.next();
      localStringBuilder1.append("\n    " + str + ": " + this.zzaGg.get(str));
    }
    localStringBuilder1.append("\n  ]");
    return localStringBuilder1.toString();
  }

  public DataItem zzvj()
  {
    return this;
  }
}