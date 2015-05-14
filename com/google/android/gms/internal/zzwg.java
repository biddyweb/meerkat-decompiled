package com.google.android.gms.internal;

import android.os.Binder;
import android.os.Bundle;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import android.os.RemoteException;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.StatusCreator;
import com.google.android.gms.wallet.FullWallet;
import com.google.android.gms.wallet.MaskedWallet;

public abstract interface zzwg extends IInterface
{
  public abstract void zza(int paramInt, FullWallet paramFullWallet, Bundle paramBundle)
    throws RemoteException;

  public abstract void zza(int paramInt, MaskedWallet paramMaskedWallet, Bundle paramBundle)
    throws RemoteException;

  public abstract void zza(int paramInt, boolean paramBoolean, Bundle paramBundle)
    throws RemoteException;

  public abstract void zza(Status paramStatus, zzvz paramzzvz, Bundle paramBundle)
    throws RemoteException;

  public abstract void zzb(int paramInt, boolean paramBoolean, Bundle paramBundle)
    throws RemoteException;

  public abstract void zzk(int paramInt, Bundle paramBundle)
    throws RemoteException;

  public static abstract class zza extends Binder
    implements zzwg
  {
    public zza()
    {
      attachInterface(this, "com.google.android.gms.wallet.internal.IWalletServiceCallbacks");
    }

    public static zzwg zzcM(IBinder paramIBinder)
    {
      if (paramIBinder == null)
        return null;
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.wallet.internal.IWalletServiceCallbacks");
      if ((localIInterface != null) && ((localIInterface instanceof zzwg)))
        return (zzwg)localIInterface;
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
        paramParcel2.writeString("com.google.android.gms.wallet.internal.IWalletServiceCallbacks");
        return true;
      case 1:
        paramParcel1.enforceInterface("com.google.android.gms.wallet.internal.IWalletServiceCallbacks");
        int n = paramParcel1.readInt();
        MaskedWallet localMaskedWallet;
        if (paramParcel1.readInt() != 0)
        {
          localMaskedWallet = (MaskedWallet)MaskedWallet.CREATOR.createFromParcel(paramParcel1);
          if (paramParcel1.readInt() == 0)
            break label162;
        }
        for (Bundle localBundle6 = (Bundle)Bundle.CREATOR.createFromParcel(paramParcel1); ; localBundle6 = null)
        {
          zza(n, localMaskedWallet, localBundle6);
          paramParcel2.writeNoException();
          return true;
          localMaskedWallet = null;
          break;
        }
      case 2:
        paramParcel1.enforceInterface("com.google.android.gms.wallet.internal.IWalletServiceCallbacks");
        int m = paramParcel1.readInt();
        FullWallet localFullWallet;
        if (paramParcel1.readInt() != 0)
        {
          localFullWallet = (FullWallet)FullWallet.CREATOR.createFromParcel(paramParcel1);
          if (paramParcel1.readInt() == 0)
            break label244;
        }
        for (Bundle localBundle5 = (Bundle)Bundle.CREATOR.createFromParcel(paramParcel1); ; localBundle5 = null)
        {
          zza(m, localFullWallet, localBundle5);
          paramParcel2.writeNoException();
          return true;
          localFullWallet = null;
          break;
        }
      case 3:
        paramParcel1.enforceInterface("com.google.android.gms.wallet.internal.IWalletServiceCallbacks");
        int k = paramParcel1.readInt();
        boolean bool2;
        if (paramParcel1.readInt() != 0)
        {
          bool2 = true;
          if (paramParcel1.readInt() == 0)
            break label315;
        }
        for (Bundle localBundle4 = (Bundle)Bundle.CREATOR.createFromParcel(paramParcel1); ; localBundle4 = null)
        {
          zza(k, bool2, localBundle4);
          paramParcel2.writeNoException();
          return true;
          bool2 = false;
          break;
        }
      case 4:
        paramParcel1.enforceInterface("com.google.android.gms.wallet.internal.IWalletServiceCallbacks");
        int j = paramParcel1.readInt();
        if (paramParcel1.readInt() != 0);
        for (Bundle localBundle3 = (Bundle)Bundle.CREATOR.createFromParcel(paramParcel1); ; localBundle3 = null)
        {
          zzk(j, localBundle3);
          paramParcel2.writeNoException();
          return true;
        }
      case 5:
        label162: label244: paramParcel1.enforceInterface("com.google.android.gms.wallet.internal.IWalletServiceCallbacks");
        label315: Status localStatus;
        zzvz localzzvz;
        if (paramParcel1.readInt() != 0)
        {
          localStatus = Status.CREATOR.createFromParcel(paramParcel1);
          if (paramParcel1.readInt() == 0)
            break label460;
          localzzvz = (zzvz)zzvz.CREATOR.createFromParcel(paramParcel1);
          label417: if (paramParcel1.readInt() == 0)
            break label466;
        }
        label460: label466: for (Bundle localBundle2 = (Bundle)Bundle.CREATOR.createFromParcel(paramParcel1); ; localBundle2 = null)
        {
          zza(localStatus, localzzvz, localBundle2);
          paramParcel2.writeNoException();
          return true;
          localStatus = null;
          break;
          localzzvz = null;
          break label417;
        }
      case 6:
      }
      paramParcel1.enforceInterface("com.google.android.gms.wallet.internal.IWalletServiceCallbacks");
      int i = paramParcel1.readInt();
      boolean bool1;
      if (paramParcel1.readInt() != 0)
      {
        bool1 = true;
        if (paramParcel1.readInt() == 0)
          break label537;
      }
      label537: for (Bundle localBundle1 = (Bundle)Bundle.CREATOR.createFromParcel(paramParcel1); ; localBundle1 = null)
      {
        zzb(i, bool1, localBundle1);
        paramParcel2.writeNoException();
        return true;
        bool1 = false;
        break;
      }
    }

