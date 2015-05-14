package com.google.android.gms.internal;

import android.content.Context;
import android.os.IBinder;
import android.os.Looper;
import android.os.RemoteException;
import android.util.Log;
import com.google.android.gms.appstate.AppState;
import com.google.android.gms.appstate.AppStateBuffer;
import com.google.android.gms.appstate.AppStateManager.StateConflictResult;
import com.google.android.gms.appstate.AppStateManager.StateDeletedResult;
import com.google.android.gms.appstate.AppStateManager.StateListResult;
import com.google.android.gms.appstate.AppStateManager.StateLoadedResult;
import com.google.android.gms.appstate.AppStateManager.StateResult;
import com.google.android.gms.common.api.GoogleApiClient.ConnectionCallbacks;
import com.google.android.gms.common.api.GoogleApiClient.OnConnectionFailedListener;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.zza.zzb;
import com.google.android.gms.common.api.zzc;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.common.internal.zzf;
import com.google.android.gms.common.internal.zzk;
import com.google.android.gms.common.internal.zzx;
import java.util.List;

public final class zzjl extends zzk<zzjn>
{
  public zzjl(Context paramContext, Looper paramLooper, zzf paramzzf, GoogleApiClient.ConnectionCallbacks paramConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener paramOnConnectionFailedListener)
  {
    super(paramContext, paramLooper, 7, paramConnectionCallbacks, paramOnConnectionFailedListener, paramzzf);
  }

  protected zzjn zzL(IBinder paramIBinder)
  {
    return zzjn.zza.zzN(paramIBinder);
  }

  public void zza(zza.zzb<AppStateManager.StateListResult> paramzzb)
    throws RemoteException
  {
    ((zzjn)zzjb()).zza(new zzc(paramzzb));
  }

  public void zza(zza.zzb<AppStateManager.StateDeletedResult> paramzzb, int paramInt)
    throws RemoteException
  {
    ((zzjn)zzjb()).zzb(new zza(paramzzb), paramInt);
  }

  public void zza(zza.zzb<AppStateManager.StateResult> paramzzb, int paramInt, String paramString, byte[] paramArrayOfByte)
    throws RemoteException
  {
    ((zzjn)zzjb()).zza(new zze(paramzzb), paramInt, paramString, paramArrayOfByte);
  }

  public void zza(zza.zzb<AppStateManager.StateResult> paramzzb, int paramInt, byte[] paramArrayOfByte)
    throws RemoteException
  {
    if (paramzzb == null);
    for (Object localObject = null; ; localObject = new zze(paramzzb))
    {
      ((zzjn)zzjb()).zza((zzjm)localObject, paramInt, paramArrayOfByte);
      return;
    }
  }

  public void zzb(zza.zzb<Status> paramzzb)
    throws RemoteException
  {
    ((zzjn)zzjb()).zzb(new zzg(paramzzb));
  }

  public void zzb(zza.zzb<AppStateManager.StateResult> paramzzb, int paramInt)
    throws RemoteException
  {
    ((zzjn)zzjb()).zza(new zze(paramzzb), paramInt);
  }

  protected String zzcF()
  {
    return "com.google.android.gms.appstate.service.START";
  }

  protected String zzcG()
  {
    return "com.google.android.gms.appstate.internal.IAppStateService";
  }

  protected List<String> zzf(List<String> paramList)
  {
    zzx.zza(paramList.contains("https://www.googleapis.com/auth/appstate"), String.format("App State APIs requires %s to function.", new Object[] { "https://www.googleapis.com/auth/appstate" }));
    return paramList;
  }

  public boolean zzhc()
  {
    return true;
  }

  public int zzhd()
  {
    try
    {
      int i = ((zzjn)zzjb()).zzhd();
      return i;
    }
    catch (RemoteException localRemoteException)
    {
      Log.w("AppStateClient", "service died");
    }
    return 2;
  }

  public int zzhe()
  {
    try
    {
      int i = ((zzjn)zzjb()).zzhe();
      return i;
    }
    catch (RemoteException localRemoteException)
    {
      Log.w("AppStateClient", "service died");
    }
    return 2;
  }

