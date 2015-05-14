package com.google.android.gms.internal;

import android.content.Context;
import android.os.Binder;
import android.os.Bundle;
import android.os.DeadObjectException;
import android.os.RemoteException;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.api.GoogleApiClient.ConnectionCallbacks;
import com.google.android.gms.common.api.GoogleApiClient.OnConnectionFailedListener;

@zzgi
public abstract class zzgm extends zzhl
{
  private final zzgo zzse;
  private final zzgl.zza zzwk;

  public zzgm(zzgo paramzzgo, zzgl.zza paramzza)
  {
    this.zzse = paramzzgo;
    this.zzwk = paramzza;
  }

  static zzgq zza(zzgs paramzzgs, zzgo paramzzgo)
  {
    try
    {
      zzgq localzzgq = paramzzgs.zzd(paramzzgo);
      return localzzgq;
    }
    catch (RemoteException localRemoteException)
    {
      zzhx.zzd("Could not fetch ad response from ad request service.", localRemoteException);
      zzab.zzaP().zze(localRemoteException);
      return null;
    }
    catch (NullPointerException localNullPointerException)
    {
      zzhx.zzd("Could not fetch ad response from ad request service due to an Exception.", localNullPointerException);
      zzab.zzaP().zze(localNullPointerException);
      return null;
    }
    catch (SecurityException localSecurityException)
    {
      zzhx.zzd("Could not fetch ad response from ad request service due to an Exception.", localSecurityException);
      zzab.zzaP().zze(localSecurityException);
      return null;
    }
    catch (Throwable localThrowable)
    {
      zzab.zzaP().zze(localThrowable);
    }
    return null;
  }

  public final void onStop()
  {
    zzdJ();
  }

  public abstract void zzdJ();

  public abstract zzgs zzdK();

  public void zzdw()
  {
    try
    {
      zzgs localzzgs = zzdK();
      zzgq localzzgq;
      if (localzzgs == null)
        localzzgq = new zzgq(0);
      while (true)
      {
        zzdJ();
        this.zzwk.zzb(localzzgq);
        return;
        localzzgq = zza(localzzgs, this.zzse);
        if (localzzgq == null)
          localzzgq = new zzgq(0);
      }
    }
    finally
    {
      zzdJ();
    }
  }

  @zzgi
  public static final class zza extends zzgm
  {
    private final Context mContext;

    public zza(Context paramContext, zzgo paramzzgo, zzgl.zza paramzza)
    {
      super(paramzza);
      this.mContext = paramContext;
    }

    public void zzdJ()
    {
    }

    public zzgs zzdK()
    {
      zzbv localzzbv = new zzbv((String)zzca.zzql.get(), zzca.zzcb());
      return zzgw.zza(this.mContext, localzzbv, new zzdh(), new zzhd());
    }
  }

  @zzgi
  public static class zzb extends zzgm
    implements GoogleApiClient.ConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener
  {
    private final Object zznh = new Object();
    private final zzgl.zza zzwk;
    protected zzgn zzwl;

    public zzb(Context paramContext, zzgo paramzzgo, zzgl.zza paramzza)
    {
      super(paramzza);
      this.zzwk = paramzza;
      this.zzwl = new zzgn(paramContext, this, this, paramzzgo.zzlP.zzzJ);
      connect();
    }

    protected void connect()
    {
      this.zzwl.connect();
    }

    public void onConnected(Bundle paramBundle)
    {
      start();
    }

    public void onConnectionFailed(ConnectionResult paramConnectionResult)
    {
      this.zzwk.zzb(new zzgq(0));
    }

    public void onConnectionSuspended(int paramInt)
    {
      zzhx.zzY("Disconnected from remote ad request service.");
    }

    public void zzdJ()
    {
      synchronized (this.zznh)
      {
        if ((this.zzwl.isConnected()) || (this.zzwl.isConnecting()))
          this.zzwl.disconnect();
        Binder.flushPendingCommands();
        return;
      }
    }

    public zzgs zzdK()
    {
      try
      {
        synchronized (this.zznh)
        {
          zzgs localzzgs = this.zzwl.zzdL();
          return localzzgs;
          label21: return null;
        }
      }
      catch (DeadObjectException localDeadObjectException)
      {
        break label21;
      }
      catch (IllegalStateException localIllegalStateException)
      {
        break label21;
      }
    }
  }
}