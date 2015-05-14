package com.google.android.gms.internal;

import android.content.Intent;
import android.os.Binder;
import android.os.Bundle;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import android.os.RemoteException;
import com.google.android.gms.dynamic.zzd;
import com.google.android.gms.dynamic.zzd.zza;
import com.google.android.gms.wallet.MaskedWallet;
import com.google.android.gms.wallet.MaskedWalletRequest;
import com.google.android.gms.wallet.fragment.WalletFragmentInitParams;
import com.google.android.gms.wallet.fragment.WalletFragmentOptions;

public abstract interface zzwb extends IInterface
{
  public abstract int getState()
    throws RemoteException;

  public abstract void initialize(WalletFragmentInitParams paramWalletFragmentInitParams)
    throws RemoteException;

  public abstract void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
    throws RemoteException;

  public abstract void onCreate(Bundle paramBundle)
    throws RemoteException;

  public abstract zzd onCreateView(zzd paramzzd1, zzd paramzzd2, Bundle paramBundle)
    throws RemoteException;

  public abstract void onPause()
    throws RemoteException;

  public abstract void onResume()
    throws RemoteException;

  public abstract void onSaveInstanceState(Bundle paramBundle)
    throws RemoteException;

  public abstract void onStart()
    throws RemoteException;

  public abstract void onStop()
    throws RemoteException;

  public abstract void setEnabled(boolean paramBoolean)
    throws RemoteException;

  public abstract void updateMaskedWallet(MaskedWallet paramMaskedWallet)
    throws RemoteException;

  public abstract void updateMaskedWalletRequest(MaskedWalletRequest paramMaskedWalletRequest)
    throws RemoteException;

  public abstract void zza(zzd paramzzd, WalletFragmentOptions paramWalletFragmentOptions, Bundle paramBundle)
    throws RemoteException;

