package com.google.android.gms.appstate;

import android.content.Context;
import android.os.Looper;
import android.os.RemoteException;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.Api.ApiOptions.NoOptions;
import com.google.android.gms.common.api.Api.zzb;
import com.google.android.gms.common.api.Api.zzc;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.GoogleApiClient.ConnectionCallbacks;
import com.google.android.gms.common.api.GoogleApiClient.OnConnectionFailedListener;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Releasable;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.Scope;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.zza.zza;
import com.google.android.gms.common.internal.zzf;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.internal.zzjl;

@Deprecated
public final class AppStateManager
{
  public static final Api<Api.ApiOptions.NoOptions> API = new Api(localzzb, localzzc, arrayOfScope);
  public static final Scope SCOPE_APP_STATE;
  static final Api.zzc<zzjl> zzGR = new Api.zzc();
  private static final Api.zzb<zzjl, Api.ApiOptions.NoOptions> zzGS = new Api.zzb()
  {
    public int getPriority()
    {
      return 2147483647;
    }

    public zzjl zzb(Context paramAnonymousContext, Looper paramAnonymousLooper, zzf paramAnonymouszzf, Api.ApiOptions.NoOptions paramAnonymousNoOptions, GoogleApiClient.ConnectionCallbacks paramAnonymousConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener paramAnonymousOnConnectionFailedListener)
    {
      return new zzjl(paramAnonymousContext, paramAnonymousLooper, paramAnonymouszzf, paramAnonymousConnectionCallbacks, paramAnonymousOnConnectionFailedListener);
    }
  };

  static
  {
    SCOPE_APP_STATE = new Scope("https://www.googleapis.com/auth/appstate");
    Api.zzb localzzb = zzGS;
    Api.zzc localzzc = zzGR;
    Scope[] arrayOfScope = new Scope[1];
    arrayOfScope[0] = SCOPE_APP_STATE;
  }

  public static PendingResult<StateDeletedResult> delete(GoogleApiClient paramGoogleApiClient, final int paramInt)
  {
    return paramGoogleApiClient.zzb(new zzb(paramGoogleApiClient)
    {
      protected void zza(zzjl paramAnonymouszzjl)
        throws RemoteException
      {
        paramAnonymouszzjl.zza(this, paramInt);
      }

      public AppStateManager.StateDeletedResult zze(final Status paramAnonymousStatus)
      {
        return new AppStateManager.StateDeletedResult()
        {
          public int getStateKey()
          {
            return AppStateManager.5.this.zzGU;
          }

          public Status getStatus()
          {
            return paramAnonymousStatus;
          }
        };
      }
    });
  }

  public static int getMaxNumKeys(GoogleApiClient paramGoogleApiClient)
  {
    return zza(paramGoogleApiClient).zzhe();
  }

  public static int getMaxStateSize(GoogleApiClient paramGoogleApiClient)
  {
    return zza(paramGoogleApiClient).zzhd();
  }

  public static PendingResult<StateListResult> list(GoogleApiClient paramGoogleApiClient)
  {
    return paramGoogleApiClient.zza(new zzc(paramGoogleApiClient)
    {
      protected void zza(zzjl paramAnonymouszzjl)
        throws RemoteException
      {
        paramAnonymouszzjl.zza(this);
      }
    });
  }

  public static PendingResult<StateResult> load(GoogleApiClient paramGoogleApiClient, final int paramInt)
  {
    return paramGoogleApiClient.zza(new zze(paramGoogleApiClient)
    {
      protected void zza(zzjl paramAnonymouszzjl)
        throws RemoteException
      {
        paramAnonymouszzjl.zzb(this, paramInt);
      }
    });
  }

  public static PendingResult<StateResult> resolve(GoogleApiClient paramGoogleApiClient, final int paramInt, final String paramString, final byte[] paramArrayOfByte)
  {
    return paramGoogleApiClient.zzb(new zze(paramGoogleApiClient)
    {
      protected void zza(zzjl paramAnonymouszzjl)
        throws RemoteException
      {
        paramAnonymouszzjl.zza(this, paramInt, paramString, paramArrayOfByte);
      }
    });
  }

  public static PendingResult<Status> signOut(GoogleApiClient paramGoogleApiClient)
  {
    return paramGoogleApiClient.zzb(new zzd(paramGoogleApiClient)
    {
      protected void zza(zzjl paramAnonymouszzjl)
        throws RemoteException
      {
        paramAnonymouszzjl.zzb(this);
      }
    });
  }

