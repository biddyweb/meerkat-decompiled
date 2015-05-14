package com.google.android.gms.internal;

import android.app.PendingIntent;
import android.content.Context;
import android.os.RemoteException;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.zza.zzb;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.fitness.SessionsApi;
import com.google.android.gms.fitness.data.Session;
import com.google.android.gms.fitness.request.SessionInsertRequest;
import com.google.android.gms.fitness.request.SessionReadRequest;
import com.google.android.gms.fitness.request.zzai;
import com.google.android.gms.fitness.request.zzak;
import com.google.android.gms.fitness.request.zzam;
import com.google.android.gms.fitness.request.zzao;
import com.google.android.gms.fitness.result.SessionReadResult;
import com.google.android.gms.fitness.result.SessionStopResult;
import java.util.concurrent.TimeUnit;

public class zzog
  implements SessionsApi
{
  private PendingResult<SessionStopResult> zza(GoogleApiClient paramGoogleApiClient, final String paramString1, final String paramString2)
  {
    return paramGoogleApiClient.zzb(new zznf.zza(paramGoogleApiClient)
    {
      protected void zza(zznf paramAnonymouszznf)
        throws RemoteException
      {
        zzog.zzb localzzb = new zzog.zzb(this, null);
        String str = paramAnonymouszznf.getContext().getPackageName();
        ((zznp)paramAnonymouszznf.zzjb()).zza(new zzam(paramString1, paramString2, localzzb, str));
      }

      protected SessionStopResult zzz(Status paramAnonymousStatus)
      {
        return SessionStopResult.zzG(paramAnonymousStatus);
      }
    });
  }

  public PendingResult<Status> insertSession(GoogleApiClient paramGoogleApiClient, final SessionInsertRequest paramSessionInsertRequest)
  {
    return paramGoogleApiClient.zza(new zznf.zzc(paramGoogleApiClient)
    {
      protected void zza(zznf paramAnonymouszznf)
        throws RemoteException
      {
        zzoh localzzoh = new zzoh(this);
        String str = paramAnonymouszznf.getContext().getPackageName();
        ((zznp)paramAnonymouszznf.zzjb()).zza(new SessionInsertRequest(paramSessionInsertRequest, localzzoh, str));
      }
    });
  }

  public PendingResult<SessionReadResult> readSession(GoogleApiClient paramGoogleApiClient, final SessionReadRequest paramSessionReadRequest)
  {
    return paramGoogleApiClient.zza(new zznf.zza(paramGoogleApiClient)
    {
      protected SessionReadResult zzA(Status paramAnonymousStatus)
      {
        return SessionReadResult.zzF(paramAnonymousStatus);
      }

      protected void zza(zznf paramAnonymouszznf)
        throws RemoteException
      {
        zzog.zza localzza = new zzog.zza(this, null);
        String str = paramAnonymouszznf.getContext().getPackageName();
        ((zznp)paramAnonymouszznf.zzjb()).zza(new SessionReadRequest(paramSessionReadRequest, localzza, str));
      }
    });
  }

  public PendingResult<Status> registerForSessions(GoogleApiClient paramGoogleApiClient, final PendingIntent paramPendingIntent)
  {
    return paramGoogleApiClient.zzb(new zznf.zzc(paramGoogleApiClient)
    {
      protected void zza(zznf paramAnonymouszznf)
        throws RemoteException
      {
        zzoh localzzoh = new zzoh(this);
        String str = paramAnonymouszznf.getContext().getPackageName();
        ((zznp)paramAnonymouszznf.zzjb()).zza(new zzai(paramPendingIntent, localzzoh, str));
      }
    });
  }

  public PendingResult<Status> startSession(GoogleApiClient paramGoogleApiClient, final Session paramSession)
  {
    zzx.zzb(paramSession, "Session cannot be null");
    if (paramSession.getEndTime(TimeUnit.MILLISECONDS) == 0L);
    for (boolean bool = true; ; bool = false)
    {
      zzx.zzb(bool, "Cannot start a session which has already ended");
      return paramGoogleApiClient.zzb(new zznf.zzc(paramGoogleApiClient)
      {
        protected void zza(zznf paramAnonymouszznf)
          throws RemoteException
        {
          zzoh localzzoh = new zzoh(this);
          String str = paramAnonymouszznf.getContext().getPackageName();
          ((zznp)paramAnonymouszznf.zzjb()).zza(new zzak(paramSession, localzzoh, str));
        }
      });
    }
  }

  public PendingResult<SessionStopResult> stopSession(GoogleApiClient paramGoogleApiClient, String paramString)
  {
    return zza(paramGoogleApiClient, null, paramString);
  }

  public PendingResult<Status> unregisterForSessions(GoogleApiClient paramGoogleApiClient, final PendingIntent paramPendingIntent)
  {
    return paramGoogleApiClient.zzb(new zznf.zzc(paramGoogleApiClient)
    {
      protected void zza(zznf paramAnonymouszznf)
        throws RemoteException
      {
        zzoh localzzoh = new zzoh(this);
        String str = paramAnonymouszznf.getContext().getPackageName();
        ((zznp)paramAnonymouszznf.zzjb()).zza(new zzao(paramPendingIntent, localzzoh, str));
      }
    });
  }

  private static class zza extends zznt.zza
  {
    private final zza.zzb<SessionReadResult> zzHa;

    private zza(zza.zzb<SessionReadResult> paramzzb)
    {
      this.zzHa = paramzzb;
    }

    public void zza(SessionReadResult paramSessionReadResult)
      throws RemoteException
    {
      this.zzHa.zzd(paramSessionReadResult);
    }
  }

  private static class zzb extends zznu.zza
  {
    private final zza.zzb<SessionStopResult> zzHa;

    private zzb(zza.zzb<SessionStopResult> paramzzb)
    {
      this.zzHa = paramzzb;
    }

    public void zza(SessionStopResult paramSessionStopResult)
    {
      this.zzHa.zzd(paramSessionStopResult);
    }
  }
}