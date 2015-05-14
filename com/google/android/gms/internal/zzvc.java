package com.google.android.gms.internal;

import android.accounts.Account;
import android.content.Context;
import android.os.Bundle;
import android.os.IBinder;
import android.os.Looper;
import android.os.RemoteException;
import android.util.Log;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.api.GoogleApiClient.ConnectionCallbacks;
import com.google.android.gms.common.api.GoogleApiClient.OnConnectionFailedListener;
import com.google.android.gms.common.api.GoogleApiClient.ServerAuthCodeCallbacks;
import com.google.android.gms.common.api.GoogleApiClient.ServerAuthCodeCallbacks.CheckResult;
import com.google.android.gms.common.api.Scope;
import com.google.android.gms.common.internal.BinderWrapper;
import com.google.android.gms.common.internal.zzaa;
import com.google.android.gms.common.internal.zzc;
import com.google.android.gms.common.internal.zzf;
import com.google.android.gms.common.internal.zzk;
import com.google.android.gms.common.internal.zzq;
import com.google.android.gms.common.internal.zzt;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.common.internal.zzy;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.ExecutorService;

public class zzvc extends zzk<zzva>
  implements zzur
{
  private final zzf zzPG;
  private final zzus zzPr;
  private Integer zzPs;
  private final ExecutorService zzawZ;

  public zzvc(Context paramContext, Looper paramLooper, zzf paramzzf, zzus paramzzus, GoogleApiClient.ConnectionCallbacks paramConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener paramOnConnectionFailedListener, ExecutorService paramExecutorService)
  {
    super(paramContext, paramLooper, 44, paramConnectionCallbacks, paramOnConnectionFailedListener, paramzzf);
    this.zzPG = paramzzf;
    this.zzPr = paramzzus;
    this.zzPs = paramzzf.zziV();
    this.zzawZ = paramExecutorService;
  }

  public static Bundle zza(zzus paramzzus, Integer paramInteger, ExecutorService paramExecutorService)
  {
    Bundle localBundle = new Bundle();
    localBundle.putBoolean("com.google.android.gms.signin.internal.offlineAccessRequested", paramzzus.zzsv());
    localBundle.putBoolean("com.google.android.gms.signin.internal.idTokenRequested", paramzzus.zzsw());
    localBundle.putString("com.google.android.gms.signin.internal.serverClientId", paramzzus.zzrN());
    if (paramzzus.zzsx() != null)
      localBundle.putParcelable("com.google.android.gms.signin.internal.signInCallbacks", new BinderWrapper(new zza(paramzzus, paramExecutorService).asBinder()));
    if (paramInteger != null)
      localBundle.putInt("com.google.android.gms.common.internal.ClientSettings.sessionId", paramInteger.intValue());
    return localBundle;
  }

  public void zza(zzq paramzzq, Set<Scope> paramSet, zzuz paramzzuz)
  {
    zzx.zzb(paramzzuz, "Expecting a valid ISignInCallbacks");
    try
    {
      ((zzva)zzjb()).zza(new zzc(paramzzq, paramSet), paramzzuz);
      return;
    }
    catch (RemoteException localRemoteException1)
    {
      Log.w("SignInClientImpl", "Remote service probably died when authAccount is called");
      try
      {
        paramzzuz.zza(new ConnectionResult(8, null), new zzut());
        return;
      }
      catch (RemoteException localRemoteException2)
      {
        Log.wtf("SignInClientImpl", "ISignInCallbacks#onAuthAccount should be executed from the same process, unexpected RemoteException.");
      }
    }
  }

  public void zza(zzq paramzzq, boolean paramBoolean)
  {
    try
    {
      ((zzva)zzjb()).zza(paramzzq, this.zzPs.intValue(), paramBoolean);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      Log.w("SignInClientImpl", "Remote service probably died when saveDefaultAccount is called");
    }
  }

  public void zza(zzt paramzzt)
  {
    zzx.zzb(paramzzt, "Expecting a valid IResolveAccountCallbacks");
    try
    {
      Account localAccount = this.zzPG.zziN();
      ((zzva)zzjb()).zza(new zzy(localAccount, this.zzPs.intValue()), paramzzt);
      return;
    }
    catch (RemoteException localRemoteException1)
    {
      Log.w("SignInClientImpl", "Remote service probably died when resolveAccount is called");
      try
      {
        paramzzt.zzb(new zzaa(8));
        return;
      }
      catch (RemoteException localRemoteException2)
      {
        Log.wtf("SignInClientImpl", "IResolveAccountCallbacks#onAccountResolutionComplete should be executed from the same process, unexpected RemoteException.");
      }
    }
  }

  protected String zzcF()
  {
    return "com.google.android.gms.signin.service.START";
  }

  protected zzva zzcG(IBinder paramIBinder)
  {
    return zzva.zza.zzcF(paramIBinder);
  }

  protected String zzcG()
  {
    return "com.google.android.gms.signin.internal.ISignInService";
  }

  protected Bundle zzhq()
  {
    Bundle localBundle = zza(this.zzPr, this.zzPG.zziV(), this.zzawZ);
    String str = this.zzPG.zziR();
    if (!getContext().getPackageName().equals(str))
      localBundle.putString("com.google.android.gms.signin.internal.realClientPackageName", this.zzPG.zziR());
    return localBundle;
  }

  public void zzsu()
  {
    try
    {
      ((zzva)zzjb()).zzhb(this.zzPs.intValue());
      return;
    }
    catch (RemoteException localRemoteException)
    {
      Log.w("SignInClientImpl", "Remote service probably died when clearAccountFromSessionStore is called");
    }
  }

  private static class zza extends zzuy.zza
  {
    private final zzus zzPr;
    private final ExecutorService zzawZ;

    public zza(zzus paramzzus, ExecutorService paramExecutorService)
    {
      this.zzPr = paramzzus;
      this.zzawZ = paramExecutorService;
    }

    private GoogleApiClient.ServerAuthCodeCallbacks zzsx()
      throws RemoteException
    {
      return this.zzPr.zzsx();
    }

    public void zza(final String paramString1, final String paramString2, final zzva paramzzva)
      throws RemoteException
    {
      this.zzawZ.submit(new Runnable()
      {
        public void run()
        {
          try
          {
            boolean bool = zzvc.zza.zza(zzvc.zza.this).onUploadServerAuthCode(paramString1, paramString2);
            paramzzva.zzaf(bool);
            return;
          }
          catch (RemoteException localRemoteException)
          {
            Log.e("SignInClientImpl", "RemoteException thrown when processing uploadServerAuthCode callback", localRemoteException);
          }
        }
      });
    }

    public void zza(final String paramString, final List<Scope> paramList, final zzva paramzzva)
      throws RemoteException
    {
      this.zzawZ.submit(new Runnable()
      {
        public void run()
        {
          try
          {
            GoogleApiClient.ServerAuthCodeCallbacks localServerAuthCodeCallbacks = zzvc.zza.zza(zzvc.zza.this);
            Set localSet = Collections.unmodifiableSet(new HashSet(paramList));
            GoogleApiClient.ServerAuthCodeCallbacks.CheckResult localCheckResult = localServerAuthCodeCallbacks.onCheckServerAuthorization(paramString, localSet);
            zzuw localzzuw = new zzuw(localCheckResult.zzic(), localCheckResult.zzid());
            paramzzva.zza(localzzuw);
            return;
          }
          catch (RemoteException localRemoteException)
          {
            Log.e("SignInClientImpl", "RemoteException thrown when processing checkServerAuthorization callback", localRemoteException);
          }
        }
      });
    }
  }
}