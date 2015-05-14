package com.google.android.gms.wearable.internal;

import android.content.IntentFilter;
import android.os.RemoteException;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.wearable.MessageApi;
import com.google.android.gms.wearable.MessageApi.MessageListener;
import com.google.android.gms.wearable.MessageApi.SendMessageResult;

public final class zzak
  implements MessageApi
{
  private PendingResult<Status> zza(GoogleApiClient paramGoogleApiClient, MessageApi.MessageListener paramMessageListener, IntentFilter[] paramArrayOfIntentFilter)
  {
    return paramGoogleApiClient.zza(new zza(paramGoogleApiClient, paramMessageListener, paramArrayOfIntentFilter, null));
  }

  public PendingResult<Status> addListener(GoogleApiClient paramGoogleApiClient, MessageApi.MessageListener paramMessageListener)
  {
    return zza(paramGoogleApiClient, paramMessageListener, null);
  }

  public PendingResult<Status> removeListener(GoogleApiClient paramGoogleApiClient, final MessageApi.MessageListener paramMessageListener)
  {
    return paramGoogleApiClient.zza(new zzg(paramGoogleApiClient)
    {
      protected void zza(zzbd paramAnonymouszzbd)
        throws RemoteException
      {
        paramAnonymouszzbd.zza(this, paramMessageListener);
      }

      public Status zzb(Status paramAnonymousStatus)
      {
        return paramAnonymousStatus;
      }
    });
  }

  public PendingResult<MessageApi.SendMessageResult> sendMessage(GoogleApiClient paramGoogleApiClient, final String paramString1, final String paramString2, final byte[] paramArrayOfByte)
  {
    return paramGoogleApiClient.zza(new zzg(paramGoogleApiClient)
    {
      protected void zza(zzbd paramAnonymouszzbd)
        throws RemoteException
      {
        paramAnonymouszzbd.zza(this, paramString1, paramString2, paramArrayOfByte);
      }

      protected MessageApi.SendMessageResult zzaT(Status paramAnonymousStatus)
      {
        return new zzak.zzb(paramAnonymousStatus, -1);
      }
    });
  }

  private static final class zza extends zzg<Status>
  {
    private IntentFilter[] zzaGb;
    private MessageApi.MessageListener zzaGv;

    private zza(GoogleApiClient paramGoogleApiClient, MessageApi.MessageListener paramMessageListener, IntentFilter[] paramArrayOfIntentFilter)
    {
      super();
      this.zzaGv = paramMessageListener;
      this.zzaGb = paramArrayOfIntentFilter;
    }

    protected void zza(zzbd paramzzbd)
      throws RemoteException
    {
      paramzzbd.zza(this, this.zzaGv, this.zzaGb);
      this.zzaGv = null;
      this.zzaGb = null;
    }

    public Status zzb(Status paramStatus)
    {
      this.zzaGv = null;
      this.zzaGb = null;
      return paramStatus;
    }
  }

  public static class zzb
    implements MessageApi.SendMessageResult
  {
    private final Status zzHb;
    private final int zzRV;

    public zzb(Status paramStatus, int paramInt)
    {
      this.zzHb = paramStatus;
      this.zzRV = paramInt;
    }

    public int getRequestId()
    {
      return this.zzRV;
    }

    public Status getStatus()
    {
      return this.zzHb;
    }
  }
}