package com.google.android.gms.internal;

import android.app.PendingIntent;
import android.os.RemoteException;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.location.ActivityRecognition.zza;
import com.google.android.gms.location.ActivityRecognitionApi;

public class zzov
  implements ActivityRecognitionApi
{
  public PendingResult<Status> removeActivityUpdates(GoogleApiClient paramGoogleApiClient, final PendingIntent paramPendingIntent)
  {
    return paramGoogleApiClient.zzb(new zza(paramGoogleApiClient)
    {
      protected void zza(zzpf paramAnonymouszzpf)
        throws RemoteException
      {
        paramAnonymouszzpf.zza(paramPendingIntent);
        setResult(Status.zzNo);
      }
    });
  }

  public PendingResult<Status> requestActivityUpdates(GoogleApiClient paramGoogleApiClient, final long paramLong, PendingIntent paramPendingIntent)
  {
    return paramGoogleApiClient.zzb(new zza(paramGoogleApiClient)
    {
      protected void zza(zzpf paramAnonymouszzpf)
        throws RemoteException
      {
        paramAnonymouszzpf.zza(paramLong, this.zzamC);
        setResult(Status.zzNo);
      }
    });
  }

  private static abstract class zza extends ActivityRecognition.zza<Status>
  {
    public zza(GoogleApiClient paramGoogleApiClient)
    {
      super();
    }

    public Status zzb(Status paramStatus)
    {
      return paramStatus;
    }
  }
}