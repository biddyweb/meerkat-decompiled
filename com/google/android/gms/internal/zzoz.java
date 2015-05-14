package com.google.android.gms.internal;

import android.app.PendingIntent;
import android.location.Location;
import android.os.Looper;
import android.os.RemoteException;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.location.FusedLocationProviderApi;
import com.google.android.gms.location.LocationListener;
import com.google.android.gms.location.LocationRequest;
import com.google.android.gms.location.LocationServices;
import com.google.android.gms.location.LocationServices.zza;

public class zzoz
  implements FusedLocationProviderApi
{
  public Location getLastLocation(GoogleApiClient paramGoogleApiClient)
  {
    zzpf localzzpf = LocationServices.zze(paramGoogleApiClient);
    try
    {
      Location localLocation = localzzpf.zzpx();
      return localLocation;
    }
    catch (Exception localException)
    {
    }
    return null;
  }

  public PendingResult<Status> removeLocationUpdates(GoogleApiClient paramGoogleApiClient, final PendingIntent paramPendingIntent)
  {
    return paramGoogleApiClient.zzb(new zza(paramGoogleApiClient)
    {
      protected void zza(zzpf paramAnonymouszzpf)
        throws RemoteException
      {
        paramAnonymouszzpf.zzd(paramPendingIntent);
        setResult(Status.zzNo);
      }
    });
  }

  public PendingResult<Status> removeLocationUpdates(GoogleApiClient paramGoogleApiClient, final LocationListener paramLocationListener)
  {
    return paramGoogleApiClient.zzb(new zza(paramGoogleApiClient)
    {
      protected void zza(zzpf paramAnonymouszzpf)
        throws RemoteException
      {
        paramAnonymouszzpf.zza(paramLocationListener);
        setResult(Status.zzNo);
      }
    });
  }

  public PendingResult<Status> requestLocationUpdates(GoogleApiClient paramGoogleApiClient, final LocationRequest paramLocationRequest, final PendingIntent paramPendingIntent)
  {
    return paramGoogleApiClient.zzb(new zza(paramGoogleApiClient)
    {
      protected void zza(zzpf paramAnonymouszzpf)
        throws RemoteException
      {
        paramAnonymouszzpf.zzb(paramLocationRequest, paramPendingIntent);
        setResult(Status.zzNo);
      }
    });
  }

  public PendingResult<Status> requestLocationUpdates(GoogleApiClient paramGoogleApiClient, final LocationRequest paramLocationRequest, final LocationListener paramLocationListener)
  {
    return paramGoogleApiClient.zzb(new zza(paramGoogleApiClient)
    {
      protected void zza(zzpf paramAnonymouszzpf)
        throws RemoteException
      {
        paramAnonymouszzpf.zza(paramLocationRequest, paramLocationListener, null);
        setResult(Status.zzNo);
      }
    });
  }

  public PendingResult<Status> requestLocationUpdates(GoogleApiClient paramGoogleApiClient, final LocationRequest paramLocationRequest, final LocationListener paramLocationListener, final Looper paramLooper)
  {
    return paramGoogleApiClient.zzb(new zza(paramGoogleApiClient)
    {
      protected void zza(zzpf paramAnonymouszzpf)
        throws RemoteException
      {
        paramAnonymouszzpf.zza(paramLocationRequest, paramLocationListener, paramLooper);
        setResult(Status.zzNo);
      }
    });
  }

  public PendingResult<Status> setMockLocation(GoogleApiClient paramGoogleApiClient, final Location paramLocation)
  {
    return paramGoogleApiClient.zzb(new zza(paramGoogleApiClient)
    {
      protected void zza(zzpf paramAnonymouszzpf)
        throws RemoteException
      {
        paramAnonymouszzpf.zzb(paramLocation);
        setResult(Status.zzNo);
      }
    });
  }

  public PendingResult<Status> setMockMode(GoogleApiClient paramGoogleApiClient, final boolean paramBoolean)
  {
    return paramGoogleApiClient.zzb(new zza(paramGoogleApiClient)
    {
      protected void zza(zzpf paramAnonymouszzpf)
        throws RemoteException
      {
        paramAnonymouszzpf.zzW(paramBoolean);
        setResult(Status.zzNo);
      }
    });
  }

  private static abstract class zza extends LocationServices.zza<Status>
  {
    public zza(GoogleApiClient paramGoogleApiClient)
    {
      super();
    }

    public Status zzb(Status paramStatus)
    {
      return paramStatus;
    }
  }
}