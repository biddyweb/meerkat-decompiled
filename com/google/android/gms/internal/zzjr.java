package com.google.android.gms.internal;

import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.zza.zza;

public abstract class zzjr<R extends Result> extends zza.zza<R, zzju>
{
  public zzjr(GoogleApiClient paramGoogleApiClient)
  {
    super(zzkb.zzGR, paramGoogleApiClient);
  }

  public void zzah(int paramInt)
  {
    setResult(createFailedResult(new Status(paramInt)));
  }

  public void zzd(int paramInt, String paramString)
  {
    setResult(createFailedResult(new Status(paramInt, paramString, null)));
  }
}