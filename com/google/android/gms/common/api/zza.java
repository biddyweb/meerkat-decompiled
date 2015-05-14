package com.google.android.gms.common.api;

import android.os.DeadObjectException;
import android.os.RemoteException;
import com.google.android.gms.common.internal.zzx;
import java.util.concurrent.atomic.AtomicReference;

public class zza
{
  public static abstract class zza<R extends Result, A extends Api.zza> extends AbstractPendingResult<R>
    implements zza.zzb<R>, zzd.zzg<A>
  {
    private final Api.zzc<A> zzLT;
    private AtomicReference<zzd.zze> zzLV = new AtomicReference();

    protected zza(Api.zzc<A> paramzzc, GoogleApiClient paramGoogleApiClient)
    {
      super();
      this.zzLT = ((Api.zzc)zzx.zzl(paramzzc));
    }

    private void zza(RemoteException paramRemoteException)
    {
      zzk(new Status(8, paramRemoteException.getLocalizedMessage(), null));
    }

    protected void onResultConsumed()
    {
      zzd.zze localzze = (zzd.zze)this.zzLV.getAndSet(null);
      if (localzze != null)
        localzze.zzb(this);
    }

    protected abstract void zza(A paramA)
      throws RemoteException;

    public void zza(zzd.zze paramzze)
    {
      this.zzLV.set(paramzze);
    }

    public final void zzb(A paramA)
      throws DeadObjectException
    {
      try
      {
        zza(paramA);
        return;
      }
      catch (DeadObjectException localDeadObjectException)
      {
        zza(localDeadObjectException);
        throw localDeadObjectException;
      }
      catch (RemoteException localRemoteException)
      {
        zza(localRemoteException);
      }
    }

    public final Api.zzc<A> zzhV()
    {
      return this.zzLT;
    }

    public int zzhW()
    {
      return 0;
    }

    public final void zzk(Status paramStatus)
    {
      if (!paramStatus.isSuccess());
      for (boolean bool = true; ; bool = false)
      {
        zzx.zzb(bool, "Failed result must not be success");
        setResult(createFailedResult(paramStatus));
        return;
      }
    }
  }

  public static abstract interface zzb<R>
  {
    public abstract void zzd(R paramR);
  }
}