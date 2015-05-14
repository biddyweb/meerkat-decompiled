package com.google.android.gms.drive.internal;

import android.os.RemoteException;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.zza.zzb;

public class zzbl extends zzc
{
  private final zza.zzb<Status> zzHa;

  public zzbl(zza.zzb<Status> paramzzb)
  {
    this.zzHa = paramzzb;
  }

  public void onSuccess()
    throws RemoteException
  {
    this.zzHa.zzd(Status.zzNo);
  }

  public void zzm(Status paramStatus)
    throws RemoteException
  {
    this.zzHa.zzd(paramStatus);
  }
}