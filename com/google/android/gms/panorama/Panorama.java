package com.google.android.gms.panorama;

import android.content.Context;
import android.os.Looper;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.Api.ApiOptions.NoOptions;
import com.google.android.gms.common.api.Api.zzb;
import com.google.android.gms.common.api.Api.zzc;
import com.google.android.gms.common.api.GoogleApiClient.ConnectionCallbacks;
import com.google.android.gms.common.api.GoogleApiClient.OnConnectionFailedListener;
import com.google.android.gms.common.api.Scope;
import com.google.android.gms.common.internal.zzf;
import com.google.android.gms.internal.zzsw;
import com.google.android.gms.internal.zzsx;

public final class Panorama
{
  public static final Api<Api.ApiOptions.NoOptions> API = new Api(zzGS, zzGR, new Scope[0]);
  public static final PanoramaApi PanoramaApi = new zzsw();
  public static final Api.zzc<zzsx> zzGR = new Api.zzc();
  static final Api.zzb<zzsx, Api.ApiOptions.NoOptions> zzGS = new Api.zzb()
  {
    public int getPriority()
    {
      return 2147483647;
    }

    public zzsx zzo(Context paramAnonymousContext, Looper paramAnonymousLooper, zzf paramAnonymouszzf, Api.ApiOptions.NoOptions paramAnonymousNoOptions, GoogleApiClient.ConnectionCallbacks paramAnonymousConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener paramAnonymousOnConnectionFailedListener)
    {
      return new zzsx(paramAnonymousContext, paramAnonymousLooper, paramAnonymousConnectionCallbacks, paramAnonymousOnConnectionFailedListener);
    }
  };
}