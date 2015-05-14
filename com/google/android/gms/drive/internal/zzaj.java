package com.google.android.gms.drive.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;

public abstract interface zzaj extends IInterface
{
  public abstract void zzP(boolean paramBoolean)
    throws RemoteException;

  public static abstract class zza extends Binder
    implements zzaj
  {
    public static zzaj zzaf(IBinder paramIBinder)
    {
      if (paramIBinder == null)
        return null;
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.drive.internal.IEventReleaseCallback");
      if ((localIInterface != null) && ((localIInterface instanceof zzaj)))
        return (zzaj)localIInterface;
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
        paramParcel2.writeString("com.google.android.gms.drive.internal.IEventReleaseCallback");
        return true;
      case 1:
      }
      paramParcel1.enforceInterface("com.google.android.gms.drive.internal.IEventReleaseCallback");
      if (paramParcel1.readInt() != 0);
      for (boolean bool = true; ; bool = false)
      {
        zzP(bool);
        return true;
      }
    }

    private static class zza
      implements zzaj
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

      public void zzP(boolean paramBoolean)
        throws RemoteException
      {
        int i = 1;
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.drive.internal.IEventReleaseCallback");
          if (paramBoolean);
          while (true)
          {
            localParcel.writeInt(i);
            this.zzle.transact(1, localParcel, null, 1);
            return;
            i = 0;
          }
        }
        finally
        {
          localParcel.recycle();
        }
      }
    }
  }
}