package com.google.android.gms.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;

public abstract interface zzje extends IInterface
{
  public abstract void zza(zziv.zza paramzza, zzjf paramzzjf)
    throws RemoteException;

  public abstract void zza(zzjf paramzzjf)
    throws RemoteException;

  public abstract void zza(zzjf paramzzjf, String paramString1, String paramString2)
    throws RemoteException;

  public abstract void zza(zzjf paramzzjf, String paramString, zzjb[] paramArrayOfzzjb)
    throws RemoteException;

  public abstract void zza(zzjf paramzzjf, boolean paramBoolean)
    throws RemoteException;

  public abstract void zzb(zzjf paramzzjf)
    throws RemoteException;

  public static abstract class zza extends Binder
    implements zzje
  {
    public static zzje zzI(IBinder paramIBinder)
    {
      if (paramIBinder == null)
        return null;
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.appdatasearch.internal.ILightweightAppDataSearch");
      if ((localIInterface != null) && ((localIInterface instanceof zzje)))
        return (zzje)localIInterface;
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
        paramParcel2.writeString("com.google.android.gms.appdatasearch.internal.ILightweightAppDataSearch");
        return true;
      case 1:
        paramParcel1.enforceInterface("com.google.android.gms.appdatasearch.internal.ILightweightAppDataSearch");
        zza(zzjf.zza.zzJ(paramParcel1.readStrongBinder()), paramParcel1.readString(), (zzjb[])paramParcel1.createTypedArray(zzjb.CREATOR));
        paramParcel2.writeNoException();
        return true;
      case 2:
        paramParcel1.enforceInterface("com.google.android.gms.appdatasearch.internal.ILightweightAppDataSearch");
        zza(zzjf.zza.zzJ(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 3:
        paramParcel1.enforceInterface("com.google.android.gms.appdatasearch.internal.ILightweightAppDataSearch");
        zzb(zzjf.zza.zzJ(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 4:
        paramParcel1.enforceInterface("com.google.android.gms.appdatasearch.internal.ILightweightAppDataSearch");
        zzjf localzzjf = zzjf.zza.zzJ(paramParcel1.readStrongBinder());
        if (paramParcel1.readInt() != 0);
        for (boolean bool = true; ; bool = false)
        {
          zza(localzzjf, bool);
          paramParcel2.writeNoException();
          return true;
        }
      case 5:
        paramParcel1.enforceInterface("com.google.android.gms.appdatasearch.internal.ILightweightAppDataSearch");
        if (paramParcel1.readInt() != 0);
        for (zziv.zza localzza = zziv.zza.CREATOR.zzp(paramParcel1); ; localzza = null)
        {
          zza(localzza, zzjf.zza.zzJ(paramParcel1.readStrongBinder()));
          paramParcel2.writeNoException();
          return true;
        }
      case 6:
      }
      paramParcel1.enforceInterface("com.google.android.gms.appdatasearch.internal.ILightweightAppDataSearch");
      zza(zzjf.zza.zzJ(paramParcel1.readStrongBinder()), paramParcel1.readString(), paramParcel1.readString());
      paramParcel2.writeNoException();
      return true;
    }

    private static class zza
      implements zzje
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

      public void zza(zziv.zza paramzza, zzjf paramzzjf)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.appdatasearch.internal.ILightweightAppDataSearch");
            if (paramzza != null)
            {
              localParcel1.writeInt(1);
              paramzza.writeToParcel(localParcel1, 0);
              if (paramzzjf != null)
              {
                localIBinder = paramzzjf.asBinder();
                localParcel1.writeStrongBinder(localIBinder);
                this.zzle.transact(5, localParcel1, localParcel2, 0);
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
          IBinder localIBinder = null;
        }
      }

      public void zza(zzjf paramzzjf)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.appdatasearch.internal.ILightweightAppDataSearch");
          if (paramzzjf != null);
          for (IBinder localIBinder = paramzzjf.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.zzle.transact(2, localParcel1, localParcel2, 0);
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

      public void zza(zzjf paramzzjf, String paramString1, String paramString2)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.appdatasearch.internal.ILightweightAppDataSearch");
          if (paramzzjf != null);
          for (IBinder localIBinder = paramzzjf.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString1);
            localParcel1.writeString(paramString2);
            this.zzle.transact(6, localParcel1, localParcel2, 0);
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

      public void zza(zzjf paramzzjf, String paramString, zzjb[] paramArrayOfzzjb)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.appdatasearch.internal.ILightweightAppDataSearch");
          if (paramzzjf != null);
          for (IBinder localIBinder = paramzzjf.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            localParcel1.writeTypedArray(paramArrayOfzzjb, 0);
            this.zzle.transact(1, localParcel1, localParcel2, 0);
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

      public void zza(zzjf paramzzjf, boolean paramBoolean)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.appdatasearch.internal.ILightweightAppDataSearch");
          if (paramzzjf != null);
          for (IBinder localIBinder = paramzzjf.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            int i = 0;
            if (paramBoolean)
              i = 1;
            localParcel1.writeInt(i);
            this.zzle.transact(4, localParcel1, localParcel2, 0);
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

      public void zzb(zzjf paramzzjf)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.appdatasearch.internal.ILightweightAppDataSearch");
          if (paramzzjf != null);
          for (IBinder localIBinder = paramzzjf.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.zzle.transact(3, localParcel1, localParcel2, 0);
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
    }
  }
}