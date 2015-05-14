package com.google.android.gms.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import android.os.RemoteException;

public abstract interface zzrv extends IInterface
{
  public abstract void zza(zzsa paramzzsa)
    throws RemoteException;

  public abstract void zza(zzsc paramzzsc)
    throws RemoteException;

  public abstract void zza(zzse paramzzse)
    throws RemoteException;

  public abstract void zza(zzsg paramzzsg)
    throws RemoteException;

  public static abstract class zza extends Binder
    implements zzrv
  {
    public static zzrv zzcl(IBinder paramIBinder)
    {
      if (paramIBinder == null)
        return null;
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.nearby.messages.internal.INearbyMessagesService");
      if ((localIInterface != null) && ((localIInterface instanceof zzrv)))
        return (zzrv)localIInterface;
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
        paramParcel2.writeString("com.google.android.gms.nearby.messages.internal.INearbyMessagesService");
        return true;
      case 1:
        paramParcel1.enforceInterface("com.google.android.gms.nearby.messages.internal.INearbyMessagesService");
        int m = paramParcel1.readInt();
        zzsa localzzsa = null;
        if (m != 0)
          localzzsa = (zzsa)zzsa.CREATOR.createFromParcel(paramParcel1);
        zza(localzzsa);
        return true;
      case 2:
        paramParcel1.enforceInterface("com.google.android.gms.nearby.messages.internal.INearbyMessagesService");
        int k = paramParcel1.readInt();
        zzse localzzse = null;
        if (k != 0)
          localzzse = (zzse)zzse.CREATOR.createFromParcel(paramParcel1);
        zza(localzzse);
        return true;
      case 3:
        paramParcel1.enforceInterface("com.google.android.gms.nearby.messages.internal.INearbyMessagesService");
        int j = paramParcel1.readInt();
        zzsc localzzsc = null;
        if (j != 0)
          localzzsc = (zzsc)zzsc.CREATOR.createFromParcel(paramParcel1);
        zza(localzzsc);
        return true;
      case 4:
      }
      paramParcel1.enforceInterface("com.google.android.gms.nearby.messages.internal.INearbyMessagesService");
      int i = paramParcel1.readInt();
      zzsg localzzsg = null;
      if (i != 0)
        localzzsg = (zzsg)zzsg.CREATOR.createFromParcel(paramParcel1);
      zza(localzzsg);
      return true;
    }

    private static class zza
      implements zzrv
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

      public void zza(zzsa paramzzsa)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.nearby.messages.internal.INearbyMessagesService");
          if (paramzzsa != null)
          {
            localParcel.writeInt(1);
            paramzzsa.writeToParcel(localParcel, 0);
          }
          while (true)
          {
            this.zzle.transact(1, localParcel, null, 1);
            return;
            localParcel.writeInt(0);
          }
        }
        finally
        {
          localParcel.recycle();
        }
      }

      public void zza(zzsc paramzzsc)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.nearby.messages.internal.INearbyMessagesService");
          if (paramzzsc != null)
          {
            localParcel.writeInt(1);
            paramzzsc.writeToParcel(localParcel, 0);
          }
          while (true)
          {
            this.zzle.transact(3, localParcel, null, 1);
            return;
            localParcel.writeInt(0);
          }
        }
        finally
        {
          localParcel.recycle();
        }
      }

      public void zza(zzse paramzzse)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.nearby.messages.internal.INearbyMessagesService");
          if (paramzzse != null)
          {
            localParcel.writeInt(1);
            paramzzse.writeToParcel(localParcel, 0);
          }
          while (true)
          {
            this.zzle.transact(2, localParcel, null, 1);
            return;
            localParcel.writeInt(0);
          }
        }
        finally
        {
          localParcel.recycle();
        }
      }

      public void zza(zzsg paramzzsg)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.nearby.messages.internal.INearbyMessagesService");
          if (paramzzsg != null)
          {
            localParcel.writeInt(1);
            paramzzsg.writeToParcel(localParcel, 0);
          }
          while (true)
          {
            this.zzle.transact(4, localParcel, null, 1);
            return;
            localParcel.writeInt(0);
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