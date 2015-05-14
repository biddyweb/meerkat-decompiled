package com.google.android.gms.internal;

import android.net.Uri;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.plus.Moments;
import com.google.android.gms.plus.Moments.LoadMomentsResult;
import com.google.android.gms.plus.Plus.zza;
import com.google.android.gms.plus.internal.zze;
import com.google.android.gms.plus.model.moments.Moment;
import com.google.android.gms.plus.model.moments.MomentBuffer;

public final class zztp
  implements Moments
{
  public PendingResult<Moments.LoadMomentsResult> load(GoogleApiClient paramGoogleApiClient)
  {
    // Byte code:
    //   0: aload_1
    //   1: new 14\011com/google/android/gms/internal/zztp$1
    //   4: dup
    //   5: aload_0
    //   6: aload_1
    //   7: invokespecial 17\011com/google/android/gms/internal/zztp$1:<init>\011(Lcom/google/android/gms/internal/zztp;Lcom/google/android/gms/common/api/GoogleApiClient;)V
    //   10: invokeinterface 23 2 0
    //   15: areturn
  }

  public PendingResult<Moments.LoadMomentsResult> load(GoogleApiClient paramGoogleApiClient, final int paramInt, final String paramString1, final Uri paramUri, final String paramString2, final String paramString3)
  {
    return paramGoogleApiClient.zza(new zza(paramGoogleApiClient, paramInt)
    {
      protected void zza(zze paramAnonymouszze)
      {
        paramAnonymouszze.zza(this, paramInt, paramString1, paramUri, paramString2, paramString3);
      }
    });
  }

  public PendingResult<Status> remove(GoogleApiClient paramGoogleApiClient, final String paramString)
  {
    return paramGoogleApiClient.zzb(new zzb(paramGoogleApiClient, paramString)
    {
      protected void zza(zze paramAnonymouszze)
      {
        paramAnonymouszze.zzcE(paramString);
        setResult(Status.zzNo);
      }
    });
  }

  public PendingResult<Status> write(GoogleApiClient paramGoogleApiClient, final Moment paramMoment)
  {
    return paramGoogleApiClient.zzb(new zzc(paramGoogleApiClient, paramMoment)
    {
      protected void zza(zze paramAnonymouszze)
      {
        paramAnonymouszze.zza(this, paramMoment);
      }
    });
  }

  private static abstract class zza extends Plus.zza<Moments.LoadMomentsResult>
  {
    private zza(GoogleApiClient paramGoogleApiClient)
    {
      super();
    }

    public Moments.LoadMomentsResult zzaJ(final Status paramStatus)
    {
      return new Moments.LoadMomentsResult()
      {
        public MomentBuffer getMomentBuffer()
        {
          return null;
        }

        public String getNextPageToken()
        {
          return null;
        }

        public Status getStatus()
        {
          return paramStatus;
        }

        public String getUpdated()
        {
          return null;
        }

        public void release()
        {
        }
      };
    }
  }

  private static abstract class zzb extends Plus.zza<Status>
  {
    private zzb(GoogleApiClient paramGoogleApiClient)
    {
      super();
    }

    public Status zzb(Status paramStatus)
    {
      return paramStatus;
    }
  }

  private static abstract class zzc extends Plus.zza<Status>
  {
    private zzc(GoogleApiClient paramGoogleApiClient)
    {
      super();
    }

    public Status zzb(Status paramStatus)
    {
      return paramStatus;
    }
  }
}