package com.google.android.gms.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.dynamic.zzd;
import com.google.android.gms.dynamic.zzd.zza;

public abstract interface zzbi extends IInterface
{
  public abstract void destroy()
    throws RemoteException;

  public abstract String getMediationAdapterClassName()
    throws RemoteException;

  public abstract boolean isReady()
    throws RemoteException;

  public abstract void pause()
    throws RemoteException;

  public abstract void resume()
    throws RemoteException;

  public abstract void showInterstitial()
    throws RemoteException;

  public abstract void stopLoading()
    throws RemoteException;

  public abstract void zza(zzba paramzzba)
    throws RemoteException;

  public abstract void zza(zzbg paramzzbg)
    throws RemoteException;

  public abstract void zza(zzbh paramzzbh)
    throws RemoteException;

  public abstract void zza(zzbk paramzzbk)
    throws RemoteException;

  public abstract void zza(zzbl paramzzbl)
    throws RemoteException;

  public abstract void zza(zzcj paramzzcj)
    throws RemoteException;

  public abstract void zza(zzfo paramzzfo)
    throws RemoteException;

  public abstract void zza(zzfs paramzzfs, String paramString)
    throws RemoteException;

  public abstract boolean zza(zzax paramzzax)
    throws RemoteException;

  public abstract zzd zzac()
    throws RemoteException;

  public abstract zzba zzad()
    throws RemoteException;

  public abstract void zzan()
    throws RemoteException;

