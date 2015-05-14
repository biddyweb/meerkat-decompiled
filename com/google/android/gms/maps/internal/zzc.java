package com.google.android.gms.maps.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.dynamic.zzd;
import com.google.android.gms.dynamic.zzd.zza;
import com.google.android.gms.maps.GoogleMapOptions;
import com.google.android.gms.maps.StreetViewPanoramaOptions;
import com.google.android.gms.maps.model.internal.zzg;
import com.google.android.gms.maps.model.internal.zzg.zza;
import com.google.android.gms.maps.zza;

public abstract interface zzc extends IInterface
{
  public abstract IMapViewDelegate zza(zzd paramzzd, GoogleMapOptions paramGoogleMapOptions)
    throws RemoteException;

  public abstract IStreetViewPanoramaViewDelegate zza(zzd paramzzd, StreetViewPanoramaOptions paramStreetViewPanoramaOptions)
    throws RemoteException;

  public abstract void zzb(zzd paramzzd, int paramInt)
    throws RemoteException;

  public abstract void zzi(zzd paramzzd)
    throws RemoteException;

  public abstract IMapFragmentDelegate zzj(zzd paramzzd)
    throws RemoteException;

  public abstract IStreetViewPanoramaFragmentDelegate zzk(zzd paramzzd)
    throws RemoteException;

  public abstract ICameraUpdateFactoryDelegate zzqA()
    throws RemoteException;

  public abstract zzg zzqB()
    throws RemoteException;

