package com.google.android.gms.internal;

import android.content.Context;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.location.places.Place;
import com.google.android.gms.location.places.PlaceLikelihood;

public class zzqc extends zzqj
  implements PlaceLikelihood
{
  private final Context mContext;

  public zzqc(DataHolder paramDataHolder, int paramInt, Context paramContext)
  {
    super(paramDataHolder, paramInt);
    this.mContext = paramContext;
  }

  public float getLikelihood()
  {
    return zza("place_likelihood", -1.0F);
  }

  public Place getPlace()
  {
    return new zzqg(this.zzMd, this.zzNQ, this.mContext);
  }

  public PlaceLikelihood zzpX()
  {
    return zzqa.zza((zzpy)getPlace().freeze(), getLikelihood());
  }
}