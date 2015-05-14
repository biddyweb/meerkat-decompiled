package com.google.android.gms.drive.internal;

import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.zza.zza;
import com.google.android.gms.drive.Drive;

public abstract class zzq<R extends Result> extends zza.zza<R, zzr>
{
  public zzq(GoogleApiClient paramGoogleApiClient)
  {
    super(Drive.zzGR, paramGoogleApiClient);
  }

  public static abstract class zza extends zzq<Status>
  {
    public zza(GoogleApiClient paramGoogleApiClient)
    {
      super();
    }

    protected Status zzb(Status paramStatus)
    {
      return paramStatus;
    }
  }
}