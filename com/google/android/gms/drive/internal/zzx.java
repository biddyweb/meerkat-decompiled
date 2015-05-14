package com.google.android.gms.drive.internal;

import android.os.RemoteException;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.zza.zzb;
import com.google.android.gms.drive.DrivePreferencesApi;
import com.google.android.gms.drive.DrivePreferencesApi.FileUploadPreferencesResult;
import com.google.android.gms.drive.FileUploadPreferences;

public class zzx
  implements DrivePreferencesApi
{
  public PendingResult<DrivePreferencesApi.FileUploadPreferencesResult> getFileUploadPreferences(GoogleApiClient paramGoogleApiClient)
  {
    // Byte code:
    //   0: aload_1
    //   1: new 14\011com/google/android/gms/drive/internal/zzx$1
    //   4: dup
    //   5: aload_0
    //   6: aload_1
    //   7: invokespecial 17\011com/google/android/gms/drive/internal/zzx$1:<init>\011(Lcom/google/android/gms/drive/internal/zzx;Lcom/google/android/gms/common/api/GoogleApiClient;)V
    //   10: invokeinterface 23 2 0
    //   15: areturn
  }

  public PendingResult<Status> setFileUploadPreferences(GoogleApiClient paramGoogleApiClient, FileUploadPreferences paramFileUploadPreferences)
  {
    if (!(paramFileUploadPreferences instanceof FileUploadPreferencesImpl))
      throw new IllegalArgumentException("Invalid preference value");
    return paramGoogleApiClient.zzb(new zzq.zza(paramGoogleApiClient)
    {
      protected void zza(zzr paramAnonymouszzr)
        throws RemoteException
      {
        paramAnonymouszzr.zzkF().zza(new SetFileUploadPreferencesRequest(this.zzUj), new zzbl(this));
      }
    });
  }

  private class zza extends zzc
  {
    private final zza.zzb<DrivePreferencesApi.FileUploadPreferencesResult> zzHa;

    private zza()
    {
      Object localObject;
      this.zzHa = localObject;
    }

    public void zza(OnDeviceUsagePreferenceResponse paramOnDeviceUsagePreferenceResponse)
      throws RemoteException
    {
      this.zzHa.zzd(new zzx.zzb(zzx.this, Status.zzNo, paramOnDeviceUsagePreferenceResponse.zzkN(), null));
    }

    public void zzm(Status paramStatus)
      throws RemoteException
    {
      this.zzHa.zzd(new zzx.zzb(zzx.this, paramStatus, null, null));
    }
  }

  private class zzb
    implements DrivePreferencesApi.FileUploadPreferencesResult
  {
    private final Status zzHb;
    private final FileUploadPreferences zzUk;

    private zzb(Status paramFileUploadPreferences, FileUploadPreferences arg3)
    {
      this.zzHb = paramFileUploadPreferences;
      Object localObject;
      this.zzUk = localObject;
    }

    public FileUploadPreferences getFileUploadPreferences()
    {
      return this.zzUk;
    }

    public Status getStatus()
    {
      return this.zzHb;
    }
  }

  private abstract class zzc extends zzq<DrivePreferencesApi.FileUploadPreferencesResult>
  {
    public zzc(GoogleApiClient arg2)
    {
      super();
    }

    protected DrivePreferencesApi.FileUploadPreferencesResult zzs(Status paramStatus)
    {
      return new zzx.zzb(zzx.this, paramStatus, null, null);
    }
  }
}