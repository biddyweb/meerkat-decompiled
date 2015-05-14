package com.google.android.gms.wearable.internal;

import android.net.Uri;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import android.util.Log;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.wearable.DataItem;
import com.google.android.gms.wearable.DataItemAsset;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

public class zzp
  implements SafeParcelable, DataItem
{
  public static final Parcelable.Creator<zzp> CREATOR = new zzq();
  private final Uri mUri;
  final int zzFG;
  private final Map<String, DataItemAsset> zzaGg;
  private byte[] zzakd;

  zzp(int paramInt, Uri paramUri, Bundle paramBundle, byte[] paramArrayOfByte)
  {
    this.zzFG = paramInt;
    this.mUri = paramUri;
    HashMap localHashMap = new HashMap();
    paramBundle.setClassLoader(DataItemAssetParcelable.class.getClassLoader());
    Iterator localIterator = paramBundle.keySet().iterator();
    while (localIterator.hasNext())
    {
      String str = (String)localIterator.next();
      localHashMap.put(str, (DataItemAssetParcelable)paramBundle.getParcelable(str));
    }
    this.zzaGg = localHashMap;
    this.zzakd = paramArrayOfByte;
  }

  public int describeContents()
  {
    return 0;
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

  public String toString()
  {
    return toString(Log.isLoggable("DataItem", 3));
  }

  public String toString(boolean paramBoolean)
  {
    StringBuilder localStringBuilder1 = new StringBuilder("DataItemParcelable[");
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

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzq.zza(this, paramParcel, paramInt);
  }

  public zzp zzp(byte[] paramArrayOfByte)
  {
    this.zzakd = paramArrayOfByte;
    return this;
  }

  public Bundle zzuY()
  {
    Bundle localBundle = new Bundle();
    localBundle.setClassLoader(DataItemAssetParcelable.class.getClassLoader());
    Iterator localIterator = this.zzaGg.entrySet().iterator();
    while (localIterator.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)localIterator.next();
      localBundle.putParcelable((String)localEntry.getKey(), new DataItemAssetParcelable((DataItemAsset)localEntry.getValue()));
    }
    return localBundle;
  }

  public zzp zzvk()
  {
    return this;
  }
}