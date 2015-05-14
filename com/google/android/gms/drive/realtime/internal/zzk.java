package com.google.android.gms.drive.realtime.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import android.os.RemoteException;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.StatusCreator;

public abstract interface zzk extends IInterface
{
  public abstract void zza(ParcelableIndexReference paramParcelableIndexReference)
    throws RemoteException;

  public abstract void zzm(Status paramStatus)
    throws RemoteException;

  public static abstract class zza extends Binder
    implements zzk
  {
    public static zzk zzao(IBinder paramIBinder)
    {
      if (paramIBinder == null)
        return null;
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.drive.realtime.internal.IIndexReferenceCallback");
      if ((localIInterface != null) && ((localIInterface instanceof zzk)))
        return (zzk)localIInterface;
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
        paramParcel2.writeString("com.google.android.gms.drive.realtime.internal.IIndexReferenceCallback");
        return true;
      case 1:
        paramParcel1.enforceInterface("com.google.android.gms.drive.realtime.internal.IIndexReferenceCallback");
        int j = paramParcel1.readInt();
        ParcelableIndexReference localParcelableIndexReference = null;
        if (j != 0)
          localParcelableIndexReference = (ParcelableIndexReference)ParcelableIndexReference.CREATOR.createFromParcel(paramParcel1);
        zza(localParcelableIndexReference);
        paramParcel2.writeNoException();
        return true;
      case 2:
      }
      paramParcel1.enforceInterface("com.google.android.gms.drive.realtime.internal.IIndexReferenceCallback");
      int i = paramParcel1.readInt();
      Status localStatus = null;
      if (i != 0)
        localStatus = Status.CREATOR.createFromParcel(paramParcel1);
      zzm(localStatus);
      paramParcel2.writeNoException();
      return true;
    }

    private static class zza
      implements zzk
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

      public void zza(ParcelableIndexReference paramParcelableIndexReference)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.drive.realtime.internal.IIndexReferenceCallback");
          if (paramParcelableIndexReference != null)
          {
            localParcel1.writeInt(1);
            paramParcelableIndexReference.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(1, localParcel1, localParcel2, 0);
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

      public void zzm(Status paramStatus)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.drive.realtime.internal.IIndexReferenceCallback");
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