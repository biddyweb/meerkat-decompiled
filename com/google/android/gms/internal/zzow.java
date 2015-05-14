package com.google.android.gms.internal;

import android.content.Context;
import android.os.Bundle;
import android.os.DeadObjectException;
import android.os.IBinder;
import android.os.Looper;
import com.google.android.gms.common.api.GoogleApiClient.ConnectionCallbacks;
import com.google.android.gms.common.api.GoogleApiClient.OnConnectionFailedListener;
import com.google.android.gms.common.internal.zzk;

public class zzow extends zzk<zzpc>
{
  private final String zzamE;
  protected final zzpm<zzpc> zzamz = new zzpm()
  {
    public void zzfc()
    {
      zzow.zza(zzow.this);
    }

    public zzpc zzpu()
      throws DeadObjectException
    {
      return (zzpc)zzow.this.zzjb();
    }
  };

  public zzow(Context paramContext, Looper paramLooper, GoogleApiClient.ConnectionCallbacks paramConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener paramOnConnectionFailedListener, String paramString)
  {
    super(paramContext, paramLooper, 23, paramConnectionCallbacks, paramOnConnectionFailedListener);
    this.zzamE = paramString;
  }

  protected zzpc zzbi(IBinder paramIBinder)
  {
    return zzpc.zza.zzbk(paramIBinder);
  }

  protected String zzcF()
  {
    return "com.google.android.location.internal.GoogleLocationManagerService.START";
  }

  protected String zzcG()
  {
    return "com.google.android.gms.location.internal.IGoogleLocationManagerService";
  }

  protected Bundle zzhq()
  {
    Bundle localBundle = new Bundle();
    localBundle.putString("client_name", this.zzamE);
    return localBundle;
  }
}