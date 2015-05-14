package com.google.android.gms.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import android.os.RemoteException;
import com.google.android.gms.dynamic.zzc;
import com.google.android.gms.dynamic.zzc.zza;
import com.google.android.gms.dynamic.zzd;
import com.google.android.gms.dynamic.zzd.zza;
import com.google.android.gms.wallet.fragment.WalletFragmentOptions;

public abstract interface zzwe extends IInterface
{
  public abstract zzwb zza(zzd paramzzd, zzc paramzzc, WalletFragmentOptions paramWalletFragmentOptions, zzwc paramzzwc)
    throws RemoteException;

  public static abstract class zza extends Binder
    implements zzwe
  {
    public static zzwe zzcK(IBinder paramIBinder)
    {
      if (paramIBinder == null)
        return null;
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.wallet.internal.IWalletDynamiteCreator");
      if ((localIInterface != null) && ((localIInterface instanceof zzwe)))
        return (zzwe)localIInterface;
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
        paramParcel2.writeString("com.google.android.gms.wallet.internal.IWalletDynamiteCreator");
        return true;
      case 1:
      }
      paramParcel1.enforceInterface("com.google.android.gms.wallet.internal.IWalletDynamiteCreator");
      zzd localzzd = zzd.zza.zzau(paramParcel1.readStrongBinder());
      zzc localzzc = zzc.zza.zzat(paramParcel1.readStrongBinder());
      if (paramParcel1.readInt() != 0);
      for (WalletFragmentOptions localWalletFragmentOptions = (WalletFragmentOptions)WalletFragmentOptions.CREATOR.createFromParcel(paramParcel1); ; localWalletFragmentOptions = null)
      {
        zzwb localzzwb = zza(localzzd, localzzc, localWalletFragmentOptions, zzwc.zza.zzcI(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        IBinder localIBinder = null;
        if (localzzwb != null)
          localIBinder = localzzwb.asBinder();
        paramParcel2.writeStrongBinder(localIBinder);
        return true;
      }
    }

    private static class zza
      implements zzwe
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

      public zzwb zza(zzd paramzzd, zzc paramzzc, WalletFragmentOptions paramWalletFragmentOptions, zzwc paramzzwc)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.wallet.internal.IWalletDynamiteCreator");
          IBinder localIBinder1;
          IBinder localIBinder2;
          if (paramzzd != null)
          {
            localIBinder1 = paramzzd.asBinder();
            localParcel1.writeStrongBinder(localIBinder1);
            if (paramzzc == null)
              break label146;
            localIBinder2 = paramzzc.asBinder();
            label48: localParcel1.writeStrongBinder(localIBinder2);
            if (paramWalletFragmentOptions == null)
              break label152;
            localParcel1.writeInt(1);
            paramWalletFragmentOptions.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            IBinder localIBinder3 = null;
            if (paramzzwc != null)
              localIBinder3 = paramzzwc.asBinder();
            localParcel1.writeStrongBinder(localIBinder3);
            this.zzle.transact(1, localParcel1, localParcel2, 0);
            localParcel2.readException();
            zzwb localzzwb = zzwb.zza.zzcH(localParcel2.readStrongBinder());
            return localzzwb;
            localIBinder1 = null;
            break;
            label146: localIBinder2 = null;
            break label48;
            label152: localParcel1.writeInt(0);
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