  public static abstract class zza extends Binder
    implements zzwb
  {
    public static zzwb zzcH(IBinder paramIBinder)
    {
      if (paramIBinder == null)
        return null;
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.wallet.fragment.internal.IWalletFragmentDelegate");
      if ((localIInterface != null) && ((localIInterface instanceof zzwb)))
        return (zzwb)localIInterface;
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
        paramParcel2.writeString("com.google.android.gms.wallet.fragment.internal.IWalletFragmentDelegate");
        return true;
      case 1:
        paramParcel1.enforceInterface("com.google.android.gms.wallet.fragment.internal.IWalletFragmentDelegate");
        zzd localzzd4 = zzd.zza.zzau(paramParcel1.readStrongBinder());
        WalletFragmentOptions localWalletFragmentOptions;
        if (paramParcel1.readInt() != 0)
        {
          localWalletFragmentOptions = (WalletFragmentOptions)WalletFragmentOptions.CREATOR.createFromParcel(paramParcel1);
          if (paramParcel1.readInt() == 0)
            break label229;
        }
        for (Bundle localBundle4 = (Bundle)Bundle.CREATOR.createFromParcel(paramParcel1); ; localBundle4 = null)
        {
          zza(localzzd4, localWalletFragmentOptions, localBundle4);
          paramParcel2.writeNoException();
          return true;
          localWalletFragmentOptions = null;
          break;
        }
      case 2:
        paramParcel1.enforceInterface("com.google.android.gms.wallet.fragment.internal.IWalletFragmentDelegate");
        if (paramParcel1.readInt() != 0);
        for (Bundle localBundle3 = (Bundle)Bundle.CREATOR.createFromParcel(paramParcel1); ; localBundle3 = null)
        {
          onCreate(localBundle3);
          paramParcel2.writeNoException();
          return true;
        }
      case 3:
        paramParcel1.enforceInterface("com.google.android.gms.wallet.fragment.internal.IWalletFragmentDelegate");
        zzd localzzd1 = zzd.zza.zzau(paramParcel1.readStrongBinder());
        zzd localzzd2 = zzd.zza.zzau(paramParcel1.readStrongBinder());
        if (paramParcel1.readInt() != 0);
        for (Bundle localBundle2 = (Bundle)Bundle.CREATOR.createFromParcel(paramParcel1); ; localBundle2 = null)
        {
          zzd localzzd3 = onCreateView(localzzd1, localzzd2, localBundle2);
          paramParcel2.writeNoException();
          IBinder localIBinder = null;
          if (localzzd3 != null)
            localIBinder = localzzd3.asBinder();
          paramParcel2.writeStrongBinder(localIBinder);
          return true;
        }
      case 4:
        paramParcel1.enforceInterface("com.google.android.gms.wallet.fragment.internal.IWalletFragmentDelegate");
        onStart();
        paramParcel2.writeNoException();
        return true;
      case 5:
        paramParcel1.enforceInterface("com.google.android.gms.wallet.fragment.internal.IWalletFragmentDelegate");
        onResume();
        paramParcel2.writeNoException();
        return true;
      case 6:
        paramParcel1.enforceInterface("com.google.android.gms.wallet.fragment.internal.IWalletFragmentDelegate");
        onPause();
        paramParcel2.writeNoException();
        return true;
      case 7:
        paramParcel1.enforceInterface("com.google.android.gms.wallet.fragment.internal.IWalletFragmentDelegate");
        onStop();
        paramParcel2.writeNoException();
        return true;
      case 8:
        paramParcel1.enforceInterface("com.google.android.gms.wallet.fragment.internal.IWalletFragmentDelegate");
        if (paramParcel1.readInt() != 0);
        for (Bundle localBundle1 = (Bundle)Bundle.CREATOR.createFromParcel(paramParcel1); ; localBundle1 = null)
        {
          onSaveInstanceState(localBundle1);
          paramParcel2.writeNoException();
          if (localBundle1 == null)
            break;
          paramParcel2.writeInt(1);
          localBundle1.writeToParcel(paramParcel2, 1);
          return true;
        }
        paramParcel2.writeInt(0);
        return true;
      case 9:
        paramParcel1.enforceInterface("com.google.android.gms.wallet.fragment.internal.IWalletFragmentDelegate");
        int j = paramParcel1.readInt();
        int k = paramParcel1.readInt();
        if (paramParcel1.readInt() != 0);
        for (Intent localIntent = (Intent)Intent.CREATOR.createFromParcel(paramParcel1); ; localIntent = null)
        {
          onActivityResult(j, k, localIntent);
          paramParcel2.writeNoException();
          return true;
        }
      case 10:
        paramParcel1.enforceInterface("com.google.android.gms.wallet.fragment.internal.IWalletFragmentDelegate");
        if (paramParcel1.readInt() != 0);
        for (WalletFragmentInitParams localWalletFragmentInitParams = (WalletFragmentInitParams)WalletFragmentInitParams.CREATOR.createFromParcel(paramParcel1); ; localWalletFragmentInitParams = null)
        {
          initialize(localWalletFragmentInitParams);
          paramParcel2.writeNoException();
          return true;
        }
      case 11:
        paramParcel1.enforceInterface("com.google.android.gms.wallet.fragment.internal.IWalletFragmentDelegate");
        if (paramParcel1.readInt() != 0);
        for (MaskedWalletRequest localMaskedWalletRequest = (MaskedWalletRequest)MaskedWalletRequest.CREATOR.createFromParcel(paramParcel1); ; localMaskedWalletRequest = null)
        {
          updateMaskedWalletRequest(localMaskedWalletRequest);
          paramParcel2.writeNoException();
          return true;
        }
      case 12:
        paramParcel1.enforceInterface("com.google.android.gms.wallet.fragment.internal.IWalletFragmentDelegate");
        if (paramParcel1.readInt() != 0);
        for (boolean bool = true; ; bool = false)
        {
          setEnabled(bool);
          paramParcel2.writeNoException();
          return true;
        }
      case 13:
        label229: paramParcel1.enforceInterface("com.google.android.gms.wallet.fragment.internal.IWalletFragmentDelegate");
        int i = getState();
        paramParcel2.writeNoException();
        paramParcel2.writeInt(i);
        return true;
      case 14:
      }
      paramParcel1.enforceInterface("com.google.android.gms.wallet.fragment.internal.IWalletFragmentDelegate");
      if (paramParcel1.readInt() != 0);
      for (MaskedWallet localMaskedWallet = (MaskedWallet)MaskedWallet.CREATOR.createFromParcel(paramParcel1); ; localMaskedWallet = null)
      {
        updateMaskedWallet(localMaskedWallet);
        paramParcel2.writeNoException();
        return true;
      }
    }

    private static class zza
      implements zzwb
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

