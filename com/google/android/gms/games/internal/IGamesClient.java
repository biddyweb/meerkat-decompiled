package com.google.android.gms.games.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;

public abstract interface IGamesClient extends IInterface
{
  public abstract PopupLocationInfoParcelable zznk()
    throws RemoteException;

  public static abstract class Stub extends Binder
    implements IGamesClient
  {
    public Stub()
    {
      attachInterface(this, "com.google.android.gms.games.internal.IGamesClient");
    }

    public static IGamesClient zzaY(IBinder paramIBinder)
    {
      if (paramIBinder == null)
        return null;
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.games.internal.IGamesClient");
      if ((localIInterface != null) && ((localIInterface instanceof IGamesClient)))
        return (IGamesClient)localIInterface;
      return new Proxy(paramIBinder);
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
        paramParcel2.writeString("com.google.android.gms.games.internal.IGamesClient");
        return true;
      case 1001:
      }
      paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesClient");
      PopupLocationInfoParcelable localPopupLocationInfoParcelable = zznk();
      paramParcel2.writeNoException();
      if (localPopupLocationInfoParcelable != null)
      {
        paramParcel2.writeInt(1);
        localPopupLocationInfoParcelable.writeToParcel(paramParcel2, 1);
        return true;
      }
      paramParcel2.writeInt(0);
      return true;
    }

    private static class Proxy
      implements IGamesClient
    {
      private IBinder zzle;

      Proxy(IBinder paramIBinder)
      {
        this.zzle = paramIBinder;
      }

      public IBinder asBinder()
      {
        return this.zzle;
      }

      public PopupLocationInfoParcelable zznk()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesClient");
          this.zzle.transact(1001, localParcel1, localParcel2, 0);
          localParcel2.readException();
          if (localParcel2.readInt() != 0)
          {
            PopupLocationInfoParcelable localPopupLocationInfoParcelable2 = PopupLocationInfoParcelable.CREATOR.zzcY(localParcel2);
            localPopupLocationInfoParcelable1 = localPopupLocationInfoParcelable2;
            return localPopupLocationInfoParcelable1;
          }
          PopupLocationInfoParcelable localPopupLocationInfoParcelable1 = null;
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