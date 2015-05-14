package com.google.android.gms.location;

import android.content.Context;
import android.os.Looper;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.Api.ApiOptions.NoOptions;
import com.google.android.gms.common.api.Api.zzb;
import com.google.android.gms.common.api.Api.zzc;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.GoogleApiClient.ConnectionCallbacks;
import com.google.android.gms.common.api.GoogleApiClient.OnConnectionFailedListener;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.Scope;
import com.google.android.gms.common.api.zza.zza;
import com.google.android.gms.common.internal.zzf;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.internal.zzoz;
import com.google.android.gms.internal.zzpa;
import com.google.android.gms.internal.zzpf;
import com.google.android.gms.internal.zzpn;

public class LocationServices
{
  public static final Api<Api.ApiOptions.NoOptions> API = new Api(zzGS, zzGR, new Scope[0]);
  public static FusedLocationProviderApi FusedLocationApi = new zzoz();
  public static GeofencingApi GeofencingApi = new zzpa();
  public static SettingsApi SettingsApi = new zzpn();
  private static final Api.zzc<zzpf> zzGR = new Api.zzc();
  private static final Api.zzb<zzpf, Api.ApiOptions.NoOptions> zzGS = new Api.zzb()
  {
    public int getPriority()
    {
      return 2147483647;
    }

    public zzpf zzk(Context paramAnonymousContext, Looper paramAnonymousLooper, zzf paramAnonymouszzf, Api.ApiOptions.NoOptions paramAnonymousNoOptions, GoogleApiClient.ConnectionCallbacks paramAnonymousConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener paramAnonymousOnConnectionFailedListener)
    {
      return new zzpf(paramAnonymousContext, paramAnonymousLooper, paramAnonymousContext.getPackageName(), paramAnonymousConnectionCallbacks, paramAnonymousOnConnectionFailedListener, "locationServices", paramAnonymouszzf.getAccountName());
    }
  };

  public static zzpf zze(GoogleApiClient paramGoogleApiClient)
  {
    boolean bool1 = true;
    boolean bool2;
    zzpf localzzpf;
    if (paramGoogleApiClient != null)
    {
      bool2 = bool1;
      zzx.zzb(bool2, "GoogleApiClient parameter is required.");
      localzzpf = (zzpf)paramGoogleApiClient.zza(zzGR);
      if (localzzpf == null)
        break label44;
    }
    while (true)
    {
      zzx.zza(bool1, "GoogleApiClient is not configured to use the LocationServices.API Api. Pass thisinto GoogleApiClient.Builder#addApi() to use this feature.");
      return localzzpf;
      bool2 = false;
      break;
      label44: bool1 = false;
    }
  }

  public static abstract class zza<R extends Result> extends zza.zza<R, zzpf>
  {
    public zza(GoogleApiClient paramGoogleApiClient)
    {
      super(paramGoogleApiClient);
    }
  }
}