package com.google.android.gms.internal;

import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.os.RemoteException;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.zza.zza;
import com.google.android.gms.common.api.zza.zzb;
import com.google.android.gms.panorama.Panorama;
import com.google.android.gms.panorama.PanoramaApi;
import com.google.android.gms.panorama.PanoramaApi.PanoramaResult;

public class zzsw
  implements PanoramaApi
{
  private static void zza(Context paramContext, Uri paramUri)
  {
    paramContext.revokeUriPermission(paramUri, 1);
  }

  private static void zza(Context paramContext, zzsv paramzzsv, final zzsu paramzzsu, final Uri paramUri, Bundle paramBundle)
    throws RemoteException
  {
    paramContext.grantUriPermission("com.google.android.gms", paramUri, 1);
    zzsu.zza local3 = new zzsu.zza()
    {
      public void zza(int paramAnonymousInt1, Bundle paramAnonymousBundle, int paramAnonymousInt2, Intent paramAnonymousIntent)
        throws RemoteException
      {
        zzsw.zzb(this.zznK, paramUri);
        paramzzsu.zza(paramAnonymousInt1, paramAnonymousBundle, paramAnonymousInt2, paramAnonymousIntent);
      }
    };
    try
    {
      paramzzsv.zza(local3, paramUri, paramBundle, true);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      zza(paramContext, paramUri);
      throw localRemoteException;
    }
    catch (RuntimeException localRuntimeException)
    {
      zza(paramContext, paramUri);
      throw localRuntimeException;
    }
  }

  public PendingResult<PanoramaApi.PanoramaResult> loadPanoramaInfo(GoogleApiClient paramGoogleApiClient, final Uri paramUri)
  {
    return paramGoogleApiClient.zza(new zza(paramGoogleApiClient)
    {
      protected void zza(Context paramAnonymousContext, zzsv paramAnonymouszzsv)
        throws RemoteException
      {
        paramAnonymouszzsv.zza(new zzsw.zzb(this), paramUri, null, false);
      }
    });
  }

  public PendingResult<PanoramaApi.PanoramaResult> loadPanoramaInfoAndGrantAccess(GoogleApiClient paramGoogleApiClient, final Uri paramUri)
  {
    return paramGoogleApiClient.zza(new zza(paramGoogleApiClient)
    {
      protected void zza(Context paramAnonymousContext, zzsv paramAnonymouszzsv)
        throws RemoteException
      {
        zzsw.zzb(paramAnonymousContext, paramAnonymouszzsv, new zzsw.zzb(this), paramUri, null);
      }
    });
  }

  private static abstract class zza extends zzsw.zzc<PanoramaApi.PanoramaResult>
  {
    public zza(GoogleApiClient paramGoogleApiClient)
    {
      super();
    }

    protected PanoramaApi.PanoramaResult zzaH(Status paramStatus)
    {
      return new zzsy(paramStatus, null);
    }
  }

  private static final class zzb extends zzsu.zza
  {
    private final zza.zzb<PanoramaApi.PanoramaResult> zzHa;

    public zzb(zza.zzb<PanoramaApi.PanoramaResult> paramzzb)
    {
      this.zzHa = paramzzb;
    }

    public void zza(int paramInt1, Bundle paramBundle, int paramInt2, Intent paramIntent)
    {
      if (paramBundle != null);
      for (PendingIntent localPendingIntent = (PendingIntent)paramBundle.getParcelable("pendingIntent"); ; localPendingIntent = null)
      {
        Status localStatus = new Status(paramInt1, null, localPendingIntent);
        this.zzHa.zzd(new zzsy(localStatus, paramIntent));
        return;
      }
    }
  }

  private static abstract class zzc<R extends Result> extends zza.zza<R, zzsx>
  {
    protected zzc(GoogleApiClient paramGoogleApiClient)
    {
      super(paramGoogleApiClient);
    }

    protected abstract void zza(Context paramContext, zzsv paramzzsv)
      throws RemoteException;

    protected final void zza(zzsx paramzzsx)
      throws RemoteException
    {
      zza(paramzzsx.getContext(), (zzsv)paramzzsx.zzjb());
    }
  }
}