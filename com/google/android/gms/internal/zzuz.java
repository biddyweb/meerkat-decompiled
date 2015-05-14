package com.google.android.gms.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import android.os.RemoteException;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.ConnectionResultCreator;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.StatusCreator;

public abstract interface zzuz extends IInterface
{
  public abstract void zza(ConnectionResult paramConnectionResult, zzut paramzzut)
    throws RemoteException;

  public abstract void zzaM(Status paramStatus)
    throws RemoteException;

  public static abstract class zza extends Binder
    implements zzuz
  {
    public zza()
    {
      attachInterface(this, "com.google.android.gms.signin.internal.ISignInCallbacks");
    }

    public static zzuz zzcE(IBinder paramIBinder)
    {
      if (paramIBinder == null)
        return null;
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.signin.internal.ISignInCallbacks");
      if ((localIInterface != null) && ((localIInterface instanceof zzuz)))
        return (zzuz)localIInterface;
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
        paramParcel2.writeString("com.google.android.gms.signin.internal.ISignInCallbacks");
        return true;
      case 3:
        paramParcel1.enforceInterface("com.google.android.gms.signin.internal.ISignInCallbacks");
        ConnectionResult localConnectionResult;
        if (paramParcel1.readInt() != 0)
        {
          localConnectionResult = ConnectionResult.CREATOR.createFromParcel(paramParcel1);
          if (paramParcel1.readInt() == 0)
            break label117;
        }
        label117: for (zzut localzzut = (zzut)zzut.CREATOR.createFromParcel(paramParcel1); ; localzzut = null)
        {
          zza(localConnectionResult, localzzut);
          paramParcel2.writeNoException();
          return true;
          localConnectionResult = null;
          break;
        }
      case 4:
      }
      paramParcel1.enforceInterface("com.google.android.gms.signin.internal.ISignInCallbacks");
      int i = paramParcel1.readInt();
      Status localStatus = null;
      if (i != 0)
        localStatus = Status.CREATOR.createFromParcel(paramParcel1);
      zzaM(localStatus);
      paramParcel2.writeNoException();
      return true;
    }

    private static class zza
      implements zzuz
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

      public void zza(ConnectionResult paramConnectionResult, zzut paramzzut)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.signin.internal.ISignInCallbacks");
            if (paramConnectionResult != null)
            {
              localParcel1.writeInt(1);
              paramConnectionResult.writeToParcel(localParcel1, 0);
              if (paramzzut != null)
              {
                localParcel1.writeInt(1);
                paramzzut.writeToParcel(localParcel1, 0);
                this.zzle.transact(3, localParcel1, localParcel2, 0);
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

      public void zzaM(Status paramStatus)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.signin.internal.ISignInCallbacks");
          if (paramStatus != null)
          {
            localParcel1.writeInt(1);
            paramStatus.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(4, localParcel1, localParcel2, 0);
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