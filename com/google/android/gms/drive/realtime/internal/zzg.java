package com.google.android.gms.drive.realtime.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import android.os.RemoteException;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.StatusCreator;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.common.data.zzf;
import com.google.android.gms.drive.realtime.internal.event.ParcelableEventList;

public abstract interface zzg extends IInterface
{
  public abstract void zza(DataHolder paramDataHolder, ParcelableEventList paramParcelableEventList)
    throws RemoteException;

  public abstract void zzm(Status paramStatus)
    throws RemoteException;

  public static abstract class zza extends Binder
    implements zzg
  {
    public static zzg zzak(IBinder paramIBinder)
    {
      if (paramIBinder == null)
        return null;
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.drive.realtime.internal.IDataHolderEventCallback");
      if ((localIInterface != null) && ((localIInterface instanceof zzg)))
        return (zzg)localIInterface;
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
        paramParcel2.writeString("com.google.android.gms.drive.realtime.internal.IDataHolderEventCallback");
        return true;
      case 1:
        paramParcel1.enforceInterface("com.google.android.gms.drive.realtime.internal.IDataHolderEventCallback");
        DataHolder localDataHolder;
        if (paramParcel1.readInt() != 0)
        {
          localDataHolder = DataHolder.CREATOR.zzA(paramParcel1);
          if (paramParcel1.readInt() == 0)
            break label117;
        }
        label117: for (ParcelableEventList localParcelableEventList = (ParcelableEventList)ParcelableEventList.CREATOR.createFromParcel(paramParcel1); ; localParcelableEventList = null)
        {
          zza(localDataHolder, localParcelableEventList);
          paramParcel2.writeNoException();
          return true;
          localDataHolder = null;
          break;
        }
      case 2:
      }
      paramParcel1.enforceInterface("com.google.android.gms.drive.realtime.internal.IDataHolderEventCallback");
      int i = paramParcel1.readInt();
      Status localStatus = null;
      if (i != 0)
        localStatus = Status.CREATOR.createFromParcel(paramParcel1);
      zzm(localStatus);
      paramParcel2.writeNoException();
      return true;
    }

    private static class zza
      implements zzg
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

      public void zza(DataHolder paramDataHolder, ParcelableEventList paramParcelableEventList)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.drive.realtime.internal.IDataHolderEventCallback");
            if (paramDataHolder != null)
            {
              localParcel1.writeInt(1);
              paramDataHolder.writeToParcel(localParcel1, 0);
              if (paramParcelableEventList != null)
              {
                localParcel1.writeInt(1);
                paramParcelableEventList.writeToParcel(localParcel1, 0);
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

      public void zzm(Status paramStatus)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.drive.realtime.internal.IDataHolderEventCallback");
          if (paramStatus != null)
          {
            localParcel1.writeInt(1);
            paramStatus.writeToParcel(localParcel1, 0);
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
    }
  }
}