  public static void update(GoogleApiClient paramGoogleApiClient, final int paramInt, final byte[] paramArrayOfByte)
  {
    paramGoogleApiClient.zzb(new zze(paramGoogleApiClient)
    {
      protected void zza(zzjl paramAnonymouszzjl)
        throws RemoteException
      {
        paramAnonymouszzjl.zza(null, paramInt, paramArrayOfByte);
      }
    });
  }

  public static PendingResult<StateResult> updateImmediate(GoogleApiClient paramGoogleApiClient, final int paramInt, final byte[] paramArrayOfByte)
  {
    return paramGoogleApiClient.zzb(new zze(paramGoogleApiClient)
    {
      protected void zza(zzjl paramAnonymouszzjl)
        throws RemoteException
      {
        paramAnonymouszzjl.zza(this, paramInt, paramArrayOfByte);
      }
    });
  }

  public static zzjl zza(GoogleApiClient paramGoogleApiClient)
  {
    if (paramGoogleApiClient != null);
    for (boolean bool = true; ; bool = false)
    {
      zzx.zzb(bool, "GoogleApiClient parameter is required.");
      zzx.zza(paramGoogleApiClient.isConnected(), "GoogleApiClient must be connected.");
      zzx.zza(paramGoogleApiClient.zza(API), "GoogleApiClient is not configured to use the AppState API. Pass AppStateManager.API into GoogleApiClient.Builder#addApi() to use this feature.");
      return (zzjl)paramGoogleApiClient.zza(zzGR);
    }
  }

  private static StateResult zzc(Status paramStatus)
  {
    return new StateResult()
    {
      public AppStateManager.StateConflictResult getConflictResult()
      {
        return null;
      }

      public AppStateManager.StateLoadedResult getLoadedResult()
      {
        return null;
      }

      public Status getStatus()
      {
        return this.zzGT;
      }

      public void release()
      {
      }
    };
  }

  public static abstract interface StateConflictResult extends Releasable, Result
  {
    public abstract byte[] getLocalData();

    public abstract String getResolvedVersion();

    public abstract byte[] getServerData();

    public abstract int getStateKey();
  }

  public static abstract interface StateDeletedResult extends Result
  {
    public abstract int getStateKey();
  }

  public static abstract interface StateListResult extends Result
  {
    public abstract AppStateBuffer getStateBuffer();
  }

  public static abstract interface StateLoadedResult extends Releasable, Result
  {
    public abstract byte[] getLocalData();

    public abstract int getStateKey();
  }

  public static abstract interface StateResult extends Releasable, Result
  {
    public abstract AppStateManager.StateConflictResult getConflictResult();

    public abstract AppStateManager.StateLoadedResult getLoadedResult();
  }

  public static abstract class zza<R extends Result> extends zza.zza<R, zzjl>
  {
    public zza(GoogleApiClient paramGoogleApiClient)
    {
      super(paramGoogleApiClient);
    }
  }

  private static abstract class zzb extends AppStateManager.zza<AppStateManager.StateDeletedResult>
  {
    zzb(GoogleApiClient paramGoogleApiClient)
    {
      super();
    }
  }

  private static abstract class zzc extends AppStateManager.zza<AppStateManager.StateListResult>
  {
    public zzc(GoogleApiClient paramGoogleApiClient)
    {
      super();
    }

    public AppStateManager.StateListResult zzf(final Status paramStatus)
    {
      return new AppStateManager.StateListResult()
      {
        public AppStateBuffer getStateBuffer()
        {
          return new AppStateBuffer(null);
        }

        public Status getStatus()
        {
          return paramStatus;
        }
      };
    }
  }

  private static abstract class zzd extends AppStateManager.zza<Status>
  {
    public zzd(GoogleApiClient paramGoogleApiClient)
    {
      super();
    }

    public Status zzb(Status paramStatus)
    {
      return paramStatus;
    }
  }

  private static abstract class zze extends AppStateManager.zza<AppStateManager.StateResult>
  {
    public zze(GoogleApiClient paramGoogleApiClient)
    {
      super();
    }

    public AppStateManager.StateResult zzg(Status paramStatus)
    {
      return AppStateManager.zzd(paramStatus);
    }
  }
}