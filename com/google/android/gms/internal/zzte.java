package com.google.android.gms.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import java.util.List;

public abstract interface zzte extends IInterface
{
  public abstract void zza(String paramString, zztj paramzztj, zztf paramzztf)
    throws RemoteException;

  public abstract void zza(String paramString, zztj paramzztj, List<zztf> paramList)
    throws RemoteException;

  public abstract void zza(String paramString, zztj paramzztj, byte[] paramArrayOfByte)
    throws RemoteException;

  public static abstract class zza extends Binder
    implements zzte
  {
    public static zzte zzcu(IBinder paramIBinder)
    {
      if (paramIBinder == null)
        return null;
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.playlog.internal.IPlayLogService");
      if ((localIInterface != null) && ((localIInterface instanceof zzte)))
        return (zzte)localIInterface;
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
        paramParcel2.writeString("com.google.android.gms.playlog.internal.IPlayLogService");
        return true;
      case 2:
        paramParcel1.enforceInterface("com.google.android.gms.playlog.internal.IPlayLogService");
        String str3 = paramParcel1.readString();
        if (paramParcel1.readInt() != 0);
        for (zztj localzztj3 = zztj.CREATOR.zzew(paramParcel1); ; localzztj3 = null)
        {
          int k = paramParcel1.readInt();
          zztf localzztf = null;
          if (k != 0)
            localzztf = zztf.CREATOR.zzev(paramParcel1);
          zza(str3, localzztj3, localzztf);
          return true;
        }
      case 3:
        paramParcel1.enforceInterface("com.google.android.gms.playlog.internal.IPlayLogService");
        String str2 = paramParcel1.readString();
        int j = paramParcel1.readInt();
        zztj localzztj2 = null;
        if (j != 0)
          localzztj2 = zztj.CREATOR.zzew(paramParcel1);
        zza(str2, localzztj2, paramParcel1.createTypedArrayList(zztf.CREATOR));
        return true;
      case 4:
      }
      paramParcel1.enforceInterface("com.google.android.gms.playlog.internal.IPlayLogService");
      String str1 = paramParcel1.readString();
      int i = paramParcel1.readInt();
      zztj localzztj1 = null;
      if (i != 0)
        localzztj1 = zztj.CREATOR.zzew(paramParcel1);
      zza(str1, localzztj1, paramParcel1.createByteArray());
      return true;
    }

    private static class zza
      implements zzte
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

      public void zza(String paramString, zztj paramzztj, zztf paramzztf)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel.writeInterfaceToken("com.google.android.gms.playlog.internal.IPlayLogService");
            localParcel.writeString(paramString);
            if (paramzztj != null)
            {
              localParcel.writeInt(1);
              paramzztj.writeToParcel(localParcel, 0);
              if (paramzztf != null)
              {
                localParcel.writeInt(1);
                paramzztf.writeToParcel(localParcel, 0);
                this.zzle.transact(2, localParcel, null, 1);
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

      public void zza(String paramString, zztj paramzztj, List<zztf> paramList)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.playlog.internal.IPlayLogService");
          localParcel.writeString(paramString);
          if (paramzztj != null)
          {
            localParcel.writeInt(1);
            paramzztj.writeToParcel(localParcel, 0);
          }
          while (true)
          {
            localParcel.writeTypedList(paramList);
            this.zzle.transact(3, localParcel, null, 1);
            return;
            localParcel.writeInt(0);
          }
        }
        finally
        {
          localParcel.recycle();
        }
      }

      public void zza(String paramString, zztj paramzztj, byte[] paramArrayOfByte)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.playlog.internal.IPlayLogService");
          localParcel.writeString(paramString);
          if (paramzztj != null)
          {
            localParcel.writeInt(1);
            paramzztj.writeToParcel(localParcel, 0);
          }
          while (true)
          {
            localParcel.writeByteArray(paramArrayOfByte);
            this.zzle.transact(4, localParcel, null, 1);
            return;
            localParcel.writeInt(0);
          }
        }
        finally
        {
          localParcel.recycle();
        }
      }
    }
  }
}