package com.google.android.gms.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.dynamic.zzd;
import com.google.android.gms.dynamic.zzd.zza;

public abstract interface zzbj extends IInterface
{
  public abstract IBinder zza(zzd paramzzd, zzba paramzzba, String paramString, zzdr paramzzdr, int paramInt)
    throws RemoteException;

  public static abstract class zza extends Binder
    implements zzbj
  {
    public static zzbj zzh(IBinder paramIBinder)
    {
      if (paramIBinder == null)
        return null;
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.ads.internal.client.IAdManagerCreator");
      if ((localIInterface != null) && ((localIInterface instanceof zzbj)))
        return (zzbj)localIInterface;
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
        paramParcel2.writeString("com.google.android.gms.ads.internal.client.IAdManagerCreator");
        return true;
      case 1:
      }
      paramParcel1.enforceInterface("com.google.android.gms.ads.internal.client.IAdManagerCreator");
      zzd localzzd = zzd.zza.zzau(paramParcel1.readStrongBinder());
      if (paramParcel1.readInt() != 0);
      for (zzba localzzba = zzba.CREATOR.zzc(paramParcel1); ; localzzba = null)
      {
        IBinder localIBinder = zza(localzzd, localzzba, paramParcel1.readString(), zzdr.zza.zzr(paramParcel1.readStrongBinder()), paramParcel1.readInt());
        paramParcel2.writeNoException();
        paramParcel2.writeStrongBinder(localIBinder);
        return true;
      }
    }

    private static class zza
      implements zzbj
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

      public IBinder zza(zzd paramzzd, zzba paramzzba, String paramString, zzdr paramzzdr, int paramInt)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.ads.internal.client.IAdManagerCreator");
          IBinder localIBinder1;
          if (paramzzd != null)
          {
            localIBinder1 = paramzzd.asBinder();
            localParcel1.writeStrongBinder(localIBinder1);
            if (paramzzba == null)
              break label137;
            localParcel1.writeInt(1);
            paramzzba.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            localParcel1.writeString(paramString);
            IBinder localIBinder2 = null;
            if (paramzzdr != null)
              localIBinder2 = paramzzdr.asBinder();
            localParcel1.writeStrongBinder(localIBinder2);
            localParcel1.writeInt(paramInt);
            this.zzle.transact(1, localParcel1, localParcel2, 0);
            localParcel2.readException();
            IBinder localIBinder3 = localParcel2.readStrongBinder();
            return localIBinder3;
            localIBinder1 = null;
            break;
            label137: localParcel1.writeInt(0);
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