package com.google.android.gms.internal;

import android.app.PendingIntent;
import android.content.Context;
import android.location.Location;
import android.os.Looper;
import android.os.RemoteException;
import android.util.Log;
import com.google.android.gms.common.api.GoogleApiClient.ConnectionCallbacks;
import com.google.android.gms.common.api.GoogleApiClient.OnConnectionFailedListener;
import com.google.android.gms.common.api.zza.zzb;
import com.google.android.gms.common.internal.zzb;
import com.google.android.gms.common.internal.zzk;
import com.google.android.gms.common.internal.zzk.zzc;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.location.GeofencingRequest;
import com.google.android.gms.location.LocationListener;
import com.google.android.gms.location.LocationRequest;
import com.google.android.gms.location.LocationSettingsRequest;
import com.google.android.gms.location.LocationSettingsResult;
import com.google.android.gms.location.LocationStatusCodes;
import com.google.android.gms.location.zzf.zza;
import com.google.android.gms.location.zzf.zzb;
import java.util.List;

public class zzpf extends zzow
{
  private final zzpe zzamX = new zzpe(paramContext, this.zzamz);
  private final zzot zzamY = zzot.zza(paramContext, paramString3, paramString4, this.zzamz);

  public zzpf(Context paramContext, Looper paramLooper, String paramString1, GoogleApiClient.ConnectionCallbacks paramConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener paramOnConnectionFailedListener, String paramString2)
  {
    this(paramContext, paramLooper, paramString1, paramConnectionCallbacks, paramOnConnectionFailedListener, paramString2, null);
  }

  public zzpf(Context paramContext, Looper paramLooper, String paramString1, GoogleApiClient.ConnectionCallbacks paramConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener paramOnConnectionFailedListener, String paramString2, String paramString3)
  {
    this(paramContext, paramLooper, paramString1, paramConnectionCallbacks, paramOnConnectionFailedListener, paramString2, paramString3, null);
  }

  public zzpf(Context paramContext, Looper paramLooper, String paramString1, GoogleApiClient.ConnectionCallbacks paramConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener paramOnConnectionFailedListener, String paramString2, String paramString3, String paramString4)
  {
    super(paramContext, paramLooper, paramConnectionCallbacks, paramOnConnectionFailedListener, paramString2);
  }

  public void disconnect()
  {
    synchronized (this.zzamX)
    {
      boolean bool = isConnected();
      if (bool);
      try
      {
        this.zzamX.removeAllListeners();
        this.zzamX.zzpy();
        super.disconnect();
        return;
      }
      catch (Exception localException)
      {
        while (true)
          Log.e("LocationClientImpl", "Client disconnected before listeners could be cleaned up", localException);
      }
    }
  }

  public void zzW(boolean paramBoolean)
    throws RemoteException
  {
    this.zzamX.zzW(paramBoolean);
  }

  public void zza(long paramLong, PendingIntent paramPendingIntent)
    throws RemoteException
  {
    zzfc();
    zzx.zzl(paramPendingIntent);
    if (paramLong >= 0L);
    for (boolean bool = true; ; bool = false)
    {
      zzx.zzb(bool, "detectionIntervalMillis must be >= 0");
      ((zzpc)zzjb()).zza(paramLong, true, paramPendingIntent);
      return;
    }
  }

  public void zza(PendingIntent paramPendingIntent)
    throws RemoteException
  {
    zzfc();
    zzx.zzl(paramPendingIntent);
    ((zzpc)zzjb()).zza(paramPendingIntent);
  }

  public void zza(PendingIntent paramPendingIntent, zzf.zzb paramzzb)
    throws RemoteException
  {
    zzfc();
    zzx.zzb(paramPendingIntent, "PendingIntent must be specified.");
    zzx.zzb(paramzzb, "OnRemoveGeofencesResultListener not provided.");
    if (paramzzb == null);
    for (Object localObject = null; ; localObject = new zzb(paramzzb, this))
    {
      ((zzpc)zzjb()).zza(paramPendingIntent, (zzpb)localObject, getContext().getPackageName());
      return;
    }
  }

