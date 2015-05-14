package com.google.android.gms.internal;

import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.plus.Account;
import com.google.android.gms.plus.Plus;
import com.google.android.gms.plus.Plus.zza;
import com.google.android.gms.plus.internal.zze;

public final class zztm
  implements Account
{
  public void clearDefaultAccount(GoogleApiClient paramGoogleApiClient)
  {
    zze localzze = Plus.zzf(paramGoogleApiClient, false);
    if (localzze != null)
      localzze.zzrK();
  }

  public String getAccountName(GoogleApiClient paramGoogleApiClient)
  {
    return Plus.zzf(paramGoogleApiClient, true).getAccountName();
  }

  public PendingResult<Status> revokeAccessAndDisconnect(GoogleApiClient paramGoogleApiClient)
  {
    // Byte code:
    //   0: aload_1
    //   1: new 32\011com/google/android/gms/internal/zztm$1
    //   4: dup
    //   5: aload_0
    //   6: aload_1
    //   7: invokespecial 35\011com/google/android/gms/internal/zztm$1:<init>\011(Lcom/google/android/gms/internal/zztm;Lcom/google/android/gms/common/api/GoogleApiClient;)V
    //   10: invokeinterface 41 2 0
    //   15: areturn
  }

  private static abstract class zza extends Plus.zza<Status>
  {
    private zza(GoogleApiClient paramGoogleApiClient)
    {
      super();
    }

    public Status zzb(Status paramStatus)
    {
      return paramStatus;
    }
  }
}