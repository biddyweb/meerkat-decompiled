package com.google.android.gms.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;

public abstract interface zzgs extends IInterface
{
  public abstract zzgq zzd(zzgo paramzzgo)
    throws RemoteException;

  public static abstract class zza extends Binder
    implements zzgs
  {
    public zza()
    {
      attachInterface(this, "com.google.android.gms.ads.internal.request.IAdRequestService");
    }

    public static zzgs zzG(IBinder paramIBinder)
    {
      if (paramIBinder == null)
        return null;
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.ads.internal.request.IAdRequestService");
      if ((localIInterface != null) && ((localIInterface instanceof zzgs)))
        return (zzgs)localIInterface;
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
        paramParcel2.writeString("com.google.android.gms.ads.internal.request.IAdRequestService");
        return true;
      case 1:
      }
      paramParcel1.enforceInterface("com.google.android.gms.ads.internal.request.IAdRequestService");
      zzgo localzzgo;
      if (paramParcel1.readInt() != 0)
      {
        localzzgo = zzgo.CREATOR.zzh(paramParcel1);
        zzgq localzzgq = zzd(localzzgo);
        paramParcel2.writeNoException();
        if (localzzgq == null)
          break label105;
        paramParcel2.writeInt(1);
        localzzgq.writeToParcel(paramParcel2, 1);
      }
      while (true)
      {
        return true;
        localzzgo = null;
        break;
        label105: paramParcel2.writeInt(0);
      }
    }

    private static class zza
      implements zzgs
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

      public zzgq zzd(zzgo paramzzgo)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.ads.internal.request.IAdRequestService");
            if (paramzzgo != null)
            {
              localParcel1.writeInt(1);
              paramzzgo.writeToParcel(localParcel1, 0);
              this.zzle.transact(1, localParcel1, localParcel2, 0);
              localParcel2.readException();
              if (localParcel2.readInt() != 0)
              {
                zzgq localzzgq2 = zzgq.CREATOR.zzi(localParcel2);
                localzzgq1 = localzzgq2;
                return localzzgq1;
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
          zzgq localzzgq1 = null;
        }
      }
    }
  }
}