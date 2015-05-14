package com.google.android.gms.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import java.util.ArrayList;
import java.util.List;

public abstract interface zzsl extends IInterface
{
  public abstract boolean zzrs()
    throws RemoteException;

  public abstract List<zzsi> zzrt()
    throws RemoteException;

  public static abstract class zza extends Binder
    implements zzsl
  {
    public static zzsl zzcn(IBinder paramIBinder)
    {
      if (paramIBinder == null)
        return null;
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.nearby.sharing.internal.IContentProvider");
      if ((localIInterface != null) && ((localIInterface instanceof zzsl)))
        return (zzsl)localIInterface;
      return new zza(paramIBinder);
    }

    public IBinder asBinder()
    {
      return this;
    }

    public boolean onTransact(int paramInt1, Parcel paramParcel1, Parcel paramParcel2, int paramInt2)
      throws RemoteException
    {
      switch (paramInt1)
      {
      default:
        return super.onTransact(paramInt1, paramParcel1, paramParcel2, paramInt2);
      case 1598968902:
        paramParcel2.writeString("com.google.android.gms.nearby.sharing.internal.IContentProvider");
        return true;
      case 1:
        paramParcel1.enforceInterface("com.google.android.gms.nearby.sharing.internal.IContentProvider");
        boolean bool = zzrs();
        paramParcel2.writeNoException();
        if (bool);
        for (int i = 1; ; i = 0)
        {
          paramParcel2.writeInt(i);
          return true;
        }
      case 2:
      }
      paramParcel1.enforceInterface("com.google.android.gms.nearby.sharing.internal.IContentProvider");
      List localList = zzrt();
      paramParcel2.writeNoException();
      paramParcel2.writeTypedList(localList);
      return true;
    }

    private static class zza
      implements zzsl
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

      public boolean zzrs()
        throws RemoteException
      {
        boolean bool = true;
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.nearby.sharing.internal.IContentProvider");
          this.zzle.transact(1, localParcel1, localParcel2, 0);
          localParcel2.readException();
          int i = localParcel2.readInt();
          if (i != 0)
            return bool;
          bool = false;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public List<zzsi> zzrt()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.nearby.sharing.internal.IContentProvider");
          this.zzle.transact(2, localParcel1, localParcel2, 0);
          localParcel2.readException();
          ArrayList localArrayList = localParcel2.createTypedArrayList(zzsi.CREATOR);
          return localArrayList;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }
    }
  }
}