package com.google.android.gms.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.dynamic.zzd;
import com.google.android.gms.dynamic.zzd.zza;

public abstract interface zzbn extends IInterface
{
  public abstract IBinder zza(zzd paramzzd, int paramInt)
    throws RemoteException;

  public static abstract class zza extends Binder
    implements zzbn
  {
    public static zzbn zzk(IBinder paramIBinder)
    {
      if (paramIBinder == null)
        return null;
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.ads.internal.client.IMobileAdsSettingManagerCreator");
      if ((localIInterface != null) && ((localIInterface instanceof zzbn)))
        return (zzbn)localIInterface;
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
        paramParcel2.writeString("com.google.android.gms.ads.internal.client.IMobileAdsSettingManagerCreator");
        return true;
      case 1:
      }
      paramParcel1.enforceInterface("com.google.android.gms.ads.internal.client.IMobileAdsSettingManagerCreator");
      IBinder localIBinder = zza(zzd.zza.zzau(paramParcel1.readStrongBinder()), paramParcel1.readInt());
      paramParcel2.writeNoException();
      paramParcel2.writeStrongBinder(localIBinder);
      return true;
    }

    private static class zza
      implements zzbn
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

      public IBinder zza(zzd paramzzd, int paramInt)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.ads.internal.client.IMobileAdsSettingManagerCreator");
          if (paramzzd != null);
          for (IBinder localIBinder1 = paramzzd.asBinder(); ; localIBinder1 = null)
          {
            localParcel1.writeStrongBinder(localIBinder1);
            localParcel1.writeInt(paramInt);
            this.zzle.transact(1, localParcel1, localParcel2, 0);
            localParcel2.readException();
            IBinder localIBinder2 = localParcel2.readStrongBinder();
            return localIBinder2;
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