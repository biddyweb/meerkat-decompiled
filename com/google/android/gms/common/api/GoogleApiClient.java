package com.google.android.gms.common.api;

import android.accounts.Account;
import android.content.Context;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.support.v4.app.FragmentActivity;
import android.view.View;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.internal.zzf;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.internal.zzup;
import com.google.android.gms.internal.zzur;
import com.google.android.gms.internal.zzus;
import com.google.android.gms.internal.zzus.zza;
import java.io.FileDescriptor;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.TimeUnit;

public abstract interface GoogleApiClient
{
  public abstract ConnectionResult blockingConnect();

  public abstract ConnectionResult blockingConnect(long paramLong, TimeUnit paramTimeUnit);

  public abstract PendingResult<Status> clearDefaultAccountAndReconnect();

  public abstract void connect();

  public abstract void disconnect();

  public abstract void dump(String paramString, FileDescriptor paramFileDescriptor, PrintWriter paramPrintWriter, String[] paramArrayOfString);

  public abstract Context getContext();

  public abstract Looper getLooper();

  public abstract int getSessionId();

  public abstract boolean isConnected();

  public abstract boolean isConnecting();

  public abstract boolean isConnectionCallbacksRegistered(ConnectionCallbacks paramConnectionCallbacks);

  public abstract boolean isConnectionFailedListenerRegistered(OnConnectionFailedListener paramOnConnectionFailedListener);

  public abstract void reconnect();

  public abstract void registerConnectionCallbacks(ConnectionCallbacks paramConnectionCallbacks);

  public abstract void registerConnectionFailedListener(OnConnectionFailedListener paramOnConnectionFailedListener);

  public abstract void stopAutoManage(FragmentActivity paramFragmentActivity);

  public abstract void unregisterConnectionCallbacks(ConnectionCallbacks paramConnectionCallbacks);

  public abstract void unregisterConnectionFailedListener(OnConnectionFailedListener paramOnConnectionFailedListener);

  public abstract <C extends Api.zza> C zza(Api.zzc<C> paramzzc);

  public abstract <A extends Api.zza, R extends Result, T extends zza.zza<R, A>> T zza(T paramT);

  public abstract boolean zza(Api<?> paramApi);

  public abstract boolean zza(Scope paramScope);

  public abstract <A extends Api.zza, T extends zza.zza<? extends Result, A>> T zzb(T paramT);

  public abstract boolean zzb(Api<?> paramApi);

  public abstract <L> zze<L> zzf(L paramL);

  public static final class Builder
  {
    private final Context mContext;
    private Account zzFN;
    private Looper zzMc;
    private final Set<String> zzMe = new HashSet();
    private int zzMf;
    private View zzMg;
    private String zzMh;
    private String zzMi;
    private final Map<Api<?>, Api.ApiOptions> zzMj = new HashMap();
    private final Map<Api<?>, Boolean> zzMk = new HashMap();
    private FragmentActivity zzMl;
    private int zzMm = -1;
    private GoogleApiClient.OnConnectionFailedListener zzMn;
    private Api.zzb<? extends zzur, zzus> zzMo;
    private final Set<GoogleApiClient.ConnectionCallbacks> zzMp = new HashSet();
    private final Set<GoogleApiClient.OnConnectionFailedListener> zzMq = new HashSet();
    private zzus.zza zzMr = new zzus.zza();

    public Builder(Context paramContext)
    {
      this.mContext = paramContext;
      this.zzMc = paramContext.getMainLooper();
      this.zzMh = paramContext.getPackageName();
      this.zzMi = paramContext.getClass().getName();
      this.zzMo = zzup.zzGS;
    }

    public Builder(Context paramContext, GoogleApiClient.ConnectionCallbacks paramConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener paramOnConnectionFailedListener)
    {
      this(paramContext);
      zzx.zzb(paramConnectionCallbacks, "Must provide a connected listener");
      this.zzMp.add(paramConnectionCallbacks);
      zzx.zzb(paramOnConnectionFailedListener, "Must provide a connection failed listener");
      this.zzMq.add(paramOnConnectionFailedListener);
    }

    private GoogleApiClient zzhZ()
    {
      zzh localzzh = zzh.zza(this.zzMl);
      Object localObject = localzzh.zzar(this.zzMm);
      if (localObject == null)
        localObject = new zzd(this.mContext.getApplicationContext(), this.zzMc, zzhY(), this.zzMo, this.zzMj, this.zzMk, this.zzMp, this.zzMq, this.zzMm);
      localzzh.zza(this.zzMm, (GoogleApiClient)localObject, this.zzMn);
      return localObject;
    }

    public Builder addApi(Api<? extends Api.ApiOptions.NotRequiredOptions> paramApi)
    {
      this.zzMj.put(paramApi, null);
      List localList = paramApi.zzhU();
      int i = localList.size();
      for (int j = 0; j < i; j++)
        this.zzMe.add(((Scope)localList.get(j)).zzio());
      return this;
    }

