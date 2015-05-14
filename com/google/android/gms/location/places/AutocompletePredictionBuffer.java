package com.google.android.gms.location.places;

import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.data.AbstractDataBuffer;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzw.zza;
import com.google.android.gms.internal.zzpq;

public class AutocompletePredictionBuffer extends AbstractDataBuffer<AutocompletePrediction>
  implements Result
{
  public AutocompletePredictionBuffer(DataHolder paramDataHolder)
  {
    super(paramDataHolder);
  }

  public AutocompletePrediction get(int paramInt)
  {
    return new zzpq(this.zzMd, paramInt);
  }

  public Status getStatus()
  {
    return new Status(this.zzMd.getStatusCode());
  }

  public String toString()
  {
    return zzw.zzk(this).zza("status", getStatus()).toString();
  }
}