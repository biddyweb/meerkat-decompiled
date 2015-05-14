package com.google.android.gms.internal;

import android.os.Binder;
import android.os.Bundle;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import android.os.RemoteException;
import com.google.android.gms.wallet.FullWalletRequest;
import com.google.android.gms.wallet.MaskedWalletRequest;
import com.google.android.gms.wallet.NotifyTransactionStatusRequest;
import com.google.android.gms.wallet.zzd;

public abstract interface zzwd extends IInterface
{
  public abstract void zza(Bundle paramBundle, zzwg paramzzwg)
    throws RemoteException;

  public abstract void zza(zzvx paramzzvx, Bundle paramBundle, zzwg paramzzwg)
    throws RemoteException;

  public abstract void zza(FullWalletRequest paramFullWalletRequest, Bundle paramBundle, zzwg paramzzwg)
    throws RemoteException;

  public abstract void zza(MaskedWalletRequest paramMaskedWalletRequest, Bundle paramBundle, zzwf paramzzwf)
    throws RemoteException;

  public abstract void zza(MaskedWalletRequest paramMaskedWalletRequest, Bundle paramBundle, zzwg paramzzwg)
    throws RemoteException;

  public abstract void zza(NotifyTransactionStatusRequest paramNotifyTransactionStatusRequest, Bundle paramBundle)
    throws RemoteException;

  public abstract void zza(zzd paramzzd, Bundle paramBundle, zzwg paramzzwg)
    throws RemoteException;

  public abstract void zza(String paramString1, String paramString2, Bundle paramBundle, zzwg paramzzwg)
    throws RemoteException;

  public abstract void zzb(Bundle paramBundle, zzwg paramzzwg)
    throws RemoteException;

  public abstract void zzv(Bundle paramBundle)
    throws RemoteException;

  public abstract void zzw(Bundle paramBundle)
    throws RemoteException;