  public void zza(GeofencingRequest paramGeofencingRequest, PendingIntent paramPendingIntent, zzf.zza paramzza)
    throws RemoteException
  {
    zzfc();
    zzx.zzb(paramGeofencingRequest, "geofencingRequest can't be null.");
    zzx.zzb(paramPendingIntent, "PendingIntent must be specified.");
    zzx.zzb(paramzza, "OnAddGeofencesResultListener not provided.");
    if (paramzza == null);
    for (Object localObject = null; ; localObject = new zzb(paramzza, this))
    {
      ((zzpc)zzjb()).zza(paramGeofencingRequest, paramPendingIntent, (zzpb)localObject);
      return;
    }
  }

  public void zza(LocationListener paramLocationListener)
    throws RemoteException
  {
    this.zzamX.zza(paramLocationListener);
  }

  public void zza(LocationRequest paramLocationRequest, LocationListener paramLocationListener, Looper paramLooper)
    throws RemoteException
  {
    synchronized (this.zzamX)
    {
      this.zzamX.zza(paramLocationRequest, paramLocationListener, paramLooper);
      return;
    }
  }

  public void zza(LocationSettingsRequest paramLocationSettingsRequest, zza.zzb<LocationSettingsResult> paramzzb, String paramString)
    throws RemoteException
  {
    boolean bool1 = true;
    zzfc();
    boolean bool2;
    if (paramLocationSettingsRequest != null)
    {
      bool2 = bool1;
      zzx.zzb(bool2, "locationSettingsRequest can't be null nor empty.");
      if (paramzzb == null)
        break label66;
    }
    while (true)
    {
      zzx.zzb(bool1, "listener can't be null.");
      zzd localzzd = new zzd(paramzzb);
      ((zzpc)zzjb()).zza(paramLocationSettingsRequest, localzzd, paramString);
      return;
      bool2 = false;
      break;
      label66: bool1 = false;
    }
  }

  public void zza(List<String> paramList, zzf.zzb paramzzb)
    throws RemoteException
  {
    zzfc();
    boolean bool;
    String[] arrayOfString;
    if ((paramList != null) && (paramList.size() > 0))
    {
      bool = true;
      zzx.zzb(bool, "geofenceRequestIds can't be null nor empty.");
      zzx.zzb(paramzzb, "OnRemoveGeofencesResultListener not provided.");
      arrayOfString = (String[])paramList.toArray(new String[0]);
      if (paramzzb != null)
        break label83;
    }
    label83: for (Object localObject = null; ; localObject = new zzb(paramzzb, this))
    {
      ((zzpc)zzjb()).zza(arrayOfString, (zzpb)localObject, getContext().getPackageName());
      return;
      bool = false;
      break;
    }
  }

  public void zzb(Location paramLocation)
    throws RemoteException
  {
    this.zzamX.zzb(paramLocation);
  }

  public void zzb(LocationRequest paramLocationRequest, PendingIntent paramPendingIntent)
    throws RemoteException
  {
    this.zzamX.zzb(paramLocationRequest, paramPendingIntent);
  }

  public void zzd(PendingIntent paramPendingIntent)
    throws RemoteException
  {
    this.zzamX.zzd(paramPendingIntent);
  }

  public Location zzpx()
  {
    return this.zzamX.zzpx();
  }

  private final class zza extends zzk<zzpc>.zzc<zzf.zza>
  {
    private final int zzLs;
    private final String[] zzamZ;

    public zza(zzf.zza paramInt, int paramArrayOfString, String[] arg4)
    {
      super(paramInt);
      this.zzLs = LocationStatusCodes.zzfq(paramArrayOfString);
      Object localObject;
      this.zzamZ = localObject;
    }

    protected void zza(zzf.zza paramzza)
    {
      if (paramzza != null)
        paramzza.zza(this.zzLs, this.zzamZ);
    }

    protected void zzjf()
    {
    }
  }

  private static final class zzb extends zzpb.zza
  {
    private zzf.zza zzanb;
    private zzf.zzb zzanc;
    private zzpf zzand;

    public zzb(zzf.zza paramzza, zzpf paramzzpf)
    {
      this.zzanb = paramzza;
      this.zzanc = null;
      this.zzand = paramzzpf;
    }