    public <O extends Api.ApiOptions.HasOptions> Builder addApi(Api<O> paramApi, O paramO)
    {
      zzx.zzb(paramO, "Null options are not permitted for this Api");
      this.zzMj.put(paramApi, paramO);
      List localList = paramApi.zzhU();
      int i = localList.size();
      for (int j = 0; j < i; j++)
        this.zzMe.add(((Scope)localList.get(j)).zzio());
      return this;
    }

    public Builder addConnectionCallbacks(GoogleApiClient.ConnectionCallbacks paramConnectionCallbacks)
    {
      this.zzMp.add(paramConnectionCallbacks);
      return this;
    }

    public Builder addOnConnectionFailedListener(GoogleApiClient.OnConnectionFailedListener paramOnConnectionFailedListener)
    {
      this.zzMq.add(paramOnConnectionFailedListener);
      return this;
    }

    public Builder addScope(Scope paramScope)
    {
      this.zzMe.add(paramScope.zzio());
      return this;
    }

    public GoogleApiClient build()
    {
      if (!this.zzMj.isEmpty());
      for (boolean bool = true; ; bool = false)
      {
        zzx.zzb(bool, "must call addApi() to add at least one API");
        if (this.zzMm < 0)
          break;
        return zzhZ();
      }
      return new zzd(this.mContext, this.zzMc, zzhY(), this.zzMo, this.zzMj, this.zzMk, this.zzMp, this.zzMq, -1);
    }

    public Builder enableAutoManage(FragmentActivity paramFragmentActivity, int paramInt, GoogleApiClient.OnConnectionFailedListener paramOnConnectionFailedListener)
    {
      if (paramInt >= 0);
      for (boolean bool = true; ; bool = false)
      {
        zzx.zzb(bool, "clientId must be non-negative");
        this.zzMm = paramInt;
        this.zzMl = ((FragmentActivity)zzx.zzb(paramFragmentActivity, "Null activity is not permitted."));
        this.zzMn = paramOnConnectionFailedListener;
        return this;
      }
    }

    public Builder requestServerAuthCode(String paramString, GoogleApiClient.ServerAuthCodeCallbacks paramServerAuthCodeCallbacks)
    {
      this.zzMr.zza(paramString, paramServerAuthCodeCallbacks);
      return this;
    }

    public Builder setAccountName(String paramString)
    {
      if (paramString == null);
      for (Account localAccount = null; ; localAccount = new Account(paramString, "com.google"))
      {
        this.zzFN = localAccount;
        return this;
      }
    }

    public Builder setGravityForPopups(int paramInt)
    {
      this.zzMf = paramInt;
      return this;
    }

    public Builder setHandler(Handler paramHandler)
    {
      zzx.zzb(paramHandler, "Handler must not be null");
      this.zzMc = paramHandler.getLooper();
      return this;
    }

    public Builder setViewForPopups(View paramView)
    {
      this.zzMg = paramView;
      return this;
    }

    public Builder useDefaultAccount()
    {
      return setAccountName("<<default account>>");
    }

    public zzf zzhY()
    {
      return new zzf(this.zzFN, this.zzMe, this.zzMf, this.zzMg, this.zzMh, this.zzMi, this.zzMr.zzsy());
    }
  }

  public static abstract interface ConnectionCallbacks
  {
    public static final int CAUSE_NETWORK_LOST = 2;
    public static final int CAUSE_SERVICE_DISCONNECTED = 1;

    public abstract void onConnected(Bundle paramBundle);

    public abstract void onConnectionSuspended(int paramInt);
  }

  public static abstract interface OnConnectionFailedListener
  {
    public abstract void onConnectionFailed(ConnectionResult paramConnectionResult);
  }

  public static abstract interface ServerAuthCodeCallbacks
  {
    public abstract CheckResult onCheckServerAuthorization(String paramString, Set<Scope> paramSet);

    public abstract boolean onUploadServerAuthCode(String paramString1, String paramString2);

    public static class CheckResult
    {
      private Set<Scope> zzMe;
      private boolean zzMs;

      private CheckResult(boolean paramBoolean, Set<Scope> paramSet)
      {
        this.zzMs = paramBoolean;
        this.zzMe = paramSet;
      }

      public static CheckResult newAuthNotRequiredResult()
      {
        return new CheckResult(false, null);
      }

      public static CheckResult newAuthRequiredResult(Set<Scope> paramSet)
      {
        if ((paramSet != null) && (!paramSet.isEmpty()));
        for (boolean bool = true; ; bool = false)
        {
          zzx.zzb(bool, "A non-empty scope set is required if further auth is needed.");
          return new CheckResult(true, paramSet);
        }
      }

      public boolean zzic()
      {
        return this.zzMs;
      }

      public Set<Scope> zzid()
      {
        return this.zzMe;
      }
    }
  }

  public static abstract interface zza
  {
    public abstract void zzia();

    public abstract void zzib();
  }
}