  public static abstract class zza extends Binder
    implements zzwd
  {
    public static zzwd zzcJ(IBinder paramIBinder)
    {
      if (paramIBinder == null)
        return null;
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.wallet.internal.IOwService");
      if ((localIInterface != null) && ((localIInterface instanceof zzwd)))
        return (zzwd)localIInterface;
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
        paramParcel2.writeString("com.google.android.gms.wallet.internal.IOwService");
        return true;
      case 1:
        paramParcel1.enforceInterface("com.google.android.gms.wallet.internal.IOwService");
        MaskedWalletRequest localMaskedWalletRequest2;
        if (paramParcel1.readInt() != 0)
        {
          localMaskedWalletRequest2 = (MaskedWalletRequest)MaskedWalletRequest.CREATOR.createFromParcel(paramParcel1);
          if (paramParcel1.readInt() == 0)
            break label197;
        }
        for (Bundle localBundle11 = (Bundle)Bundle.CREATOR.createFromParcel(paramParcel1); ; localBundle11 = null)
        {
          zza(localMaskedWalletRequest2, localBundle11, zzwg.zza.zzcM(paramParcel1.readStrongBinder()));
          return true;
          localMaskedWalletRequest2 = null;
          break;
        }
      case 2:
        paramParcel1.enforceInterface("com.google.android.gms.wallet.internal.IOwService");
        FullWalletRequest localFullWalletRequest;
        if (paramParcel1.readInt() != 0)
        {
          localFullWalletRequest = (FullWalletRequest)FullWalletRequest.CREATOR.createFromParcel(paramParcel1);
          if (paramParcel1.readInt() == 0)
            break label274;
        }
        for (Bundle localBundle10 = (Bundle)Bundle.CREATOR.createFromParcel(paramParcel1); ; localBundle10 = null)
        {
          zza(localFullWalletRequest, localBundle10, zzwg.zza.zzcM(paramParcel1.readStrongBinder()));
          return true;
          localFullWalletRequest = null;
          break;
        }
      case 3:
        paramParcel1.enforceInterface("com.google.android.gms.wallet.internal.IOwService");
        String str1 = paramParcel1.readString();
        String str2 = paramParcel1.readString();
        if (paramParcel1.readInt() != 0);
        for (Bundle localBundle9 = (Bundle)Bundle.CREATOR.createFromParcel(paramParcel1); ; localBundle9 = null)
        {
          zza(str1, str2, localBundle9, zzwg.zza.zzcM(paramParcel1.readStrongBinder()));
          return true;
        }
      case 4:
        paramParcel1.enforceInterface("com.google.android.gms.wallet.internal.IOwService");
        NotifyTransactionStatusRequest localNotifyTransactionStatusRequest;
        if (paramParcel1.readInt() != 0)
        {
          localNotifyTransactionStatusRequest = (NotifyTransactionStatusRequest)NotifyTransactionStatusRequest.CREATOR.createFromParcel(paramParcel1);
          if (paramParcel1.readInt() == 0)
            break label408;
        }
        for (Bundle localBundle8 = (Bundle)Bundle.CREATOR.createFromParcel(paramParcel1); ; localBundle8 = null)
        {
          zza(localNotifyTransactionStatusRequest, localBundle8);
          return true;
          localNotifyTransactionStatusRequest = null;
          break;
        }
      case 5:
        paramParcel1.enforceInterface("com.google.android.gms.wallet.internal.IOwService");
        if (paramParcel1.readInt() != 0);
        for (Bundle localBundle7 = (Bundle)Bundle.CREATOR.createFromParcel(paramParcel1); ; localBundle7 = null)
        {
          zza(localBundle7, zzwg.zza.zzcM(paramParcel1.readStrongBinder()));
          return true;
        }
      case 6:
        paramParcel1.enforceInterface("com.google.android.gms.wallet.internal.IOwService");
        zzd localzzd;
        if (paramParcel1.readInt() != 0)
        {
          localzzd = (zzd)zzd.CREATOR.createFromParcel(paramParcel1);
          if (paramParcel1.readInt() == 0)
            break label533;
        }
        for (Bundle localBundle6 = (Bundle)Bundle.CREATOR.createFromParcel(paramParcel1); ; localBundle6 = null)
        {
          zza(localzzd, localBundle6, zzwg.zza.zzcM(paramParcel1.readStrongBinder()));
          return true;
          localzzd = null;
          break;
        }
      case 7:
        paramParcel1.enforceInterface("com.google.android.gms.wallet.internal.IOwService");
        MaskedWalletRequest localMaskedWalletRequest1;
        if (paramParcel1.readInt() != 0)
        {
          localMaskedWalletRequest1 = (MaskedWalletRequest)MaskedWalletRequest.CREATOR.createFromParcel(paramParcel1);
          if (paramParcel1.readInt() == 0)
            break label610;
        }
        for (Bundle localBundle5 = (Bundle)Bundle.CREATOR.createFromParcel(paramParcel1); ; localBundle5 = null)
        {
          zza(localMaskedWalletRequest1, localBundle5, zzwf.zza.zzcL(paramParcel1.readStrongBinder()));
          return true;
          localMaskedWalletRequest1 = null;
          break;
        }
      case 8:
        paramParcel1.enforceInterface("com.google.android.gms.wallet.internal.IOwService");
        zzvx localzzvx;
        if (paramParcel1.readInt() != 0)
        {
          localzzvx = (zzvx)zzvx.CREATOR.createFromParcel(paramParcel1);
          if (paramParcel1.readInt() == 0)
            break label687;
        }
        for (Bundle localBundle4 = (Bundle)Bundle.CREATOR.createFromParcel(paramParcel1); ; localBundle4 = null)
        {
          zza(localzzvx, localBundle4, zzwg.zza.zzcM(paramParcel1.readStrongBinder()));
          return true;
          localzzvx = null;
          break;
        }
      case 9:
        paramParcel1.enforceInterface("com.google.android.gms.wallet.internal.IOwService");
        if (paramParcel1.readInt() != 0);
        for (Bundle localBundle3 = (Bundle)Bundle.CREATOR.createFromParcel(paramParcel1); ; localBundle3 = null)
        {
          zzv(localBundle3);
          return true;
        }
      case 10:
        label197: label610: paramParcel1.enforceInterface("com.google.android.gms.wallet.internal.IOwService");
        label274: label408: label687: if (paramParcel1.readInt() != 0);
        label533: for (Bundle localBundle2 = (Bundle)Bundle.CREATOR.createFromParcel(paramParcel1); ; localBundle2 = null)
        {
          zzw(localBundle2);
          return true;
        }
      case 11:
      }
      paramParcel1.enforceInterface("com.google.android.gms.wallet.internal.IOwService");
      if (paramParcel1.readInt() != 0);
      for (Bundle localBundle1 = (Bundle)Bundle.CREATOR.createFromParcel(paramParcel1); ; localBundle1 = null)
      {
        zzb(localBundle1, zzwg.zza.zzcM(paramParcel1.readStrongBinder()));
        return true;
      }
    }

