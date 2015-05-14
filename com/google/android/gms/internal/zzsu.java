package com.google.android.gms.internal;

import android.content.Intent;
import android.os.Binder;
import android.os.Bundle;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import android.os.RemoteException;

public abstract interface zzsu extends IInterface
{
  public abstract void zza(int paramInt1, Bundle paramBundle, int paramInt2, Intent paramIntent)
    throws RemoteException;

  public static abstract class zza extends Binder
    implements zzsu
  {
    public zza()
    {
      attachInterface(this, "com.google.android.gms.panorama.internal.IPanoramaCallbacks");
    }

    public static zzsu zzcr(IBinder paramIBinder)
    {
      if (paramIBinder == null)
        return null;
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.panorama.internal.IPanoramaCallbacks");
      if ((localIInterface != null) && ((localIInterface instanceof zzsu)))
        return (zzsu)localIInterface;
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
        paramParcel2.writeString("com.google.android.gms.panorama.internal.IPanoramaCallbacks");
        return true;
      case 1:
      }
      paramParcel1.enforceInterface("com.google.android.gms.panorama.internal.IPanoramaCallbacks");
      int i = paramParcel1.readInt();
      Bundle localBundle;
      int j;
      if (paramParcel1.readInt() != 0)
      {
        localBundle = (Bundle)Bundle.CREATOR.createFromParcel(paramParcel1);
        j = paramParcel1.readInt();
        if (paramParcel1.readInt() == 0)
          break label130;
      }
      label130: for (Intent localIntent = (Intent)Intent.CREATOR.createFromParcel(paramParcel1); ; localIntent = null)
      {
        zza(i, localBundle, j, localIntent);
        paramParcel2.writeNoException();
        return true;
        localBundle = null;
        break;
      }
    }

    private static class zza
      implements zzsu
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

      public void zza(int paramInt1, Bundle paramBundle, int paramInt2, Intent paramIntent)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.panorama.internal.IPanoramaCallbacks");
            localParcel1.writeInt(paramInt1);
            if (paramBundle != null)
            {
              localParcel1.writeInt(1);
              paramBundle.writeToParcel(localParcel1, 0);
              localParcel1.writeInt(paramInt2);
              if (paramIntent != null)
              {
                localParcel1.writeInt(1);
                paramIntent.writeToParcel(localParcel1, 0);
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
    }
  }
}