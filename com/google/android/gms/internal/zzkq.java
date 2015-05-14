package com.google.android.gms.internal;

import android.os.RemoteException;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.zza.zzb;

public final class zzkq
  implements zzkp
{
  public PendingResult<Status> zzc(GoogleApiClient paramGoogleApiClient)
  {
    return paramGoogleApiClient.zzb(new zzkr.zza(paramGoogleApiClient)
    {
      protected void zza(zzks paramAnonymouszzks)
        throws RemoteException
      {
        ((zzku)paramAnonymouszzks.zzjb()).zza(new zzkq.zza(this));
      }
    });
  }

  private static class zza extends zzkn
  {
    private final zza.zzb<Status> zzHa;

    public zza(zza.zzb<Status> paramzzb)
    {
      this.zzHa = paramzzb;
    }

    public void zzaQ(int paramInt)
      throws RemoteException
    {
      this.zzHa.zzd(new Status(paramInt));
    }
  }
}