    private static class zza
      implements zzwg
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

      public void zza(int paramInt, FullWallet paramFullWallet, Bundle paramBundle)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.wallet.internal.IWalletServiceCallbacks");
            localParcel1.writeInt(paramInt);
            if (paramFullWallet != null)
            {
              localParcel1.writeInt(1);
              paramFullWallet.writeToParcel(localParcel1, 0);
              if (paramBundle != null)
              {
                localParcel1.writeInt(1);
                paramBundle.writeToParcel(localParcel1, 0);
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
          localParcel1.writeInt(0);
        }
      }

      public void zza(int paramInt, MaskedWallet paramMaskedWallet, Bundle paramBundle)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.wallet.internal.IWalletServiceCallbacks");
            localParcel1.writeInt(paramInt);
            if (paramMaskedWallet != null)
            {
              localParcel1.writeInt(1);
              paramMaskedWallet.writeToParcel(localParcel1, 0);
              if (paramBundle != null)
              {
                localParcel1.writeInt(1);
                paramBundle.writeToParcel(localParcel1, 0);
                this.zzle.transact(1, localParcel1, localParcel2, 0);
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
          localParcel1.writeInt(0);
        }
      }

      public void zza(int paramInt, boolean paramBoolean, Bundle paramBundle)
        throws RemoteException
      {
        int i = 1;
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.wallet.internal.IWalletServiceCallbacks");
          localParcel1.writeInt(paramInt);
          if (paramBoolean)
          {
            localParcel1.writeInt(i);
            if (paramBundle == null)
              break label92;
            localParcel1.writeInt(1);
            paramBundle.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(3, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            i = 0;
            break;
            label92: localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zza(Status paramStatus, zzvz paramzzvz, Bundle paramBundle)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.wallet.internal.IWalletServiceCallbacks");
            if (paramStatus != null)
            {
              localParcel1.writeInt(1);
              paramStatus.writeToParcel(localParcel1, 0);
              if (paramzzvz != null)
              {
                localParcel1.writeInt(1);
                paramzzvz.writeToParcel(localParcel1, 0);
                if (paramBundle == null)
                  break label133;
                localParcel1.writeInt(1);
                paramBundle.writeToParcel(localParcel1, 0);
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
          localParcel1.writeInt(0);
          continue;
          label133: localParcel1.writeInt(0);
        }
      }

      public void zzb(int paramInt, boolean paramBoolean, Bundle paramBundle)
        throws RemoteException
      {
        int i = 1;
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.wallet.internal.IWalletServiceCallbacks");
          localParcel1.writeInt(paramInt);
          if (paramBoolean)
          {
            localParcel1.writeInt(i);
            if (paramBundle == null)
              break label93;
            localParcel1.writeInt(1);
            paramBundle.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(6, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            i = 0;
            break;
            label93: localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzk(int paramInt, Bundle paramBundle)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.wallet.internal.IWalletServiceCallbacks");
          localParcel1.writeInt(paramInt);
          if (paramBundle != null)
          {
            localParcel1.writeInt(1);
            paramBundle.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(4, localParcel1, localParcel2, 0);
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
    }
  }
}