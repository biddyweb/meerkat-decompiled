package com.google.android.gms.internal;

import android.content.Context;
import android.os.IBinder;
import android.os.Looper;
import android.os.RemoteException;
import com.google.android.gms.common.api.GoogleApiClient.ConnectionCallbacks;
import com.google.android.gms.common.api.GoogleApiClient.OnConnectionFailedListener;
import com.google.android.gms.common.internal.zzk;

public class zzun extends zzk<zzul>
{
  public zzun(Context paramContext, Looper paramLooper, GoogleApiClient.ConnectionCallbacks paramConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener paramOnConnectionFailedListener)
  {
    super(paramContext, paramLooper, 45, paramConnectionCallbacks, paramOnConnectionFailedListener);
  }

  public void zza(zzuk paramzzuk, byte[] paramArrayOfByte)
    throws RemoteException
  {
    ((zzul)zzjb()).zza(paramzzuk, paramArrayOfByte);
  }

  protected zzul zzcD(IBinder paramIBinder)
  {
    return zzul.zza.zzcC(paramIBinder);
  }

  protected String zzcF()
  {
    return "com.google.android.gms.safetynet.service.START";
  }

  protected String zzcG()
  {
    return "com.google.android.gms.safetynet.internal.ISafetyNetService";
  }
}