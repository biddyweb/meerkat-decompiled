package com.google.android.gms.internal;

import android.content.Context;
import android.os.IBinder;
import android.os.Looper;
import android.os.RemoteException;
import android.util.Log;
import com.google.android.gms.common.api.GoogleApiClient.ConnectionCallbacks;
import com.google.android.gms.common.api.GoogleApiClient.OnConnectionFailedListener;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.zza.zzb;
import com.google.android.gms.common.api.zze;
import com.google.android.gms.common.api.zze.zzb;
import com.google.android.gms.common.internal.zzk;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.nearby.connection.AppMetadata;
import com.google.android.gms.nearby.connection.Connections.ConnectionRequestListener;
import com.google.android.gms.nearby.connection.Connections.ConnectionResponseCallback;
import com.google.android.gms.nearby.connection.Connections.EndpointDiscoveryListener;
import com.google.android.gms.nearby.connection.Connections.MessageListener;
import com.google.android.gms.nearby.connection.Connections.StartAdvertisingResult;

public final class zzrk extends zzk<zzrn>
{
  private final long zzadW = hashCode();

  public zzrk(Context paramContext, Looper paramLooper, GoogleApiClient.ConnectionCallbacks paramConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener paramOnConnectionFailedListener)
  {
    super(paramContext, paramLooper, 54, paramConnectionCallbacks, paramOnConnectionFailedListener);
  }

  public void disconnect()
  {
    if (isConnected());
    try
    {
      ((zzrn)zzjb()).zzu(this.zzadW);
      super.disconnect();
      return;
    }
    catch (RemoteException localRemoteException)
    {
      while (true)
        Log.w("NearbyConnectionsClient", "Failed to notify client disconnect.", localRemoteException);
    }
  }

  public void zza(zza.zzb<Status> paramzzb, String paramString, long paramLong, zze<Connections.EndpointDiscoveryListener> paramzze)
    throws RemoteException
  {
    ((zzrn)zzjb()).zza(new zzf(paramzzb, paramzze), paramString, paramLong, this.zzadW);
  }

  public void zza(zza.zzb<Connections.StartAdvertisingResult> paramzzb, String paramString, AppMetadata paramAppMetadata, long paramLong, zze<Connections.ConnectionRequestListener> paramzze)
    throws RemoteException
  {
    ((zzrn)zzjb()).zza(new zzd(paramzzb, paramzze), paramString, paramAppMetadata, paramLong, this.zzadW);
  }

  public void zza(zza.zzb<Status> paramzzb, String paramString1, String paramString2, byte[] paramArrayOfByte, zze<Connections.ConnectionResponseCallback> paramzze, zze<Connections.MessageListener> paramzze1)
    throws RemoteException
  {
    ((zzrn)zzjb()).zza(new zzc(paramzzb, paramzze, paramzze1), paramString1, paramString2, paramArrayOfByte, this.zzadW);
  }

  public void zza(zza.zzb<Status> paramzzb, String paramString, byte[] paramArrayOfByte, zze<Connections.MessageListener> paramzze)
    throws RemoteException
  {
    ((zzrn)zzjb()).zza(new zza(paramzzb, paramzze), paramString, paramArrayOfByte, this.zzadW);
  }

  public void zza(String[] paramArrayOfString, byte[] paramArrayOfByte)
  {
    try
    {
      ((zzrn)zzjb()).zza(paramArrayOfString, paramArrayOfByte, this.zzadW);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      Log.w("NearbyConnectionsClient", "Couldn't send reliable message", localRemoteException);
    }
  }

  public void zzb(String[] paramArrayOfString, byte[] paramArrayOfByte)
  {
    try
    {
      ((zzrn)zzjb()).zzb(paramArrayOfString, paramArrayOfByte, this.zzadW);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      Log.w("NearbyConnectionsClient", "Couldn't send unreliable message", localRemoteException);
    }
  }

  protected String zzcF()
  {
    return "com.google.android.gms.nearby.connection.service.START";
  }

  protected String zzcG()
  {
    return "com.google.android.gms.nearby.internal.connection.INearbyConnectionService";
  }

  protected zzrn zzcg(IBinder paramIBinder)
  {
    return zzrn.zza.zzci(paramIBinder);
  }

  public void zzcx(String paramString)
  {
    try
    {
      ((zzrn)zzjb()).zzb(paramString, this.zzadW);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      Log.w("NearbyConnectionsClient", "Couldn't stop discovery", localRemoteException);
    }
  }

  public void zzcy(String paramString)
  {
    try
    {
      ((zzrn)zzjb()).zzc(paramString, this.zzadW);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      Log.w("NearbyConnectionsClient", "Couldn't disconnect from endpoint", localRemoteException);
    }
  }

  public void zzq(final zza.zzb<Status> paramzzb, String paramString)
    throws RemoteException
  {
    ((zzrn)zzjb()).zza(new zzrj()
    {
      public void zzgw(int paramAnonymousInt)
        throws RemoteException
      {
        paramzzb.zzd(new Status(paramAnonymousInt));
      }
    }
    , paramString, this.zzadW);
  }

  public String zzrk()
  {
    try
    {
      String str = ((zzrn)zzjb()).zzE(this.zzadW);
      return str;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeException(localRemoteException);
    }
  }

  public String zzrl()
  {
    try
    {
      String str = ((zzrn)zzjb()).zzrl();
      return str;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeException(localRemoteException);
    }
  }

  public void zzrm()
  {
    try
    {
      ((zzrn)zzjb()).zzB(this.zzadW);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      Log.w("NearbyConnectionsClient", "Couldn't stop advertising", localRemoteException);
    }
  }

