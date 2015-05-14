package com.google.android.gms.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.dynamic.zzd;
import com.google.android.gms.dynamic.zzd.zza;

public abstract interface zzds extends IInterface
{
  public abstract void destroy()
    throws RemoteException;

  public abstract zzd getView()
    throws RemoteException;

  public abstract void pause()
    throws RemoteException;

  public abstract void resume()
    throws RemoteException;

  public abstract void showInterstitial()
    throws RemoteException;

  public abstract void zza(zzd paramzzd, zzax paramzzax, String paramString, zzdt paramzzdt)
    throws RemoteException;

  public abstract void zza(zzd paramzzd, zzax paramzzax, String paramString1, String paramString2, zzdt paramzzdt)
    throws RemoteException;

  public abstract void zza(zzd paramzzd, zzba paramzzba, zzax paramzzax, String paramString, zzdt paramzzdt)
    throws RemoteException;

  public abstract void zza(zzd paramzzd, zzba paramzzba, zzax paramzzax, String paramString1, String paramString2, zzdt paramzzdt)
    throws RemoteException;

  public static abstract class zza extends Binder
    implements zzds
  {
    public zza()
    {
      attachInterface(this, "com.google.android.gms.ads.internal.mediation.client.IMediationAdapter");
    }

    public static zzds zzs(IBinder paramIBinder)
    {
      if (paramIBinder == null)
        return null;
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.ads.internal.mediation.client.IMediationAdapter");
      if ((localIInterface != null) && ((localIInterface instanceof zzds)))
        return (zzds)localIInterface;
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
        paramParcel2.writeString("com.google.android.gms.ads.internal.mediation.client.IMediationAdapter");
        return true;
      case 1:
        paramParcel1.enforceInterface("com.google.android.gms.ads.internal.mediation.client.IMediationAdapter");
        zzd localzzd5 = zzd.zza.zzau(paramParcel1.readStrongBinder());
        zzba localzzba2;
        if (paramParcel1.readInt() != 0)
        {
          localzzba2 = zzba.CREATOR.zzc(paramParcel1);
          if (paramParcel1.readInt() == 0)
            break label190;
        }
        for (zzax localzzax4 = zzax.CREATOR.zzb(paramParcel1); ; localzzax4 = null)
        {
          zza(localzzd5, localzzba2, localzzax4, paramParcel1.readString(), zzdt.zza.zzt(paramParcel1.readStrongBinder()));
          paramParcel2.writeNoException();
          return true;
          localzzba2 = null;
          break;
        }
      case 2:
        paramParcel1.enforceInterface("com.google.android.gms.ads.internal.mediation.client.IMediationAdapter");
        zzd localzzd4 = getView();
        paramParcel2.writeNoException();
        IBinder localIBinder = null;
        if (localzzd4 != null)
          localIBinder = localzzd4.asBinder();
        paramParcel2.writeStrongBinder(localIBinder);
        return true;
      case 3:
        paramParcel1.enforceInterface("com.google.android.gms.ads.internal.mediation.client.IMediationAdapter");
        zzd localzzd3 = zzd.zza.zzau(paramParcel1.readStrongBinder());
        int i = paramParcel1.readInt();
        zzax localzzax3 = null;
        if (i != 0)
          localzzax3 = zzax.CREATOR.zzb(paramParcel1);
        zza(localzzd3, localzzax3, paramParcel1.readString(), zzdt.zza.zzt(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 4:
        paramParcel1.enforceInterface("com.google.android.gms.ads.internal.mediation.client.IMediationAdapter");
        showInterstitial();
        paramParcel2.writeNoException();
        return true;
      case 5:
        paramParcel1.enforceInterface("com.google.android.gms.ads.internal.mediation.client.IMediationAdapter");
        destroy();
        paramParcel2.writeNoException();
        return true;
      case 6:
        paramParcel1.enforceInterface("com.google.android.gms.ads.internal.mediation.client.IMediationAdapter");
        zzd localzzd2 = zzd.zza.zzau(paramParcel1.readStrongBinder());
        zzba localzzba1;
        if (paramParcel1.readInt() != 0)
        {
          localzzba1 = zzba.CREATOR.zzc(paramParcel1);
          if (paramParcel1.readInt() == 0)
            break label416;
        }
        for (zzax localzzax2 = zzax.CREATOR.zzb(paramParcel1); ; localzzax2 = null)
        {
          zza(localzzd2, localzzba1, localzzax2, paramParcel1.readString(), paramParcel1.readString(), zzdt.zza.zzt(paramParcel1.readStrongBinder()));
          paramParcel2.writeNoException();
          return true;
          localzzba1 = null;
          break;
        }
      case 7:
        paramParcel1.enforceInterface("com.google.android.gms.ads.internal.mediation.client.IMediationAdapter");
        zzd localzzd1 = zzd.zza.zzau(paramParcel1.readStrongBinder());
        if (paramParcel1.readInt() != 0);
        for (zzax localzzax1 = zzax.CREATOR.zzb(paramParcel1); ; localzzax1 = null)
        {
          zza(localzzd1, localzzax1, paramParcel1.readString(), paramParcel1.readString(), zzdt.zza.zzt(paramParcel1.readStrongBinder()));
          paramParcel2.writeNoException();
          return true;
        }
      case 8:
        label190: paramParcel1.enforceInterface("com.google.android.gms.ads.internal.mediation.client.IMediationAdapter");
        label416: pause();
        paramParcel2.writeNoException();
        return true;
      case 9:
      }
      paramParcel1.enforceInterface("com.google.android.gms.ads.internal.mediation.client.IMediationAdapter");
      resume();
      paramParcel2.writeNoException();
      return true;
    }

    private static class zza
      implements zzds
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

      public void destroy()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.ads.internal.mediation.client.IMediationAdapter");
          this.zzle.transact(5, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public zzd getView()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.ads.internal.mediation.client.IMediationAdapter");
          this.zzle.transact(2, localParcel1, localParcel2, 0);
          localParcel2.readException();
          zzd localzzd = zzd.zza.zzau(localParcel2.readStrongBinder());
          return localzzd;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void pause()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.ads.internal.mediation.client.IMediationAdapter");
          this.zzle.transact(8, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void resume()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.ads.internal.mediation.client.IMediationAdapter");
          this.zzle.transact(9, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void showInterstitial()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.ads.internal.mediation.client.IMediationAdapter");
          this.zzle.transact(4, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zza(zzd paramzzd, zzax paramzzax, String paramString, zzdt paramzzdt)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.ads.internal.mediation.client.IMediationAdapter");
          IBinder localIBinder1;
          if (paramzzd != null)
          {
            localIBinder1 = paramzzd.asBinder();
            localParcel1.writeStrongBinder(localIBinder1);
            if (paramzzax == null)
              break label121;
            localParcel1.writeInt(1);
            paramzzax.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            localParcel1.writeString(paramString);
            IBinder localIBinder2 = null;
            if (paramzzdt != null)
              localIBinder2 = paramzzdt.asBinder();
            localParcel1.writeStrongBinder(localIBinder2);
            this.zzle.transact(3, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localIBinder1 = null;
            break;
            label121: localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zza(zzd paramzzd, zzax paramzzax, String paramString1, String paramString2, zzdt paramzzdt)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.ads.internal.mediation.client.IMediationAdapter");
          IBinder localIBinder1;
          if (paramzzd != null)
          {
            localIBinder1 = paramzzd.asBinder();
            localParcel1.writeStrongBinder(localIBinder1);
            if (paramzzax == null)
              break label129;
            localParcel1.writeInt(1);
            paramzzax.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            localParcel1.writeString(paramString1);
            localParcel1.writeString(paramString2);
            IBinder localIBinder2 = null;
            if (paramzzdt != null)
              localIBinder2 = paramzzdt.asBinder();
            localParcel1.writeStrongBinder(localIBinder2);
            this.zzle.transact(7, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localIBinder1 = null;
            break;
            label129: localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zza(zzd paramzzd, zzba paramzzba, zzax paramzzax, String paramString, zzdt paramzzdt)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.ads.internal.mediation.client.IMediationAdapter");
            IBinder localIBinder1;
            if (paramzzd != null)
            {
              localIBinder1 = paramzzd.asBinder();
              localParcel1.writeStrongBinder(localIBinder1);
              if (paramzzba != null)
              {
                localParcel1.writeInt(1);
                paramzzba.writeToParcel(localParcel1, 0);
                if (paramzzax == null)
                  break label163;
                localParcel1.writeInt(1);
                paramzzax.writeToParcel(localParcel1, 0);
                localParcel1.writeString(paramString);
                IBinder localIBinder2 = null;
                if (paramzzdt != null)
                  localIBinder2 = paramzzdt.asBinder();
                localParcel1.writeStrongBinder(localIBinder2);
                this.zzle.transact(1, localParcel1, localParcel2, 0);
                localParcel2.readException();
              }
            }
            else
            {
              localIBinder1 = null;
              continue;
            }
            localParcel1.writeInt(0);
            continue;
          }
          finally
          {
            localParcel2.recycle();
            localParcel1.recycle();
          }
          label163: localParcel1.writeInt(0);
        }
      }

      public void zza(zzd paramzzd, zzba paramzzba, zzax paramzzax, String paramString1, String paramString2, zzdt paramzzdt)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.ads.internal.mediation.client.IMediationAdapter");
            IBinder localIBinder1;
            if (paramzzd != null)
            {
              localIBinder1 = paramzzd.asBinder();
              localParcel1.writeStrongBinder(localIBinder1);
              if (paramzzba != null)
              {
                localParcel1.writeInt(1);
                paramzzba.writeToParcel(localParcel1, 0);
                if (paramzzax == null)
                  break label171;
                localParcel1.writeInt(1);
                paramzzax.writeToParcel(localParcel1, 0);
                localParcel1.writeString(paramString1);
                localParcel1.writeString(paramString2);
                IBinder localIBinder2 = null;
                if (paramzzdt != null)
                  localIBinder2 = paramzzdt.asBinder();
                localParcel1.writeStrongBinder(localIBinder2);
                this.zzle.transact(6, localParcel1, localParcel2, 0);
                localParcel2.readException();
              }
            }
            else
            {
              localIBinder1 = null;
              continue;
            }
            localParcel1.writeInt(0);
            continue;
          }
          finally
          {
            localParcel2.recycle();
            localParcel1.recycle();
          }
          label171: localParcel1.writeInt(0);
        }
      }
    }
  }
}