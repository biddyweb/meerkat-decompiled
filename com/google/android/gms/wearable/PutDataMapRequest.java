package com.google.android.gms.wearable;

import android.net.Uri;
import android.util.Log;
import com.google.android.gms.internal.zzwm;
import com.google.android.gms.internal.zzwm.zza;
import com.google.android.gms.internal.zzwy;
import java.util.List;

public class PutDataMapRequest
{
  private final DataMap zzaFy;
  private final PutDataRequest zzaFz;

  private PutDataMapRequest(PutDataRequest paramPutDataRequest, DataMap paramDataMap)
  {
    this.zzaFz = paramPutDataRequest;
    this.zzaFy = new DataMap();
    if (paramDataMap != null)
      this.zzaFy.putAll(paramDataMap);
  }

  public static PutDataMapRequest create(String paramString)
  {
    return new PutDataMapRequest(PutDataRequest.create(paramString), null);
  }

  public static PutDataMapRequest createFromDataMapItem(DataMapItem paramDataMapItem)
  {
    return new PutDataMapRequest(PutDataRequest.zzn(paramDataMapItem.getUri()), paramDataMapItem.getDataMap());
  }

  public static PutDataMapRequest createWithAutoAppendedId(String paramString)
  {
    return new PutDataMapRequest(PutDataRequest.createWithAutoAppendedId(paramString), null);
  }

  public PutDataRequest asPutDataRequest()
  {
    zzwm.zza localzza = zzwm.zza(this.zzaFy);
    this.zzaFz.setData(zzwy.zzf(localzza.zzaGQ));
    int i = localzza.zzaGR.size();
    for (int j = 0; j < i; j++)
    {
      String str = Integer.toString(j);
      Asset localAsset = (Asset)localzza.zzaGR.get(j);
      if (str == null)
        throw new IllegalStateException("asset key cannot be null: " + localAsset);
      if (localAsset == null)
        throw new IllegalStateException("asset cannot be null: key=" + str);
      if (Log.isLoggable("DataMap", 3))
        Log.d("DataMap", "asPutDataRequest: adding asset: " + str + " " + localAsset);
      this.zzaFz.putAsset(str, localAsset);
    }
    return this.zzaFz;
  }

  public DataMap getDataMap()
  {
    return this.zzaFy;
  }

  public Uri getUri()
  {
    return this.zzaFz.getUri();
  }
}