package com.google.android.gms.identity.intents;

import android.app.Activity;
import android.content.Context;
import android.os.Looper;
import android.os.RemoteException;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.Api.ApiOptions.HasOptions;
import com.google.android.gms.common.api.Api.zzb;
import com.google.android.gms.common.api.Api.zzc;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.GoogleApiClient.ConnectionCallbacks;
import com.google.android.gms.common.api.GoogleApiClient.OnConnectionFailedListener;
import com.google.android.gms.common.api.Scope;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.zza.zza;
import com.google.android.gms.common.internal.zzf;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.internal.zzoq;

public final class Address
{
  public static final Api<AddressOptions> API = new Api(zzGS, zzGR, new Scope[0]);
  static final Api.zzc<zzoq> zzGR = new Api.zzc();
  private static final Api.zzb<zzoq, AddressOptions> zzGS = new Api.zzb()
  {
    public int getPriority()
    {
      return 2147483647;
    }

    public zzoq zza(Context paramAnonymousContext, Looper paramAnonymousLooper, zzf paramAnonymouszzf, Address.AddressOptions paramAnonymousAddressOptions, GoogleApiClient.ConnectionCallbacks paramAnonymousConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener paramAnonymousOnConnectionFailedListener)
    {
      zzx.zzb(paramAnonymousContext instanceof Activity, "An Activity must be used for Address APIs");
      if (paramAnonymousAddressOptions == null)
        paramAnonymousAddressOptions = new Address.AddressOptions();
      return new zzoq((Activity)paramAnonymousContext, paramAnonymousLooper, paramAnonymousConnectionCallbacks, paramAnonymousOnConnectionFailedListener, paramAnonymouszzf.getAccountName(), paramAnonymousAddressOptions.theme);
    }
  };

  public static void requestUserAddress(GoogleApiClient paramGoogleApiClient, final UserAddressRequest paramUserAddressRequest, final int paramInt)
  {
    paramGoogleApiClient.zza(new zza(paramGoogleApiClient)
    {
      protected void zza(zzoq paramAnonymouszzoq)
        throws RemoteException
      {
        paramAnonymouszzoq.zza(paramUserAddressRequest, paramInt);
        setResult(Status.zzNo);
      }
    });
  }

  public static final class AddressOptions
    implements Api.ApiOptions.HasOptions
  {
    public final int theme;

    public AddressOptions()
    {
      this.theme = 0;
    }

    public AddressOptions(int paramInt)
    {
      this.theme = paramInt;
    }
  }

  private static abstract class zza extends zza.zza<Status, zzoq>
  {
    public zza(GoogleApiClient paramGoogleApiClient)
    {
      super(paramGoogleApiClient);
    }

    public Status zzb(Status paramStatus)
    {
      return paramStatus;
    }
  }
}