package com.google.android.gms.internal;

import android.accounts.Account;
import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import android.os.RemoteException;
import com.google.android.gms.common.internal.zzc;
import com.google.android.gms.common.internal.zzq;
import com.google.android.gms.common.internal.zzq.zza;
import com.google.android.gms.common.internal.zzt;
import com.google.android.gms.common.internal.zzt.zza;
import com.google.android.gms.common.internal.zzy;

public abstract interface zzva extends IInterface
{
  public abstract void zza(int paramInt, Account paramAccount, zzuz paramzzuz)
    throws RemoteException;

  public abstract void zza(zzc paramzzc, zzuz paramzzuz)
    throws RemoteException;

  public abstract void zza(zzq paramzzq, int paramInt, boolean paramBoolean)
    throws RemoteException;

  public abstract void zza(zzy paramzzy, zzt paramzzt)
    throws RemoteException;

  public abstract void zza(zzuw paramzzuw)
    throws RemoteException;

  public abstract void zzaf(boolean paramBoolean)
    throws RemoteException;

  public abstract void zzhb(int paramInt)
    throws RemoteException;

  public static abstract class zza extends Binder
    implements zzva
  {
    public static zzva zzcF(IBinder paramIBinder)
    {
      if (paramIBinder == null)
        return null;
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.signin.internal.ISignInService");
      if ((localIInterface != null) && ((localIInterface instanceof zzva)))
        return (zzva)localIInterface;
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
        paramParcel2.writeString("com.google.android.gms.signin.internal.ISignInService");
        return true;
      case 2:
        paramParcel1.enforceInterface("com.google.android.gms.signin.internal.ISignInService");
        int i2 = paramParcel1.readInt();
        zzc localzzc = null;
        if (i2 != 0)
          localzzc = (zzc)zzc.CREATOR.createFromParcel(paramParcel1);
        zza(localzzc, zzuz.zza.zzcE(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 3:
        paramParcel1.enforceInterface("com.google.android.gms.signin.internal.ISignInService");
        int i1 = paramParcel1.readInt();
        zzuw localzzuw = null;
        if (i1 != 0)
          localzzuw = (zzuw)zzuw.CREATOR.createFromParcel(paramParcel1);
        zza(localzzuw);
        paramParcel2.writeNoException();
        return true;
      case 4:
        paramParcel1.enforceInterface("com.google.android.gms.signin.internal.ISignInService");
        if (paramParcel1.readInt() != 0);
        for (boolean bool2 = true; ; bool2 = false)
        {
          zzaf(bool2);
          paramParcel2.writeNoException();
          return true;
        }
      case 5:
        paramParcel1.enforceInterface("com.google.android.gms.signin.internal.ISignInService");
        int n = paramParcel1.readInt();
        zzy localzzy = null;
        if (n != 0)
          localzzy = (zzy)zzy.CREATOR.createFromParcel(paramParcel1);
        zza(localzzy, zzt.zza.zzV(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 7:
        paramParcel1.enforceInterface("com.google.android.gms.signin.internal.ISignInService");
        zzhb(paramParcel1.readInt());
        paramParcel2.writeNoException();
        return true;
      case 8:
        paramParcel1.enforceInterface("com.google.android.gms.signin.internal.ISignInService");
        int k = paramParcel1.readInt();
        int m = paramParcel1.readInt();
        Account localAccount = null;
        if (m != 0)
          localAccount = (Account)Account.CREATOR.createFromParcel(paramParcel1);
        zza(k, localAccount, zzuz.zza.zzcE(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 9:
      }
      paramParcel1.enforceInterface("com.google.android.gms.signin.internal.ISignInService");
      zzq localzzq = zzq.zza.zzR(paramParcel1.readStrongBinder());
      int i = paramParcel1.readInt();
      int j = paramParcel1.readInt();
      boolean bool1 = false;
      if (j != 0)
        bool1 = true;
      zza(localzzq, i, bool1);
      paramParcel2.writeNoException();
      return true;
    }

    private static class zza
      implements zzva
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

      public void zza(int paramInt, Account paramAccount, zzuz paramzzuz)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.signin.internal.ISignInService");
            localParcel1.writeInt(paramInt);
            if (paramAccount != null)
            {
              localParcel1.writeInt(1);
              paramAccount.writeToParcel(localParcel1, 0);
              if (paramzzuz != null)
              {
                localIBinder = paramzzuz.asBinder();
                localParcel1.writeStrongBinder(localIBinder);
                this.zzle.transact(8, localParcel1, localParcel2, 0);
                localParcel2.readException();
              }
            }
            else
            {
              localParcel1.writeInt(0);
              continue;
            }
          }
          finally
          {
            localParcel2.recycle();
            localParcel1.recycle();
          }
          IBinder localIBinder = null;
        }
      }

      public void zza(zzc paramzzc, zzuz paramzzuz)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.signin.internal.ISignInService");
            if (paramzzc != null)
            {
              localParcel1.writeInt(1);
              paramzzc.writeToParcel(localParcel1, 0);
              if (paramzzuz != null)
              {
                localIBinder = paramzzuz.asBinder();
                localParcel1.writeStrongBinder(localIBinder);
                this.zzle.transact(2, localParcel1, localParcel2, 0);
                localParcel2.readException();
              }
            }
            else
            {
              localParcel1.writeInt(0);
              continue;
            }
          }
          finally
          {
            localParcel2.recycle();
            localParcel1.recycle();
          }
          IBinder localIBinder = null;
        }
      }

      public void zza(zzq paramzzq, int paramInt, boolean paramBoolean)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.signin.internal.ISignInService");
          if (paramzzq != null);
          for (IBinder localIBinder = paramzzq.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeInt(paramInt);
            int i = 0;
            if (paramBoolean)
              i = 1;
            localParcel1.writeInt(i);
            this.zzle.transact(9, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zza(zzy paramzzy, zzt paramzzt)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.signin.internal.ISignInService");
            if (paramzzy != null)
            {
              localParcel1.writeInt(1);
              paramzzy.writeToParcel(localParcel1, 0);
              if (paramzzt != null)
              {
                localIBinder = paramzzt.asBinder();
                localParcel1.writeStrongBinder(localIBinder);
                this.zzle.transact(5, localParcel1, localParcel2, 0);
                localParcel2.readException();
              }
            }
            else
            {
              localParcel1.writeInt(0);
              continue;
            }
          }
          finally
          {
            localParcel2.recycle();
            localParcel1.recycle();
          }
          IBinder localIBinder = null;
        }
      }

      public void zza(zzuw paramzzuw)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.signin.internal.ISignInService");
          if (paramzzuw != null)
          {
            localParcel1.writeInt(1);
            paramzzuw.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(3, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzaf(boolean paramBoolean)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.signin.internal.ISignInService");
          int i = 0;
          if (paramBoolean)
            i = 1;
          localParcel1.writeInt(i);
          this.zzle.transact(4, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzhb(int paramInt)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.signin.internal.ISignInService");
          localParcel1.writeInt(paramInt);
          this.zzle.transact(7, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
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