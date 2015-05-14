package com.google.android.gms.internal;

import android.content.Context;
import android.os.IInterface;
import android.os.Looper;
import com.google.android.gms.common.api.GoogleApiClient.ConnectionCallbacks;
import com.google.android.gms.common.api.GoogleApiClient.OnConnectionFailedListener;
import com.google.android.gms.common.internal.zzf;
import com.google.android.gms.common.internal.zzk;

public abstract class zzmy<T extends IInterface> extends zzk<T>
{
  protected zzmy(Context paramContext, Looper paramLooper, int paramInt, GoogleApiClient.ConnectionCallbacks paramConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener paramOnConnectionFailedListener, zzf paramzzf)
  {
    super(paramContext, paramLooper, paramInt, paramConnectionCallbacks, paramOnConnectionFailedListener, paramzzf);
  }

  public boolean zzhc()
  {
    return !zzmr.zzV(getContext());
  }

  public boolean zzjd()
  {
    return true;
  }
}