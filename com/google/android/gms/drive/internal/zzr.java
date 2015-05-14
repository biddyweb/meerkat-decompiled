package com.google.android.gms.drive.internal;

import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.content.pm.ServiceInfo;
import android.os.Bundle;
import android.os.DeadObjectException;
import android.os.IBinder;
import android.os.Looper;
import android.os.RemoteException;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.GoogleApiClient.ConnectionCallbacks;
import com.google.android.gms.common.api.GoogleApiClient.OnConnectionFailedListener;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.zza.zza;
import com.google.android.gms.common.internal.zzf;
import com.google.android.gms.common.internal.zzk;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.drive.DriveId;
import com.google.android.gms.drive.events.zzc;
import com.google.android.gms.drive.events.zzd;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class zzr extends zzk<zzag>
{
  private final String zzMh;
  private final Bundle zzTC;
  private final boolean zzTD;
  private DriveId zzTE;
  private DriveId zzTF;
  final GoogleApiClient.ConnectionCallbacks zzTG;
  final Map<DriveId, Map<zzc, zzaa>> zzTH = new HashMap();

  public zzr(Context paramContext, Looper paramLooper, zzf paramzzf, GoogleApiClient.ConnectionCallbacks paramConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener paramOnConnectionFailedListener, Bundle paramBundle)
  {
    super(paramContext, paramLooper, 11, paramConnectionCallbacks, paramOnConnectionFailedListener, paramzzf);
    this.zzMh = paramzzf.zziR();
    this.zzTG = paramConnectionCallbacks;
    this.zzTC = paramBundle;
    Intent localIntent = new Intent("com.google.android.gms.drive.events.HANDLE_EVENT");
    localIntent.setPackage(paramContext.getPackageName());
    List localList = paramContext.getPackageManager().queryIntentServices(localIntent, 0);
    switch (localList.size())
    {
    default:
      throw new IllegalStateException("AndroidManifest.xml can only define one service that handles the " + localIntent.getAction() + " action");
    case 0:
      this.zzTD = false;
      return;
    case 1:
    }
    ServiceInfo localServiceInfo = ((ResolveInfo)localList.get(0)).serviceInfo;
    if (!localServiceInfo.exported)
      throw new IllegalStateException("Drive event service " + localServiceInfo.name + " must be exported in AndroidManifest.xml");
    this.zzTD = true;
  }

  PendingResult<Status> cancelPendingActions(GoogleApiClient paramGoogleApiClient, final List<String> paramList)
  {
    boolean bool1 = true;
    boolean bool2;
    if (paramList != null)
    {
      bool2 = bool1;
      zzx.zzO(bool2);
      if (paramList.isEmpty())
        break label59;
    }
    while (true)
    {
      zzx.zzO(bool1);
      zzx.zza(isConnected(), "Client must be connected");
      return paramGoogleApiClient.zzb(new zzq.zza(paramGoogleApiClient)
      {
        protected void zza(zzr paramAnonymouszzr)
          throws RemoteException
        {
          paramAnonymouszzr.zzkF().zza(new CancelPendingActionsRequest(paramList), new zzbl(this));
        }
      });
      bool2 = false;
      break;
      label59: bool1 = false;
    }
  }

  public void disconnect()
  {
    if (isConnected());
    try
    {
      ((zzag)zzjb()).zza(new DisconnectRequest());
      label26: super.disconnect();
      this.zzTH.clear();
      return;
    }
    catch (RemoteException localRemoteException)
    {
      break label26;
    }
  }

  PendingResult<Status> zza(GoogleApiClient paramGoogleApiClient, final DriveId paramDriveId, final int paramInt)
  {
    zzx.zzb(zzd.zza(paramInt, paramDriveId), "id");
    zzx.zza(isConnected(), "Client must be connected");
    if (!this.zzTD)
      throw new IllegalStateException("Application must define an exported DriveEventService subclass in AndroidManifest.xml to add event subscriptions");
    return paramGoogleApiClient.zzb(new zzq.zza(paramGoogleApiClient)
    {
      protected void zza(zzr paramAnonymouszzr)
        throws RemoteException
      {
        paramAnonymouszzr.zzkF().zza(new AddEventListenerRequest(paramDriveId, paramInt), null, null, new zzbl(this));
      }
    });
  }

  PendingResult<Status> zza(GoogleApiClient paramGoogleApiClient, final DriveId paramDriveId, final int paramInt, zzc paramzzc)
  {
    zzx.zzb(zzd.zza(paramInt, paramDriveId), "id");
    zzx.zzb(paramzzc, "listener");
    zzx.zza(isConnected(), "Client must be connected");
    while (true)
    {
      Map localMap2;
      zzaa localzzaa1;
      synchronized (this.zzTH)
      {
        localMap2 = (Map)this.zzTH.get(paramDriveId);
        if (localMap2 != null)
          break label209;
        HashMap localHashMap = new HashMap();
        this.zzTH.put(paramDriveId, localHashMap);
        localObject2 = localHashMap;
        localzzaa1 = (zzaa)((Map)localObject2).get(paramzzc);
        if (localzzaa1 == null)
        {
          localzzaa2 = new zzaa(getLooper(), getContext(), paramInt, paramzzc);
          ((Map)localObject2).put(paramzzc, localzzaa2);
          localzzaa2.zzbJ(paramInt);
          zza.zza localzza = paramGoogleApiClient.zzb(new zzq.zza(paramGoogleApiClient)
          {
            protected void zza(zzr paramAnonymouszzr)
              throws RemoteException
            {
              paramAnonymouszzr.zzkF().zza(new AddEventListenerRequest(paramDriveId, paramInt), localzzaa2, null, new zzbl(this));
            }
          });
          return localzza;
        }
        if (localzzaa1.zzbK(paramInt))
        {
          zzp.zzj localzzj = new zzp.zzj(paramGoogleApiClient, Status.zzNo);
          return localzzj;
        }
      }
      final zzaa localzzaa2 = localzzaa1;
      continue;
      label209: Object localObject2 = localMap2;
    }
  }

  protected void zza(int paramInt, IBinder paramIBinder, Bundle paramBundle)
  {
    if (paramBundle != null)
    {
      paramBundle.setClassLoader(getClass().getClassLoader());
      this.zzTE = ((DriveId)paramBundle.getParcelable("com.google.android.gms.drive.root_id"));
      this.zzTF = ((DriveId)paramBundle.getParcelable("com.google.android.gms.drive.appdata_id"));
    }
    super.zza(paramInt, paramIBinder, paramBundle);
  }

  protected zzag zzab(IBinder paramIBinder)
  {
    return zzag.zza.zzac(paramIBinder);
  }

  PendingResult<Status> zzb(GoogleApiClient paramGoogleApiClient, final DriveId paramDriveId, final int paramInt)
  {
    zzx.zzb(zzd.zza(paramInt, paramDriveId), "id");
    zzx.zza(isConnected(), "Client must be connected");
    return paramGoogleApiClient.zzb(new zzq.zza(paramGoogleApiClient)
    {
      protected void zza(zzr paramAnonymouszzr)
        throws RemoteException
      {
        paramAnonymouszzr.zzkF().zza(new RemoveEventListenerRequest(paramDriveId, paramInt), null, null, new zzbl(this));
      }
    });
  }

  PendingResult<Status> zzb(GoogleApiClient paramGoogleApiClient, final DriveId paramDriveId, final int paramInt, zzc paramzzc)
  {
    zzx.zzb(zzd.zza(paramInt, paramDriveId), "id");
    zzx.zza(isConnected(), "Client must be connected");
    zzx.zzb(paramzzc, "listener");
    Map localMap2;
    final zzaa localzzaa;
    synchronized (this.zzTH)
    {
      localMap2 = (Map)this.zzTH.get(paramDriveId);
      if (localMap2 == null)
      {
        zzp.zzj localzzj1 = new zzp.zzj(paramGoogleApiClient, Status.zzNo);
        return localzzj1;
      }
      localzzaa = (zzaa)localMap2.remove(paramzzc);
      if (localzzaa == null)
      {
        zzp.zzj localzzj2 = new zzp.zzj(paramGoogleApiClient, Status.zzNo);
        return localzzj2;
      }
    }
    if (localMap2.isEmpty())
      this.zzTH.remove(paramDriveId);
    zza.zza localzza = paramGoogleApiClient.zzb(new zzq.zza(paramGoogleApiClient)
    {
      protected void zza(zzr paramAnonymouszzr)
        throws RemoteException
      {
        paramAnonymouszzr.zzkF().zza(new RemoveEventListenerRequest(paramDriveId, paramInt), localzzaa, null, new zzbl(this));
      }
    });
    return localzza;
  }

  protected String zzcF()
  {
    return "com.google.android.gms.drive.ApiService.START";
  }

  protected String zzcG()
  {
    return "com.google.android.gms.drive.internal.IDriveService";
  }

  public boolean zzhc()
  {
    return true;
  }

  protected Bundle zzhq()
  {
    String str = getContext().getPackageName();
    zzx.zzl(str);
    zzx.zzl(zziP());
    Bundle localBundle = new Bundle();
    if (!str.equals(this.zzMh))
      localBundle.putString("proxy_package_name", this.zzMh);
    localBundle.putAll(this.zzTC);
    return localBundle;
  }

  public zzag zzkF()
    throws DeadObjectException
  {
    return (zzag)zzjb();
  }

  public DriveId zzkG()
  {
    return this.zzTE;
  }

  public DriveId zzkH()
  {
    return this.zzTF;
  }

  public boolean zzkI()
  {
    return this.zzTD;
  }
}