    private static class zza
      implements zzwd
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

      public void zza(Bundle paramBundle, zzwg paramzzwg)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.wallet.internal.IOwService");
          if (paramBundle != null)
          {
            localParcel.writeInt(1);
            paramBundle.writeToParcel(localParcel, 0);
          }
          while (true)
          {
            IBinder localIBinder = null;
            if (paramzzwg != null)
              localIBinder = paramzzwg.asBinder();
            localParcel.writeStrongBinder(localIBinder);
            this.zzle.transact(5, localParcel, null, 1);
            return;
            localParcel.writeInt(0);
          }
        }
        finally
        {
          localParcel.recycle();
        }
      }

      public void zza(zzvx paramzzvx, Bundle paramBundle, zzwg paramzzwg)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel.writeInterfaceToken("com.google.android.gms.wallet.internal.IOwService");
            if (paramzzvx != null)
            {
              localParcel.writeInt(1);
              paramzzvx.writeToParcel(localParcel, 0);
              if (paramBundle != null)
              {
                localParcel.writeInt(1);
                paramBundle.writeToParcel(localParcel, 0);
                IBinder localIBinder = null;
                if (paramzzwg != null)
                  localIBinder = paramzzwg.asBinder();
                localParcel.writeStrongBinder(localIBinder);
                this.zzle.transact(8, localParcel, null, 1);
              }
            }
            else
            {
              localParcel.writeInt(0);
              continue;
            }
          }
          finally
          {
            localParcel.recycle();
          }
          localParcel.writeInt(0);
        }
      }

      public void zza(FullWalletRequest paramFullWalletRequest, Bundle paramBundle, zzwg paramzzwg)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel.writeInterfaceToken("com.google.android.gms.wallet.internal.IOwService");
            if (paramFullWalletRequest != null)
            {
              localParcel.writeInt(1);
              paramFullWalletRequest.writeToParcel(localParcel, 0);
              if (paramBundle != null)
              {
                localParcel.writeInt(1);
                paramBundle.writeToParcel(localParcel, 0);
                IBinder localIBinder = null;
                if (paramzzwg != null)
                  localIBinder = paramzzwg.asBinder();
                localParcel.writeStrongBinder(localIBinder);
                this.zzle.transact(2, localParcel, null, 1);
              }
            }
            else
            {
              localParcel.writeInt(0);
              continue;
            }
          }
          finally
          {
            localParcel.recycle();
          }
          localParcel.writeInt(0);
        }
      }

      public void zza(MaskedWalletRequest paramMaskedWalletRequest, Bundle paramBundle, zzwf paramzzwf)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel.writeInterfaceToken("com.google.android.gms.wallet.internal.IOwService");
            if (paramMaskedWalletRequest != null)
            {
              localParcel.writeInt(1);
              paramMaskedWalletRequest.writeToParcel(localParcel, 0);
              if (paramBundle != null)
              {
                localParcel.writeInt(1);
                paramBundle.writeToParcel(localParcel, 0);
                IBinder localIBinder = null;
                if (paramzzwf != null)
                  localIBinder = paramzzwf.asBinder();
                localParcel.writeStrongBinder(localIBinder);
                this.zzle.transact(7, localParcel, null, 1);
              }
            }
            else
            {
              localParcel.writeInt(0);
              continue;
            }
          }
          finally
          {
            localParcel.recycle();
          }
          localParcel.writeInt(0);
        }
      }

      public void zza(MaskedWalletRequest paramMaskedWalletRequest, Bundle paramBundle, zzwg paramzzwg)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel.writeInterfaceToken("com.google.android.gms.wallet.internal.IOwService");
            if (paramMaskedWalletRequest != null)
            {
              localParcel.writeInt(1);
              paramMaskedWalletRequest.writeToParcel(localParcel, 0);
              if (paramBundle != null)
              {
                localParcel.writeInt(1);
                paramBundle.writeToParcel(localParcel, 0);
                IBinder localIBinder = null;
                if (paramzzwg != null)
                  localIBinder = paramzzwg.asBinder();
                localParcel.writeStrongBinder(localIBinder);
                this.zzle.transact(1, localParcel, null, 1);
              }
            }
            else
            {
              localParcel.writeInt(0);
              continue;
            }
          }
          finally
          {
            localParcel.recycle();
          }
          localParcel.writeInt(0);
        }
      }

      public void zza(NotifyTransactionStatusRequest paramNotifyTransactionStatusRequest, Bundle paramBundle)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel.writeInterfaceToken("com.google.android.gms.wallet.internal.IOwService");
            if (paramNotifyTransactionStatusRequest != null)
            {
              localParcel.writeInt(1);
              paramNotifyTransactionStatusRequest.writeToParcel(localParcel, 0);
              if (paramBundle != null)
              {
                localParcel.writeInt(1);
                paramBundle.writeToParcel(localParcel, 0);
                this.zzle.transact(4, localParcel, null, 1);
              }
            }
            else
            {
              localParcel.writeInt(0);
              continue;
            }
          }
          finally
          {
            localParcel.recycle();
          }
          localParcel.writeInt(0);
        }
      }

      public void zza(zzd paramzzd, Bundle paramBundle, zzwg paramzzwg)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel.writeInterfaceToken("com.google.android.gms.wallet.internal.IOwService");
            if (paramzzd != null)
            {
              localParcel.writeInt(1);
              paramzzd.writeToParcel(localParcel, 0);
              if (paramBundle != null)
              {
                localParcel.writeInt(1);
                paramBundle.writeToParcel(localParcel, 0);
                IBinder localIBinder = null;
                if (paramzzwg != null)
                  localIBinder = paramzzwg.asBinder();
                localParcel.writeStrongBinder(localIBinder);
                this.zzle.transact(6, localParcel, null, 1);
              }
            }
            else
            {
              localParcel.writeInt(0);
              continue;
            }
          }
          finally
          {
            localParcel.recycle();
          }
          localParcel.writeInt(0);
        }
      }

      public void zza(String paramString1, String paramString2, Bundle paramBundle, zzwg paramzzwg)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.wallet.internal.IOwService");
          localParcel.writeString(paramString1);
          localParcel.writeString(paramString2);
          if (paramBundle != null)
          {
            localParcel.writeInt(1);
            paramBundle.writeToParcel(localParcel, 0);
          }
          while (true)
          {
            IBinder localIBinder = null;
            if (paramzzwg != null)
              localIBinder = paramzzwg.asBinder();
            localParcel.writeStrongBinder(localIBinder);
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

      public void zzb(Bundle paramBundle, zzwg paramzzwg)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.wallet.internal.IOwService");
          if (paramBundle != null)
          {
            localParcel.writeInt(1);
            paramBundle.writeToParcel(localParcel, 0);
          }
          while (true)
          {
            IBinder localIBinder = null;
            if (paramzzwg != null)
              localIBinder = paramzzwg.asBinder();
            localParcel.writeStrongBinder(localIBinder);
            this.zzle.transact(11, localParcel, null, 1);
            return;
            localParcel.writeInt(0);
          }
        }
        finally
        {
          localParcel.recycle();
        }
      }

      public void zzv(Bundle paramBundle)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.wallet.internal.IOwService");
          if (paramBundle != null)
          {
            localParcel.writeInt(1);
            paramBundle.writeToParcel(localParcel, 0);
          }
          while (true)
          {
            this.zzle.transact(9, localParcel, null, 1);
            return;
            localParcel.writeInt(0);
          }
        }
        finally
        {
          localParcel.recycle();
        }
      }

      public void zzw(Bundle paramBundle)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.wallet.internal.IOwService");
          if (paramBundle != null)
          {
            localParcel.writeInt(1);
            paramBundle.writeToParcel(localParcel, 0);
          }
          while (true)
          {
            this.zzle.transact(10, localParcel, null, 1);
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