  public void zzrn()
  {
    try
    {
      ((zzrn)zzjb()).zzD(this.zzadW);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      Log.w("NearbyConnectionsClient", "Couldn't stop all endpoints", localRemoteException);
    }
  }

  private static final class zza extends zzrk.zzb
  {
    private final zza.zzb<Status> zzHa;

    public zza(zza.zzb<Status> paramzzb, zze<Connections.MessageListener> paramzze)
    {
      super();
      this.zzHa = ((zza.zzb)zzx.zzl(paramzzb));
    }

    public void zzgv(int paramInt)
      throws RemoteException
    {
      this.zzHa.zzd(new Status(paramInt));
    }
  }

  private static class zzb extends zzrj
  {
    private final zze<Connections.MessageListener> zzasI;

    zzb(zze<Connections.MessageListener> paramzze)
    {
      this.zzasI = paramzze;
    }

    public void onDisconnected(final String paramString)
      throws RemoteException
    {
      this.zzasI.zza(new zze.zzb()
      {
        public void zza(Connections.MessageListener paramAnonymousMessageListener)
        {
          paramAnonymousMessageListener.onDisconnected(paramString);
        }

        public void zzhX()
        {
        }
      });
    }

    public void onMessageReceived(final String paramString, final byte[] paramArrayOfByte, final boolean paramBoolean)
      throws RemoteException
    {
      this.zzasI.zza(new zze.zzb()
      {
        public void zza(Connections.MessageListener paramAnonymousMessageListener)
        {
          paramAnonymousMessageListener.onMessageReceived(paramString, paramArrayOfByte, paramBoolean);
        }

        public void zzhX()
        {
        }
      });
    }
  }

  private static final class zzc extends zzrk.zzb
  {
    private final zza.zzb<Status> zzHa;
    private final zze<Connections.ConnectionResponseCallback> zzasM;

    public zzc(zza.zzb<Status> paramzzb, zze<Connections.ConnectionResponseCallback> paramzze, zze<Connections.MessageListener> paramzze1)
    {
      super();
      this.zzHa = ((zza.zzb)zzx.zzl(paramzzb));
      this.zzasM = ((zze)zzx.zzl(paramzze));
    }

    public void zza(final String paramString, final int paramInt, final byte[] paramArrayOfByte)
      throws RemoteException
    {
      this.zzasM.zza(new zze.zzb()
      {
        public void zza(Connections.ConnectionResponseCallback paramAnonymousConnectionResponseCallback)
        {
          paramAnonymousConnectionResponseCallback.onConnectionResponse(paramString, new Status(paramInt), paramArrayOfByte);
        }

        public void zzhX()
        {
        }
      });
    }

    public void zzgu(int paramInt)
      throws RemoteException
    {
      this.zzHa.zzd(new Status(paramInt));
    }
  }

  private static final class zzd extends zzrj
  {
    private final zza.zzb<Connections.StartAdvertisingResult> zzHa;
    private final zze<Connections.ConnectionRequestListener> zzasO;

    zzd(zza.zzb<Connections.StartAdvertisingResult> paramzzb, zze<Connections.ConnectionRequestListener> paramzze)
    {
      this.zzHa = ((zza.zzb)zzx.zzl(paramzzb));
      this.zzasO = ((zze)zzx.zzl(paramzze));
    }

    public void onConnectionRequest(final String paramString1, final String paramString2, final String paramString3, final byte[] paramArrayOfByte)
      throws RemoteException
    {
      this.zzasO.zza(new zze.zzb()
      {
        public void zza(Connections.ConnectionRequestListener paramAnonymousConnectionRequestListener)
        {
          paramAnonymousConnectionRequestListener.onConnectionRequest(paramString1, paramString2, paramString3, paramArrayOfByte);
        }

        public void zzhX()
        {
        }
      });
    }

    public void zzi(int paramInt, String paramString)
      throws RemoteException
    {
      this.zzHa.zzd(new zzrk.zze(new Status(paramInt), paramString));
    }
  }

  private static final class zze
    implements Connections.StartAdvertisingResult
  {
    private final Status zzHb;
    private final String zzasS;

    zze(Status paramStatus, String paramString)
    {
      this.zzHb = paramStatus;
      this.zzasS = paramString;
    }

    public String getLocalEndpointName()
    {
      return this.zzasS;
    }

    public Status getStatus()
    {
      return this.zzHb;
    }
  }

  private static final class zzf extends zzrj
  {
    private final zza.zzb<Status> zzHa;
    private final zze<Connections.EndpointDiscoveryListener> zzasO;

    zzf(zza.zzb<Status> paramzzb, zze<Connections.EndpointDiscoveryListener> paramzze)
    {
      this.zzHa = ((zza.zzb)zzx.zzl(paramzzb));
      this.zzasO = ((zze)zzx.zzl(paramzze));
    }

    public void onEndpointFound(final String paramString1, final String paramString2, final String paramString3, final String paramString4)
      throws RemoteException
    {
      this.zzasO.zza(new zze.zzb()
      {
        public void zza(Connections.EndpointDiscoveryListener paramAnonymousEndpointDiscoveryListener)
        {
          paramAnonymousEndpointDiscoveryListener.onEndpointFound(paramString1, paramString2, paramString3, paramString4);
        }

        public void zzhX()
        {
        }
      });
    }

    public void onEndpointLost(final String paramString)
      throws RemoteException
    {
      this.zzasO.zza(new zze.zzb()
      {
        public void zza(Connections.EndpointDiscoveryListener paramAnonymousEndpointDiscoveryListener)
        {
          paramAnonymousEndpointDiscoveryListener.onEndpointLost(paramString);
        }

        public void zzhX()
        {
        }
      });
    }

    public void zzgs(int paramInt)
      throws RemoteException
    {
      this.zzHa.zzd(new Status(paramInt));
    }
  }
}