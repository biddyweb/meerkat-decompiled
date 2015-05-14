package com.google.android.gms.location.places;

import android.content.Context;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.data.AbstractDataBuffer;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.internal.zzqg;

public class PlaceBuffer extends AbstractDataBuffer<Place>
  implements Result
{
  private final Context mContext;
  private final Status zzHb;

  public PlaceBuffer(DataHolder paramDataHolder, Context paramContext)
  {
    super(paramDataHolder);
    this.mContext = paramContext;
    this.zzHb = new Status(paramDataHolder.getStatusCode());
  }

  public Place get(int paramInt)
  {
    return new zzqg(this.zzMd, paramInt, this.mContext);
  }

  public Status getStatus()
  {
    return this.zzHb;
  }
}