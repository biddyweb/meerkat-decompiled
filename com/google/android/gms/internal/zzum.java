package com.google.android.gms.internal;

import android.os.RemoteException;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.safetynet.SafetyNetApi;
import com.google.android.gms.safetynet.SafetyNetApi.AttestationResult;
import com.google.android.gms.safetynet.zza;

public class zzum
  implements SafetyNetApi
{
  public PendingResult<SafetyNetApi.AttestationResult> attest(GoogleApiClient paramGoogleApiClient, final byte[] paramArrayOfByte)
  {
    return paramGoogleApiClient.zza(new zzb(paramGoogleApiClient)
    {
      protected void zza(zzun paramAnonymouszzun)
        throws RemoteException
      {
        paramAnonymouszzun.zza(this.zzawK, paramArrayOfByte);
      }
    });
  }

  static class zza
    implements SafetyNetApi.AttestationResult
  {
    private final Status zzHb;
    private final zza zzawJ;

    public zza(Status paramStatus, zza paramzza)
    {
      this.zzHb = paramStatus;
      this.zzawJ = paramzza;
    }

    public String getJwsResult()
    {
      if (this.zzawJ == null)
        return null;
      return this.zzawJ.getJwsResult();
    }

    public Status getStatus()
    {
      return this.zzHb;
    }
  }

  static abstract class zzb extends zzuj<SafetyNetApi.AttestationResult>
  {
    protected zzuk zzawK = new zzui()
    {
      public void zza(Status paramAnonymousStatus, zza paramAnonymouszza)
      {
        zzum.zzb.this.setResult(new zzum.zza(paramAnonymousStatus, paramAnonymouszza));
      }
    };

    public zzb(GoogleApiClient paramGoogleApiClient)
    {
      super();
    }

    protected SafetyNetApi.AttestationResult zzaL(Status paramStatus)
    {
      return new zzum.zza(paramStatus, null);
    }
  }
}