package com.google.android.gms.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;

public abstract interface zzku extends IInterface
{
  public abstract void zza(zzkt paramzzkt)
    throws RemoteException;

  public static abstract class zza extends Binder
    implements zzku
  {
    public static zzku zzaa(IBinder paramIBinder)
    {
      if (paramIBinder == null)
        return null;
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.common.internal.service.ICommonService");
      if ((localIInterface != null) && ((localIInterface instanceof zzku)))
        return (zzku)localIInterface;
      return new zza(paramIBinder);
    }

    public boolean onTransact(int paramInt1, Parcel paramParcel1, Parcel paramParcel2, int paramInt2)
      throws RemoteException
    {
      switch (paramInt1)
      {
      default:
        return super.onTransact(paramInt1, paramParcel1, paramParcel2, paramInt2);
      case 1598968902:
        paramParcel2.writeString("com.google.android.gms.common.internal.service.ICommonService");
        return true;
      case 1:
      }
      paramParcel1.enforceInterface("com.google.android.gms.common.internal.service.ICommonService");
      zza(zzkt.zza.zzZ(paramParcel1.readStrongBinder()));
      return true;
    }

    private static class zza
      implements zzku
    {
      private IBinder zzle;

      zza(IBinder paramIBinder)
      {
        this.zzle = paramIBinder;
      }

      public IBinder asBinder()
      {
        return this.zzle;
      }

      public void zza(zzkt paramzzkt)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.common.internal.service.ICommonService");
          IBinder localIBinder = null;
          if (paramzzkt != null)
            localIBinder = paramzzkt.asBinder();
          localParcel.writeStrongBinder(localIBinder);
          this.zzle.transact(1, localParcel, null, 1);
          return;
        }
        finally
        {
          localParcel.recycle();
        }
      }
    }
  }
}