package com.google.android.gms.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import java.util.List;
import java.util.Map;

public abstract interface zzil extends IInterface
{
  public abstract String getVersion()
    throws RemoteException;

  public abstract void zza(Map paramMap, long paramLong, String paramString, List<zzik> paramList)
    throws RemoteException;

  public abstract void zzfa()
    throws RemoteException;

  public static abstract class zza extends Binder
    implements zzil
  {
    public static zzil zzH(IBinder paramIBinder)
    {
      if (paramIBinder == null)
        return null;
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.analytics.internal.IAnalyticsService");
      if ((localIInterface != null) && ((localIInterface instanceof zzil)))
        return (zzil)localIInterface;
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
        paramParcel2.writeString("com.google.android.gms.analytics.internal.IAnalyticsService");
        return true;
      case 1:
        paramParcel1.enforceInterface("com.google.android.gms.analytics.internal.IAnalyticsService");
        zza(paramParcel1.readHashMap(getClass().getClassLoader()), paramParcel1.readLong(), paramParcel1.readString(), paramParcel1.createTypedArrayList(zzik.CREATOR));
        paramParcel2.writeNoException();
        return true;
      case 2:
        paramParcel1.enforceInterface("com.google.android.gms.analytics.internal.IAnalyticsService");
        zzfa();
        paramParcel2.writeNoException();
        return true;
      case 3:
      }
      paramParcel1.enforceInterface("com.google.android.gms.analytics.internal.IAnalyticsService");
      String str = getVersion();
      paramParcel2.writeNoException();
      paramParcel2.writeString(str);
      return true;
    }

    private static class zza
      implements zzil
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

      public String getVersion()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.analytics.internal.IAnalyticsService");
          this.zzle.transact(3, localParcel1, localParcel2, 0);
          localParcel2.readException();
          String str = localParcel2.readString();
          return str;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zza(Map paramMap, long paramLong, String paramString, List<zzik> paramList)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.analytics.internal.IAnalyticsService");
          localParcel1.writeMap(paramMap);
          localParcel1.writeLong(paramLong);
          localParcel1.writeString(paramString);
          localParcel1.writeTypedList(paramList);
          this.zzle.transact(1, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzfa()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.analytics.internal.IAnalyticsService");
          this.zzle.transact(2, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
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