package com.google.android.gms.internal;

import android.content.Context;
import android.os.Looper;
import android.os.RemoteException;
import com.google.android.gms.common.api.Api.ApiOptions.NoOptions;
import com.google.android.gms.common.api.Api.zzb;
import com.google.android.gms.common.api.Api.zzc;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.GoogleApiClient.ConnectionCallbacks;
import com.google.android.gms.common.api.GoogleApiClient.OnConnectionFailedListener;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.zza.zza;
import com.google.android.gms.common.api.zze;
import com.google.android.gms.common.internal.zzf;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.nearby.Nearby;
import com.google.android.gms.nearby.connection.AppMetadata;
import com.google.android.gms.nearby.connection.Connections;
import com.google.android.gms.nearby.connection.Connections.ConnectionRequestListener;
import com.google.android.gms.nearby.connection.Connections.ConnectionResponseCallback;
import com.google.android.gms.nearby.connection.Connections.EndpointDiscoveryListener;
import com.google.android.gms.nearby.connection.Connections.MessageListener;
import com.google.android.gms.nearby.connection.Connections.StartAdvertisingResult;
import java.util.List;

public final class zzrl
  implements Connections
{
  public static final Api.zzc<zzrk> zzGR = new Api.zzc();
  public static final Api.zzb<zzrk, Api.ApiOptions.NoOptions> zzGS = new Api.zzb()
  {
    public int getPriority()
    {
      return 2147483647;
    }

    public zzrk zzl(Context paramAnonymousContext, Looper paramAnonymousLooper, zzf paramAnonymouszzf, Api.ApiOptions.NoOptions paramAnonymousNoOptions, GoogleApiClient.ConnectionCallbacks paramAnonymousConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener paramAnonymousOnConnectionFailedListener)
    {
      return new zzrk(paramAnonymousContext, paramAnonymousLooper, paramAnonymousConnectionCallbacks, paramAnonymousOnConnectionFailedListener);
    }
  };

  public static zzrk zzd(GoogleApiClient paramGoogleApiClient, boolean paramBoolean)
  {
    if (paramGoogleApiClient != null);
    for (boolean bool = true; ; bool = false)
    {
      zzx.zzb(bool, "GoogleApiClient parameter is required.");
      zzx.zza(paramGoogleApiClient.isConnected(), "GoogleApiClient must be connected.");
      return zze(paramGoogleApiClient, paramBoolean);
    }
  }

  public static zzrk zze(GoogleApiClient paramGoogleApiClient, boolean paramBoolean)
  {
    zzx.zza(paramGoogleApiClient.zza(Nearby.CONNECTIONS_API), "GoogleApiClient is not configured to use the Nearby Connections Api. Pass Nearby.CONNECTIONS_API into GoogleApiClient.Builder#addApi() to use this feature.");
    boolean bool = paramGoogleApiClient.zzb(Nearby.CONNECTIONS_API);
    if ((paramBoolean) && (!bool))
      throw new IllegalStateException("GoogleApiClient has an optional Nearby.CONNECTIONS_API and is not connected to Nearby Connections. Use GoogleApiClient.hasConnectedApi(Nearby.CONNECTIONS_API) to guard this call.");
    if (bool)
      return (zzrk)paramGoogleApiClient.zza(zzGR);
    return null;
  }

  public PendingResult<Status> acceptConnectionRequest(GoogleApiClient paramGoogleApiClient, final String paramString, final byte[] paramArrayOfByte, Connections.MessageListener paramMessageListener)
  {
    return paramGoogleApiClient.zzb(new zzc(paramGoogleApiClient, paramString)
    {
      protected void zza(zzrk paramAnonymouszzrk)
        throws RemoteException
      {
        paramAnonymouszzrk.zza(this, paramString, paramArrayOfByte, this.zzatd);
      }
    });
  }

  public void disconnectFromEndpoint(GoogleApiClient paramGoogleApiClient, String paramString)
  {
    zzd(paramGoogleApiClient, false).zzcy(paramString);
  }

  public String getLocalDeviceId(GoogleApiClient paramGoogleApiClient)
  {
    return zzd(paramGoogleApiClient, true).zzrl();
  }

  public String getLocalEndpointId(GoogleApiClient paramGoogleApiClient)
  {
    return zzd(paramGoogleApiClient, true).zzrk();
  }

  public PendingResult<Status> rejectConnectionRequest(GoogleApiClient paramGoogleApiClient, final String paramString)
  {
    return paramGoogleApiClient.zzb(new zzc(paramGoogleApiClient, paramString)
    {
      protected void zza(zzrk paramAnonymouszzrk)
        throws RemoteException
      {
        paramAnonymouszzrk.zzq(this, paramString);
      }
    });
  }

  public PendingResult<Status> sendConnectionRequest(GoogleApiClient paramGoogleApiClient, final String paramString1, final String paramString2, final byte[] paramArrayOfByte, Connections.ConnectionResponseCallback paramConnectionResponseCallback, Connections.MessageListener paramMessageListener)
  {
    return paramGoogleApiClient.zzb(new zzc(paramGoogleApiClient, paramString1)
    {
      protected void zza(zzrk paramAnonymouszzrk)
        throws RemoteException
      {
        paramAnonymouszzrk.zza(this, paramString1, paramString2, paramArrayOfByte, this.zzatc, this.zzatd);
      }
    });
  }

  public void sendReliableMessage(GoogleApiClient paramGoogleApiClient, String paramString, byte[] paramArrayOfByte)
  {
    zzd(paramGoogleApiClient, false).zza(new String[] { paramString }, paramArrayOfByte);
  }

  public void sendReliableMessage(GoogleApiClient paramGoogleApiClient, List<String> paramList, byte[] paramArrayOfByte)
  {
    zzd(paramGoogleApiClient, false).zza((String[])paramList.toArray(new String[paramList.size()]), paramArrayOfByte);
  }

  public void sendUnreliableMessage(GoogleApiClient paramGoogleApiClient, String paramString, byte[] paramArrayOfByte)
  {
    zzd(paramGoogleApiClient, false).zzb(new String[] { paramString }, paramArrayOfByte);
  }

  public void sendUnreliableMessage(GoogleApiClient paramGoogleApiClient, List<String> paramList, byte[] paramArrayOfByte)
  {
    zzd(paramGoogleApiClient, false).zzb((String[])paramList.toArray(new String[paramList.size()]), paramArrayOfByte);
  }

  public PendingResult<Connections.StartAdvertisingResult> startAdvertising(GoogleApiClient paramGoogleApiClient, final String paramString, final AppMetadata paramAppMetadata, final long paramLong, Connections.ConnectionRequestListener paramConnectionRequestListener)
  {
    return paramGoogleApiClient.zzb(new zzb(paramGoogleApiClient, paramString)
    {
      protected void zza(zzrk paramAnonymouszzrk)
        throws RemoteException
      {
        paramAnonymouszzrk.zza(this, paramString, paramAppMetadata, paramLong, this.zzasZ);
      }
    });
  }

  public PendingResult<Status> startDiscovery(GoogleApiClient paramGoogleApiClient, final String paramString, final long paramLong, Connections.EndpointDiscoveryListener paramEndpointDiscoveryListener)
  {
    return paramGoogleApiClient.zzb(new zzc(paramGoogleApiClient, paramString)
    {
      protected void zza(zzrk paramAnonymouszzrk)
        throws RemoteException
      {
        paramAnonymouszzrk.zza(this, paramString, paramLong, this.zzatb);
      }
    });
  }

  public void stopAdvertising(GoogleApiClient paramGoogleApiClient)
  {
    zzd(paramGoogleApiClient, false).zzrm();
  }

  public void stopAllEndpoints(GoogleApiClient paramGoogleApiClient)
  {
    zzd(paramGoogleApiClient, false).zzrn();
  }

  public void stopDiscovery(GoogleApiClient paramGoogleApiClient, String paramString)
  {
    zzd(paramGoogleApiClient, false).zzcx(paramString);
  }

  private static abstract class zza<R extends Result> extends zza.zza<R, zzrk>
  {
    public zza(GoogleApiClient paramGoogleApiClient)
    {
      super(paramGoogleApiClient);
    }
  }

  private static abstract class zzb extends zzrl.zza<Connections.StartAdvertisingResult>
  {
    private zzb(GoogleApiClient paramGoogleApiClient)
    {
      super();
    }

    public Connections.StartAdvertisingResult zzaF(final Status paramStatus)
    {
      return new Connections.StartAdvertisingResult()
      {
        public String getLocalEndpointName()
        {
          return null;
        }

        public Status getStatus()
        {
          return paramStatus;
        }
      };
    }
  }

  private static abstract class zzc extends zzrl.zza<Status>
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