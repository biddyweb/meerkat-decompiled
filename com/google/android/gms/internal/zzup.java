package com.google.android.gms.internal;

import android.content.Context;
import android.os.Looper;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.Api.zzb;
import com.google.android.gms.common.api.Api.zzc;
import com.google.android.gms.common.api.GoogleApiClient.ConnectionCallbacks;
import com.google.android.gms.common.api.GoogleApiClient.OnConnectionFailedListener;
import com.google.android.gms.common.api.Scope;
import com.google.android.gms.common.internal.zzf;
import java.util.concurrent.Executors;

public final class zzup
{
  public static final Api<zzus> API = new Api(zzGS, zzGR, new Scope[0]);
  public static final Api.zzc<zzvc> zzGR = new Api.zzc();
  public static final Api.zzb<zzvc, zzus> zzGS = new Api.zzb()
  {
    public int getPriority()
    {
      return 2147483647;
    }

    public zzvc zza(Context paramAnonymousContext, Looper paramAnonymousLooper, zzf paramAnonymouszzf, zzus paramAnonymouszzus, GoogleApiClient.ConnectionCallbacks paramAnonymousConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener paramAnonymousOnConnectionFailedListener)
    {
      if (paramAnonymouszzus == null);
      for (zzus localzzus = zzus.zzawP; ; localzzus = paramAnonymouszzus)
        return new zzvc(paramAnonymousContext, paramAnonymousLooper, paramAnonymouszzf, localzzus, paramAnonymousConnectionCallbacks, paramAnonymousOnConnectionFailedListener, Executors.newSingleThreadExecutor());
    }
  };
  public static final zzuq zzawO = new zzvb();
}