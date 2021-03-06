package com.google.android.gms.common.internal;

import android.accounts.Account;
import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import android.os.RemoteException;

public abstract interface zzq extends IInterface
{
  public abstract Account getAccount()
    throws RemoteException;

  public static abstract class zza extends Binder
    implements zzq
  {
    public static zzq zzR(IBinder paramIBinder)
    {
      if (paramIBinder == null)
        return null;
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.common.internal.IAccountAccessor");
      if ((localIInterface != null) && ((localIInterface instanceof zzq)))
        return (zzq)localIInterface;
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
        paramParcel2.writeString("com.google.android.gms.common.internal.IAccountAccessor");
        return true;
      case 2:
      }
      paramParcel1.enforceInterface("com.google.android.gms.common.internal.IAccountAccessor");
      Account localAccount = getAccount();
      paramParcel2.writeNoException();
      if (localAccount != null)
      {
        paramParcel2.writeInt(1);
        localAccount.writeToParcel(paramParcel2, 1);
        return true;
      }
      paramParcel2.writeInt(0);
      return true;
    }

    private static class zza
      implements zzq
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

      public Account getAccount()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.common.internal.IAccountAccessor");
          this.zzle.transact(2, localParcel1, localParcel2, 0);
          localParcel2.readException();
          if (localParcel2.readInt() != 0)
          {
            localAccount = (Account)Account.CREATOR.createFromParcel(localParcel2);
            return localAccount;
          }
          Account localAccount = null;
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