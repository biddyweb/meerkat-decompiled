package com.google.android.gms.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import android.os.RemoteException;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.StatusCreator;
import com.google.android.gms.safetynet.zza;

public abstract interface zzuk extends IInterface
{
  public abstract void zza(Status paramStatus, zza paramzza)
    throws RemoteException;

  public abstract void zzcG(String paramString)
    throws RemoteException;

  public static abstract class zza extends Binder
    implements zzuk
  {
    public zza()
    {
      attachInterface(this, "com.google.android.gms.safetynet.internal.ISafetyNetCallbacks");
    }

    public static zzuk zzcB(IBinder paramIBinder)
    {
      if (paramIBinder == null)
        return null;
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.safetynet.internal.ISafetyNetCallbacks");
      if ((localIInterface != null) && ((localIInterface instanceof zzuk)))
        return (zzuk)localIInterface;
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
        paramParcel2.writeString("com.google.android.gms.safetynet.internal.ISafetyNetCallbacks");
        return true;
      case 1:
        paramParcel1.enforceInterface("com.google.android.gms.safetynet.internal.ISafetyNetCallbacks");
        Status localStatus;
        if (paramParcel1.readInt() != 0)
        {
          localStatus = Status.CREATOR.createFromParcel(paramParcel1);
          if (paramParcel1.readInt() == 0)
            break label113;
        }
        label113: for (zza localzza = (zza)zza.CREATOR.createFromParcel(paramParcel1); ; localzza = null)
        {
          zza(localStatus, localzza);
          return true;
          localStatus = null;
          break;
        }
      case 2:
      }
      paramParcel1.enforceInterface("com.google.android.gms.safetynet.internal.ISafetyNetCallbacks");
      zzcG(paramParcel1.readString());
      return true;
    }

    private static class zza
      implements zzuk
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

      public void zza(Status paramStatus, zza paramzza)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel.writeInterfaceToken("com.google.android.gms.safetynet.internal.ISafetyNetCallbacks");
            if (paramStatus != null)
            {
              localParcel.writeInt(1);
              paramStatus.writeToParcel(localParcel, 0);
              if (paramzza != null)
              {
                localParcel.writeInt(1);
                paramzza.writeToParcel(localParcel, 0);
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

      public void zzcG(String paramString)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.safetynet.internal.ISafetyNetCallbacks");
          localParcel.writeString(paramString);
          this.zzle.transact(2, localParcel, null, 1);
          return;
        }
        finally
        {
          localParcel.recycle();
        }
      }
    }
  }
}