      public int getState()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.wallet.fragment.internal.IWalletFragmentDelegate");
          this.zzle.transact(13, localParcel1, localParcel2, 0);
          localParcel2.readException();
          int i = localParcel2.readInt();
          return i;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void initialize(WalletFragmentInitParams paramWalletFragmentInitParams)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.wallet.fragment.internal.IWalletFragmentDelegate");
          if (paramWalletFragmentInitParams != null)
          {
            localParcel1.writeInt(1);
            paramWalletFragmentInitParams.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(10, localParcel1, localParcel2, 0);
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

      public void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.wallet.fragment.internal.IWalletFragmentDelegate");
          localParcel1.writeInt(paramInt1);
          localParcel1.writeInt(paramInt2);
          if (paramIntent != null)
          {
            localParcel1.writeInt(1);
            paramIntent.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(9, localParcel1, localParcel2, 0);
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

      public void onCreate(Bundle paramBundle)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.wallet.fragment.internal.IWalletFragmentDelegate");
          if (paramBundle != null)
          {
            localParcel1.writeInt(1);
            paramBundle.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(2, localParcel1, localParcel2, 0);
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

      public zzd onCreateView(zzd paramzzd1, zzd paramzzd2, Bundle paramBundle)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.wallet.fragment.internal.IWalletFragmentDelegate");
          IBinder localIBinder1;
          if (paramzzd1 != null)
          {
            localIBinder1 = paramzzd1.asBinder();
            localParcel1.writeStrongBinder(localIBinder1);
            IBinder localIBinder2 = null;
            if (paramzzd2 != null)
              localIBinder2 = paramzzd2.asBinder();
            localParcel1.writeStrongBinder(localIBinder2);
            if (paramBundle == null)
              break label125;
            localParcel1.writeInt(1);
            paramBundle.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(3, localParcel1, localParcel2, 0);
            localParcel2.readException();
            zzd localzzd = zzd.zza.zzau(localParcel2.readStrongBinder());
            return localzzd;
            localIBinder1 = null;
            break;
            label125: localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void onPause()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.wallet.fragment.internal.IWalletFragmentDelegate");
          this.zzle.transact(6, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void onResume()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.wallet.fragment.internal.IWalletFragmentDelegate");
          this.zzle.transact(5, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void onSaveInstanceState(Bundle paramBundle)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.wallet.fragment.internal.IWalletFragmentDelegate");
          if (paramBundle != null)
          {
            localParcel1.writeInt(1);
            paramBundle.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(8, localParcel1, localParcel2, 0);
            localParcel2.readException();
            if (localParcel2.readInt() != 0)
              paramBundle.readFromParcel(localParcel2);
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

      public void onStart()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.wallet.fragment.internal.IWalletFragmentDelegate");
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

      public void onStop()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.wallet.fragment.internal.IWalletFragmentDelegate");
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

      public void setEnabled(boolean paramBoolean)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.wallet.fragment.internal.IWalletFragmentDelegate");
          int i = 0;
          if (paramBoolean)
            i = 1;
          localParcel1.writeInt(i);
          this.zzle.transact(12, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void updateMaskedWallet(MaskedWallet paramMaskedWallet)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.wallet.fragment.internal.IWalletFragmentDelegate");
          if (paramMaskedWallet != null)
          {
            localParcel1.writeInt(1);
            paramMaskedWallet.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(14, localParcel1, localParcel2, 0);
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

      public void updateMaskedWalletRequest(MaskedWalletRequest paramMaskedWalletRequest)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.wallet.fragment.internal.IWalletFragmentDelegate");
          if (paramMaskedWalletRequest != null)
          {
            localParcel1.writeInt(1);
            paramMaskedWalletRequest.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(11, localParcel1, localParcel2, 0);
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

      public void zza(zzd paramzzd, WalletFragmentOptions paramWalletFragmentOptions, Bundle paramBundle)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.wallet.fragment.internal.IWalletFragmentDelegate");
            IBinder localIBinder;
            if (paramzzd != null)
            {
              localIBinder = paramzzd.asBinder();
              localParcel1.writeStrongBinder(localIBinder);
              if (paramWalletFragmentOptions != null)
              {
                localParcel1.writeInt(1);
                paramWalletFragmentOptions.writeToParcel(localParcel1, 0);
                if (paramBundle == null)
                  break label132;
                localParcel1.writeInt(1);
                paramBundle.writeToParcel(localParcel1, 0);
                this.zzle.transact(1, localParcel1, localParcel2, 0);
                localParcel2.readException();
              }
            }
            else
            {
              localIBinder = null;
              continue;
            }
            localParcel1.writeInt(0);
            continue;
          }
          finally
          {
            localParcel2.recycle();
            localParcel1.recycle();
          }
          label132: localParcel1.writeInt(0);
        }
      }
    }
  }
}