  public static abstract class zza extends Binder
    implements zzc
  {
    public static zzc zzbt(IBinder paramIBinder)
    {
      if (paramIBinder == null)
        return null;
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.maps.internal.ICreator");
      if ((localIInterface != null) && ((localIInterface instanceof zzc)))
        return (zzc)localIInterface;
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
        paramParcel2.writeString("com.google.android.gms.maps.internal.ICreator");
        return true;
      case 1:
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.ICreator");
        zzi(zzd.zza.zzau(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 2:
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.ICreator");
        IMapFragmentDelegate localIMapFragmentDelegate = zzj(zzd.zza.zzau(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        IBinder localIBinder6 = null;
        if (localIMapFragmentDelegate != null)
          localIBinder6 = localIMapFragmentDelegate.asBinder();
        paramParcel2.writeStrongBinder(localIBinder6);
        return true;
      case 3:
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.ICreator");
        zzd localzzd2 = zzd.zza.zzau(paramParcel1.readStrongBinder());
        if (paramParcel1.readInt() != 0);
        for (GoogleMapOptions localGoogleMapOptions = GoogleMapOptions.CREATOR.zzdP(paramParcel1); ; localGoogleMapOptions = null)
        {
          IMapViewDelegate localIMapViewDelegate = zza(localzzd2, localGoogleMapOptions);
          paramParcel2.writeNoException();
          IBinder localIBinder5 = null;
          if (localIMapViewDelegate != null)
            localIBinder5 = localIMapViewDelegate.asBinder();
          paramParcel2.writeStrongBinder(localIBinder5);
          return true;
        }
      case 4:
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.ICreator");
        ICameraUpdateFactoryDelegate localICameraUpdateFactoryDelegate = zzqA();
        paramParcel2.writeNoException();
        IBinder localIBinder4 = null;
        if (localICameraUpdateFactoryDelegate != null)
          localIBinder4 = localICameraUpdateFactoryDelegate.asBinder();
        paramParcel2.writeStrongBinder(localIBinder4);
        return true;
      case 5:
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.ICreator");
        zzg localzzg = zzqB();
        paramParcel2.writeNoException();
        IBinder localIBinder3 = null;
        if (localzzg != null)
          localIBinder3 = localzzg.asBinder();
        paramParcel2.writeStrongBinder(localIBinder3);
        return true;
      case 6:
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.ICreator");
        zzb(zzd.zza.zzau(paramParcel1.readStrongBinder()), paramParcel1.readInt());
        paramParcel2.writeNoException();
        return true;
      case 7:
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.ICreator");
        zzd localzzd1 = zzd.zza.zzau(paramParcel1.readStrongBinder());
        if (paramParcel1.readInt() != 0);
        for (StreetViewPanoramaOptions localStreetViewPanoramaOptions = StreetViewPanoramaOptions.CREATOR.zzdQ(paramParcel1); ; localStreetViewPanoramaOptions = null)
        {
          IStreetViewPanoramaViewDelegate localIStreetViewPanoramaViewDelegate = zza(localzzd1, localStreetViewPanoramaOptions);
          paramParcel2.writeNoException();
          IBinder localIBinder2 = null;
          if (localIStreetViewPanoramaViewDelegate != null)
            localIBinder2 = localIStreetViewPanoramaViewDelegate.asBinder();
          paramParcel2.writeStrongBinder(localIBinder2);
          return true;
        }
      case 8:
      }
      paramParcel1.enforceInterface("com.google.android.gms.maps.internal.ICreator");
      IStreetViewPanoramaFragmentDelegate localIStreetViewPanoramaFragmentDelegate = zzk(zzd.zza.zzau(paramParcel1.readStrongBinder()));
      paramParcel2.writeNoException();
      IBinder localIBinder1 = null;
      if (localIStreetViewPanoramaFragmentDelegate != null)
        localIBinder1 = localIStreetViewPanoramaFragmentDelegate.asBinder();
      paramParcel2.writeStrongBinder(localIBinder1);
      return true;
    }

    private static class zza
      implements zzc
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

      public IMapViewDelegate zza(zzd paramzzd, GoogleMapOptions paramGoogleMapOptions)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.ICreator");
          IBinder localIBinder;
          if (paramzzd != null)
          {
            localIBinder = paramzzd.asBinder();
            localParcel1.writeStrongBinder(localIBinder);
            if (paramGoogleMapOptions == null)
              break label96;
            localParcel1.writeInt(1);
            paramGoogleMapOptions.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(3, localParcel1, localParcel2, 0);
            localParcel2.readException();
            IMapViewDelegate localIMapViewDelegate = IMapViewDelegate.zza.zzbz(localParcel2.readStrongBinder());
            return localIMapViewDelegate;
            localIBinder = null;
            break;
            label96: localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public IStreetViewPanoramaViewDelegate zza(zzd paramzzd, StreetViewPanoramaOptions paramStreetViewPanoramaOptions)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.ICreator");
          IBinder localIBinder;
          if (paramzzd != null)
          {
            localIBinder = paramzzd.asBinder();
            localParcel1.writeStrongBinder(localIBinder);
            if (paramStreetViewPanoramaOptions == null)
              break label97;
            localParcel1.writeInt(1);
            paramStreetViewPanoramaOptions.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(7, localParcel1, localParcel2, 0);
            localParcel2.readException();
            IStreetViewPanoramaViewDelegate localIStreetViewPanoramaViewDelegate = IStreetViewPanoramaViewDelegate.zza.zzbU(localParcel2.readStrongBinder());
            return localIStreetViewPanoramaViewDelegate;
            localIBinder = null;
            break;
            label97: localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzb(zzd paramzzd, int paramInt)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.ICreator");
          if (paramzzd != null);
          for (IBinder localIBinder = paramzzd.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeInt(paramInt);
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

      public void zzi(zzd paramzzd)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.ICreator");
          if (paramzzd != null);
          for (IBinder localIBinder = paramzzd.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
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

      public IMapFragmentDelegate zzj(zzd paramzzd)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.ICreator");
          if (paramzzd != null);
          for (IBinder localIBinder = paramzzd.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.zzle.transact(2, localParcel1, localParcel2, 0);
            localParcel2.readException();
            IMapFragmentDelegate localIMapFragmentDelegate = IMapFragmentDelegate.zza.zzby(localParcel2.readStrongBinder());
            return localIMapFragmentDelegate;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public IStreetViewPanoramaFragmentDelegate zzk(zzd paramzzd)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.ICreator");
          if (paramzzd != null);
          for (IBinder localIBinder = paramzzd.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.zzle.transact(8, localParcel1, localParcel2, 0);
            localParcel2.readException();
            IStreetViewPanoramaFragmentDelegate localIStreetViewPanoramaFragmentDelegate = IStreetViewPanoramaFragmentDelegate.zza.zzbT(localParcel2.readStrongBinder());
            return localIStreetViewPanoramaFragmentDelegate;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public ICameraUpdateFactoryDelegate zzqA()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.ICreator");
          this.zzle.transact(4, localParcel1, localParcel2, 0);
          localParcel2.readException();
          ICameraUpdateFactoryDelegate localICameraUpdateFactoryDelegate = ICameraUpdateFactoryDelegate.zza.zzbr(localParcel2.readStrongBinder());
          return localICameraUpdateFactoryDelegate;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public zzg zzqB()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.ICreator");
          this.zzle.transact(5, localParcel1, localParcel2, 0);
          localParcel2.readException();
          zzg localzzg = zzg.zza.zzbW(localParcel2.readStrongBinder());
          return localzzg;
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