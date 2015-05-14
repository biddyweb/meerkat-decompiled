package com.google.android.gms.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;

public abstract interface zzjn extends IInterface
{
  public abstract void zza(zzjm paramzzjm)
    throws RemoteException;

  public abstract void zza(zzjm paramzzjm, int paramInt)
    throws RemoteException;

  public abstract void zza(zzjm paramzzjm, int paramInt, String paramString, byte[] paramArrayOfByte)
    throws RemoteException;

  public abstract void zza(zzjm paramzzjm, int paramInt, byte[] paramArrayOfByte)
    throws RemoteException;

  public abstract void zzb(zzjm paramzzjm)
    throws RemoteException;

  public abstract void zzb(zzjm paramzzjm, int paramInt)
    throws RemoteException;

  public abstract void zzc(zzjm paramzzjm)
    throws RemoteException;

  public abstract int zzhd()
    throws RemoteException;

  public abstract int zzhe()
    throws RemoteException;

  public static abstract class zza extends Binder
    implements zzjn
  {
    public static zzjn zzN(IBinder paramIBinder)
    {
      if (paramIBinder == null)
        return null;
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.appstate.internal.IAppStateService");
      if ((localIInterface != null) && ((localIInterface instanceof zzjn)))
        return (zzjn)localIInterface;
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
        paramParcel2.writeString("com.google.android.gms.appstate.internal.IAppStateService");
        return true;
      case 5001:
        paramParcel1.enforceInterface("com.google.android.gms.appstate.internal.IAppStateService");
        int j = zzhd();
        paramParcel2.writeNoException();
        paramParcel2.writeInt(j);
        return true;
      case 5002:
        paramParcel1.enforceInterface("com.google.android.gms.appstate.internal.IAppStateService");
        int i = zzhe();
        paramParcel2.writeNoException();
        paramParcel2.writeInt(i);
        return true;
      case 5003:
        paramParcel1.enforceInterface("com.google.android.gms.appstate.internal.IAppStateService");
        zza(zzjm.zza.zzM(paramParcel1.readStrongBinder()), paramParcel1.readInt(), paramParcel1.createByteArray());
        paramParcel2.writeNoException();
        return true;
      case 5004:
        paramParcel1.enforceInterface("com.google.android.gms.appstate.internal.IAppStateService");
        zza(zzjm.zza.zzM(paramParcel1.readStrongBinder()), paramParcel1.readInt());
        paramParcel2.writeNoException();
        return true;
      case 5005:
        paramParcel1.enforceInterface("com.google.android.gms.appstate.internal.IAppStateService");
        zza(zzjm.zza.zzM(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 5006:
        paramParcel1.enforceInterface("com.google.android.gms.appstate.internal.IAppStateService");
        zza(zzjm.zza.zzM(paramParcel1.readStrongBinder()), paramParcel1.readInt(), paramParcel1.readString(), paramParcel1.createByteArray());
        paramParcel2.writeNoException();
        return true;
      case 5007:
        paramParcel1.enforceInterface("com.google.android.gms.appstate.internal.IAppStateService");
        zzb(zzjm.zza.zzM(paramParcel1.readStrongBinder()), paramParcel1.readInt());
        paramParcel2.writeNoException();
        return true;
      case 5008:
        paramParcel1.enforceInterface("com.google.android.gms.appstate.internal.IAppStateService");
        zzb(zzjm.zza.zzM(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 5009:
      }
      paramParcel1.enforceInterface("com.google.android.gms.appstate.internal.IAppStateService");
      zzc(zzjm.zza.zzM(paramParcel1.readStrongBinder()));
      paramParcel2.writeNoException();
      return true;
    }

    private static class zza
      implements zzjn
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

      public void zza(zzjm paramzzjm)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.appstate.internal.IAppStateService");
          if (paramzzjm != null);
          for (IBinder localIBinder = paramzzjm.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.zzle.transact(5005, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zza(zzjm paramzzjm, int paramInt)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.appstate.internal.IAppStateService");
          if (paramzzjm != null);
          for (IBinder localIBinder = paramzzjm.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeInt(paramInt);
            this.zzle.transact(5004, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zza(zzjm paramzzjm, int paramInt, String paramString, byte[] paramArrayOfByte)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.appstate.internal.IAppStateService");
          if (paramzzjm != null);
          for (IBinder localIBinder = paramzzjm.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeInt(paramInt);
            localParcel1.writeString(paramString);
            localParcel1.writeByteArray(paramArrayOfByte);
            this.zzle.transact(5006, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zza(zzjm paramzzjm, int paramInt, byte[] paramArrayOfByte)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.appstate.internal.IAppStateService");
          if (paramzzjm != null);
          for (IBinder localIBinder = paramzzjm.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeInt(paramInt);
            localParcel1.writeByteArray(paramArrayOfByte);
            this.zzle.transact(5003, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzb(zzjm paramzzjm)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.appstate.internal.IAppStateService");
          if (paramzzjm != null);
          for (IBinder localIBinder = paramzzjm.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.zzle.transact(5008, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzb(zzjm paramzzjm, int paramInt)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.appstate.internal.IAppStateService");
          if (paramzzjm != null);
          for (IBinder localIBinder = paramzzjm.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeInt(paramInt);
            this.zzle.transact(5007, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzc(zzjm paramzzjm)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.appstate.internal.IAppStateService");
          if (paramzzjm != null);
          for (IBinder localIBinder = paramzzjm.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.zzle.transact(5009, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public int zzhd()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.appstate.internal.IAppStateService");
          this.zzle.transact(5001, localParcel1, localParcel2, 0);
          localParcel2.readException();
          int i = localParcel2.readInt();
          return i;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public int zzhe()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.appstate.internal.IAppStateService");
          this.zzle.transact(5002, localParcel1, localParcel2, 0);
          localParcel2.readException();
          int i = localParcel2.readInt();
          return i;
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