  private static final class zza extends zzjk
  {
    private final zza.zzb<AppStateManager.StateDeletedResult> zzHa;

    public zza(zza.zzb<AppStateManager.StateDeletedResult> paramzzb)
    {
      this.zzHa = ((zza.zzb)zzx.zzb(paramzzb, "Result holder must not be null"));
    }

    public void zzi(int paramInt1, int paramInt2)
    {
      Status localStatus = new Status(paramInt1);
      this.zzHa.zzd(new zzjl.zzb(localStatus, paramInt2));
    }
  }

  private static final class zzb
    implements AppStateManager.StateDeletedResult
  {
    private final Status zzHb;
    private final int zzHc;

    public zzb(Status paramStatus, int paramInt)
    {
      this.zzHb = paramStatus;
      this.zzHc = paramInt;
    }

    public int getStateKey()
    {
      return this.zzHc;
    }

    public Status getStatus()
    {
      return this.zzHb;
    }
  }

  private static final class zzc extends zzjk
  {
    private final zza.zzb<AppStateManager.StateListResult> zzHa;

    public zzc(zza.zzb<AppStateManager.StateListResult> paramzzb)
    {
      this.zzHa = ((zza.zzb)zzx.zzb(paramzzb, "Result holder must not be null"));
    }

    public void zza(DataHolder paramDataHolder)
    {
      this.zzHa.zzd(new zzjl.zzd(paramDataHolder));
    }
  }

  private static final class zzd extends zzc
    implements AppStateManager.StateListResult
  {
    private final AppStateBuffer zzHd;

    public zzd(DataHolder paramDataHolder)
    {
      super();
      this.zzHd = new AppStateBuffer(paramDataHolder);
    }

    public AppStateBuffer getStateBuffer()
    {
      return this.zzHd;
    }
  }

  private static final class zze extends zzjk
  {
    private final zza.zzb<AppStateManager.StateResult> zzHa;

    public zze(zza.zzb<AppStateManager.StateResult> paramzzb)
    {
      this.zzHa = ((zza.zzb)zzx.zzb(paramzzb, "Result holder must not be null"));
    }

    public void zza(int paramInt, DataHolder paramDataHolder)
    {
      this.zzHa.zzd(new zzjl.zzf(paramInt, paramDataHolder));
    }
  }

  private static final class zzf extends zzc
    implements AppStateManager.StateConflictResult, AppStateManager.StateLoadedResult, AppStateManager.StateResult
  {
    private final int zzHc;
    private final AppStateBuffer zzHd;

    public zzf(int paramInt, DataHolder paramDataHolder)
    {
      super();
      this.zzHc = paramInt;
      this.zzHd = new AppStateBuffer(paramDataHolder);
    }

    private boolean zzhf()
    {
      return this.zzHb.getStatusCode() == 2000;
    }

    public AppStateManager.StateConflictResult getConflictResult()
    {
      if (zzhf())
        return this;
      return null;
    }

    public AppStateManager.StateLoadedResult getLoadedResult()
    {
      if (zzhf())
        this = null;
      return this;
    }

    public byte[] getLocalData()
    {
      if (this.zzHd.getCount() == 0)
        return null;
      return this.zzHd.get(0).getLocalData();
    }

    public String getResolvedVersion()
    {
      if (this.zzHd.getCount() == 0)
        return null;
      return this.zzHd.get(0).getConflictVersion();
    }

    public byte[] getServerData()
    {
      if (this.zzHd.getCount() == 0)
        return null;
      return this.zzHd.get(0).getConflictData();
    }

    public int getStateKey()
    {
      return this.zzHc;
    }

    public void release()
    {
      this.zzHd.release();
    }
  }

  private static final class zzg extends zzjk
  {
    private final zza.zzb<Status> zzHa;

    public zzg(zza.zzb<Status> paramzzb)
    {
      this.zzHa = ((zza.zzb)zzx.zzb(paramzzb, "Holder must not be null"));
    }

    public void zzhb()
    {
      Status localStatus = new Status(0);
      this.zzHa.zzd(localStatus);
    }
  }
}