    public zzb(zzf.zzb paramzzb, zzpf paramzzpf)
    {
      this.zzanc = paramzzb;
      this.zzanb = null;
      this.zzand = paramzzpf;
    }

    public void zza(int paramInt, String[] paramArrayOfString)
      throws RemoteException
    {
      if (this.zzand == null)
      {
        Log.wtf("LocationClientImpl", "onAddGeofenceResult called multiple times");
        return;
      }
      zzpf localzzpf1 = this.zzand;
      zzpf localzzpf2 = this.zzand;
      localzzpf2.getClass();
      localzzpf1.zza(new zzpf.zza(localzzpf2, this.zzanb, paramInt, paramArrayOfString));
      this.zzand = null;
      this.zzanb = null;
      this.zzanc = null;
    }

    public void zzb(int paramInt, PendingIntent paramPendingIntent)
    {
      if (this.zzand == null)
      {
        Log.wtf("LocationClientImpl", "onRemoveGeofencesByPendingIntentResult called multiple times");
        return;
      }
      zzpf localzzpf1 = this.zzand;
      zzpf localzzpf2 = this.zzand;
      localzzpf2.getClass();
      localzzpf1.zza(new zzpf.zzc(localzzpf2, 1, this.zzanc, paramInt, paramPendingIntent));
      this.zzand = null;
      this.zzanb = null;
      this.zzanc = null;
    }

    public void zzb(int paramInt, String[] paramArrayOfString)
    {
      if (this.zzand == null)
      {
        Log.wtf("LocationClientImpl", "onRemoveGeofencesByRequestIdsResult called multiple times");
        return;
      }
      zzpf localzzpf1 = this.zzand;
      zzpf localzzpf2 = this.zzand;
      localzzpf2.getClass();
      localzzpf1.zza(new zzpf.zzc(localzzpf2, 2, this.zzanc, paramInt, paramArrayOfString));
      this.zzand = null;
      this.zzanb = null;
      this.zzanc = null;
    }
  }

  private final class zzc extends zzk<zzpc>.zzc<zzf.zzb>
  {
    private final PendingIntent mPendingIntent;
    private final int zzLs;
    private final String[] zzamZ;
    private final int zzane;

    public zzc(int paramzzb, zzf.zzb paramInt1, int paramPendingIntent, PendingIntent arg5)
    {
      super(paramInt1);
      if (paramzzb == localzzb);
      while (true)
      {
        zzb.zzN(localzzb);
        this.zzane = paramzzb;
        this.zzLs = LocationStatusCodes.zzfq(paramPendingIntent);
        Object localObject;
        this.mPendingIntent = localObject;
        this.zzamZ = null;
        return;
        int i = 0;
      }
    }

    public zzc(int paramzzb, zzf.zzb paramInt1, int paramArrayOfString, String[] arg5)
    {
      super(paramInt1);
      if (paramzzb == 2);
      for (boolean bool = true; ; bool = false)
      {
        zzb.zzN(bool);
        this.zzane = paramzzb;
        this.zzLs = LocationStatusCodes.zzfq(paramArrayOfString);
        Object localObject;
        this.zzamZ = localObject;
        this.mPendingIntent = null;
        return;
      }
    }

    protected void zza(zzf.zzb paramzzb)
    {
      if (paramzzb != null);
      switch (this.zzane)
      {
      default:
        Log.wtf("LocationClientImpl", "Unsupported action: " + this.zzane);
        return;
      case 1:
        paramzzb.zzb(this.zzLs, this.mPendingIntent);
        return;
      case 2:
      }
      paramzzb.zzb(this.zzLs, this.zzamZ);
    }

    protected void zzjf()
    {
    }
  }

  private static final class zzd extends zzpd.zza
  {
    private zza.zzb<LocationSettingsResult> zzanf;

    public zzd(zza.zzb<LocationSettingsResult> paramzzb)
    {
      if (paramzzb != null);
      for (boolean bool = true; ; bool = false)
      {
        zzx.zzb(bool, "listener can't be null.");
        this.zzanf = paramzzb;
        return;
      }
    }

    public void zza(LocationSettingsResult paramLocationSettingsResult)
      throws RemoteException
    {
      this.zzanf.zzd(paramLocationSettingsResult);
      this.zzanf = null;
    }
  }
}