package com.google.android.gms.internal;

import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.plus.People;
import com.google.android.gms.plus.People.LoadPeopleResult;
import com.google.android.gms.plus.Plus;
import com.google.android.gms.plus.Plus.zza;
import com.google.android.gms.plus.internal.zze;
import com.google.android.gms.plus.model.people.Person;
import com.google.android.gms.plus.model.people.PersonBuffer;
import java.util.Collection;

public final class zztq
  implements People
{
  public Person getCurrentPerson(GoogleApiClient paramGoogleApiClient)
  {
    return Plus.zzf(paramGoogleApiClient, true).zzrO();
  }

  public PendingResult<People.LoadPeopleResult> load(GoogleApiClient paramGoogleApiClient, final Collection<String> paramCollection)
  {
    return paramGoogleApiClient.zza(new zza(paramGoogleApiClient, paramCollection)
    {
      protected void zza(zze paramAnonymouszze)
      {
        paramAnonymouszze.zza(this, paramCollection);
      }
    });
  }

  public PendingResult<People.LoadPeopleResult> load(GoogleApiClient paramGoogleApiClient, final String[] paramArrayOfString)
  {
    return paramGoogleApiClient.zza(new zza(paramGoogleApiClient, paramArrayOfString)
    {
      protected void zza(zze paramAnonymouszze)
      {
        paramAnonymouszze.zzd(this, paramArrayOfString);
      }
    });
  }

  public PendingResult<People.LoadPeopleResult> loadConnected(GoogleApiClient paramGoogleApiClient)
  {
    // Byte code:
    //   0: aload_1
    //   1: new 47\011com/google/android/gms/internal/zztq$3
    //   4: dup
    //   5: aload_0
    //   6: aload_1
    //   7: invokespecial 50\011com/google/android/gms/internal/zztq$3:<init>\011(Lcom/google/android/gms/internal/zztq;Lcom/google/android/gms/common/api/GoogleApiClient;)V
    //   10: invokeinterface 37 2 0
    //   15: areturn
  }

  public PendingResult<People.LoadPeopleResult> loadVisible(GoogleApiClient paramGoogleApiClient, final int paramInt, final String paramString)
  {
    return paramGoogleApiClient.zza(new zza(paramGoogleApiClient, paramInt)
    {
      protected void zza(zze paramAnonymouszze)
      {
        setCancelToken(paramAnonymouszze.zza(this, paramInt, paramString));
      }
    });
  }

  public PendingResult<People.LoadPeopleResult> loadVisible(GoogleApiClient paramGoogleApiClient, final String paramString)
  {
    return paramGoogleApiClient.zza(new zza(paramGoogleApiClient, paramString)
    {
      protected void zza(zze paramAnonymouszze)
      {
        setCancelToken(paramAnonymouszze.zzr(this, paramString));
      }
    });
  }

  private static abstract class zza extends Plus.zza<People.LoadPeopleResult>
  {
    private zza(GoogleApiClient paramGoogleApiClient)
    {
      super();
    }

    public People.LoadPeopleResult zzaK(final Status paramStatus)
    {
      return new People.LoadPeopleResult()
      {
        public String getNextPageToken()
        {
          return null;
        }

        public PersonBuffer getPersonBuffer()
        {
          return null;
        }

        public Status getStatus()
        {
          return paramStatus;
        }

        public void release()
        {
        }
      };
    }
  }
}