  public static abstract class zza extends Binder
    implements zzbi
  {
    public zza()
    {
      attachInterface(this, "com.google.android.gms.ads.internal.client.IAdManager");
    }

    public static zzbi zzg(IBinder paramIBinder)
    {
      if (paramIBinder == null)
        return null;
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.ads.internal.client.IAdManager");
      if ((localIInterface != null) && ((localIInterface instanceof zzbi)))
        return (zzbi)localIInterface;
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
        paramParcel2.writeString("com.google.android.gms.ads.internal.client.IAdManager");
        return true;
      case 1:
        paramParcel1.enforceInterface("com.google.android.gms.ads.internal.client.IAdManager");
        zzd localzzd = zzac();
        paramParcel2.writeNoException();
        IBinder localIBinder = null;
        if (localzzd != null)
          localIBinder = localzzd.asBinder();
        paramParcel2.writeStrongBinder(localIBinder);
        return true;
      case 2:
        paramParcel1.enforceInterface("com.google.android.gms.ads.internal.client.IAdManager");
        destroy();
        paramParcel2.writeNoException();
        return true;
      case 3:
        paramParcel1.enforceInterface("com.google.android.gms.ads.internal.client.IAdManager");
        boolean bool2 = isReady();
        paramParcel2.writeNoException();
        if (bool2);
        for (int m = 1; ; m = 0)
        {
          paramParcel2.writeInt(m);
          return true;
        }
      case 4:
        paramParcel1.enforceInterface("com.google.android.gms.ads.internal.client.IAdManager");
        int j = paramParcel1.readInt();
        zzax localzzax = null;
        if (j != 0)
          localzzax = zzax.CREATOR.zzb(paramParcel1);
        boolean bool1 = zza(localzzax);
        paramParcel2.writeNoException();
        int k = 0;
        if (bool1)
          k = 1;
        paramParcel2.writeInt(k);
        return true;
      case 5:
        paramParcel1.enforceInterface("com.google.android.gms.ads.internal.client.IAdManager");
        pause();
        paramParcel2.writeNoException();
        return true;
      case 6:
        paramParcel1.enforceInterface("com.google.android.gms.ads.internal.client.IAdManager");
        resume();
        paramParcel2.writeNoException();
        return true;
      case 7:
        paramParcel1.enforceInterface("com.google.android.gms.ads.internal.client.IAdManager");
        zza(zzbh.zza.zzf(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 8:
        paramParcel1.enforceInterface("com.google.android.gms.ads.internal.client.IAdManager");
        zza(zzbk.zza.zzi(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 9:
        paramParcel1.enforceInterface("com.google.android.gms.ads.internal.client.IAdManager");
        showInterstitial();
        paramParcel2.writeNoException();
        return true;
      case 10:
        paramParcel1.enforceInterface("com.google.android.gms.ads.internal.client.IAdManager");
        stopLoading();
        paramParcel2.writeNoException();
        return true;
      case 11:
        paramParcel1.enforceInterface("com.google.android.gms.ads.internal.client.IAdManager");
        zzan();
        paramParcel2.writeNoException();
        return true;
      case 12:
        paramParcel1.enforceInterface("com.google.android.gms.ads.internal.client.IAdManager");
        zzba localzzba2 = zzad();
        paramParcel2.writeNoException();
        if (localzzba2 != null)
        {
          paramParcel2.writeInt(1);
          localzzba2.writeToParcel(paramParcel2, 1);
          return true;
        }
        paramParcel2.writeInt(0);
        return true;
      case 13:
        paramParcel1.enforceInterface("com.google.android.gms.ads.internal.client.IAdManager");
        int i = paramParcel1.readInt();
        zzba localzzba1 = null;
        if (i != 0)
          localzzba1 = zzba.CREATOR.zzc(paramParcel1);
        zza(localzzba1);
        paramParcel2.writeNoException();
        return true;
      case 14:
        paramParcel1.enforceInterface("com.google.android.gms.ads.internal.client.IAdManager");
        zza(zzfo.zza.zzz(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 15:
        paramParcel1.enforceInterface("com.google.android.gms.ads.internal.client.IAdManager");
        zza(zzfs.zza.zzD(paramParcel1.readStrongBinder()), paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 18:
        paramParcel1.enforceInterface("com.google.android.gms.ads.internal.client.IAdManager");
        String str = getMediationAdapterClassName();
        paramParcel2.writeNoException();
        paramParcel2.writeString(str);
        return true;
      case 19:
        paramParcel1.enforceInterface("com.google.android.gms.ads.internal.client.IAdManager");
        zza(zzcj.zza.zzn(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 20:
        paramParcel1.enforceInterface("com.google.android.gms.ads.internal.client.IAdManager");
        zza(zzbg.zza.zze(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 21:
      }
      paramParcel1.enforceInterface("com.google.android.gms.ads.internal.client.IAdManager");
      zza(zzbl.zza.zzj(paramParcel1.readStrongBinder()));
      paramParcel2.writeNoException();
      return true;
    }

    private static class zza
      implements zzbi
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
          localParcel1.writeInterfaceToken("com.google.android.gms.ads.internal.client.IAdManager");
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

      public String getMediationAdapterClassName()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.ads.internal.client.IAdManager");
          this.zzle.transact(18, localParcel1, localParcel2, 0);
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

      public boolean isReady()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.ads.internal.client.IAdManager");
          this.zzle.transact(3, localParcel1, localParcel2, 0);
          localParcel2.readException();
          int i = localParcel2.readInt();
          boolean bool = false;
          if (i != 0)
            bool = true;
          return bool;
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
          localParcel1.writeInterfaceToken("com.google.android.gms.ads.internal.client.IAdManager");
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

      public void resume()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.ads.internal.client.IAdManager");
          this.zzle.transact(6, localParcel1, localParcel2, 0);
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
          localParcel1.writeInterfaceToken("com.google.android.gms.ads.internal.client.IAdManager");
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

      public void stopLoading()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.ads.internal.client.IAdManager");
          this.zzle.transact(10, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zza(zzba paramzzba)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.ads.internal.client.IAdManager");
          if (paramzzba != null)
          {
            localParcel1.writeInt(1);
            paramzzba.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(13, localParcel1, localParcel2, 0);
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

      public void zza(zzbg paramzzbg)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.ads.internal.client.IAdManager");
          if (paramzzbg != null);
          for (IBinder localIBinder = paramzzbg.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.zzle.transact(20, localParcel1, localParcel2, 0);
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

      public void zza(zzbh paramzzbh)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.ads.internal.client.IAdManager");
          if (paramzzbh != null);
          for (IBinder localIBinder = paramzzbh.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.zzle.transact(7, localParcel1, localParcel2, 0);
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

      public void zza(zzbk paramzzbk)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.ads.internal.client.IAdManager");
          if (paramzzbk != null);
          for (IBinder localIBinder = paramzzbk.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.zzle.transact(8, localParcel1, localParcel2, 0);
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

      public void zza(zzbl paramzzbl)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.ads.internal.client.IAdManager");
          if (paramzzbl != null);
          for (IBinder localIBinder = paramzzbl.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.zzle.transact(21, localParcel1, localParcel2, 0);
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

      public void zza(zzcj paramzzcj)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.ads.internal.client.IAdManager");
          if (paramzzcj != null);
          for (IBinder localIBinder = paramzzcj.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.zzle.transact(19, localParcel1, localParcel2, 0);
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

      public void zza(zzfo paramzzfo)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.ads.internal.client.IAdManager");
          if (paramzzfo != null);
          for (IBinder localIBinder = paramzzfo.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.zzle.transact(14, localParcel1, localParcel2, 0);
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

      public void zza(zzfs paramzzfs, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.ads.internal.client.IAdManager");
          if (paramzzfs != null);
          for (IBinder localIBinder = paramzzfs.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            this.zzle.transact(15, localParcel1, localParcel2, 0);
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

      public boolean zza(zzax paramzzax)
        throws RemoteException
      {
        boolean bool = true;
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.ads.internal.client.IAdManager");
            if (paramzzax != null)
            {
              localParcel1.writeInt(1);
              paramzzax.writeToParcel(localParcel1, 0);
              this.zzle.transact(4, localParcel1, localParcel2, 0);
              localParcel2.readException();
              int i = localParcel2.readInt();
              if (i != 0)
                return bool;
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
          bool = false;
        }
      }

      public zzd zzac()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.ads.internal.client.IAdManager");
          this.zzle.transact(1, localParcel1, localParcel2, 0);
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

      public zzba zzad()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.ads.internal.client.IAdManager");
          this.zzle.transact(12, localParcel1, localParcel2, 0);
          localParcel2.readException();
          if (localParcel2.readInt() != 0)
          {
            zzba localzzba2 = zzba.CREATOR.zzc(localParcel2);
            localzzba1 = localzzba2;
            return localzzba1;
          }
          zzba localzzba1 = null;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzan()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.ads.internal.client.IAdManager");
          this.zzle.transact(11, localParcel1, localParcel2, 0);
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