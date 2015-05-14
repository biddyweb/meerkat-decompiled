package com.google.android.gms.internal;

import android.app.PendingIntent;
import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import android.os.RemoteException;
import com.google.android.gms.location.places.PlaceFilter;
import com.google.android.gms.location.places.PlaceReport;
import com.google.android.gms.location.places.PlaceReportCreator;
import com.google.android.gms.location.places.zzc;
import com.google.android.gms.location.places.zzd;
import com.google.android.gms.location.places.zze;
import com.google.android.gms.location.places.zzf;
import com.google.android.gms.location.places.zzg;

public abstract interface zzpt extends IInterface
{
  public abstract void zza(zzqh paramzzqh, PendingIntent paramPendingIntent, zzpv paramzzpv)
    throws RemoteException;

  public abstract void zza(PlaceFilter paramPlaceFilter, zzqh paramzzqh, zzpv paramzzpv)
    throws RemoteException;

  public abstract void zza(PlaceReport paramPlaceReport, zzqh paramzzqh, zzpv paramzzpv)
    throws RemoteException;

  public abstract void zza(zzc paramzzc, zzqh paramzzqh, PendingIntent paramPendingIntent, zzpv paramzzpv)
    throws RemoteException;

  public abstract void zza(zzf paramzzf, zzqh paramzzqh, PendingIntent paramPendingIntent, zzpv paramzzpv)
    throws RemoteException;

  public abstract void zzb(zzqh paramzzqh, PendingIntent paramPendingIntent, zzpv paramzzpv)
    throws RemoteException;

  public static abstract class zza extends Binder
    implements zzpt
  {
    public static zzpt zzbn(IBinder paramIBinder)
    {
      if (paramIBinder == null)
        return null;
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.location.places.internal.IGooglePlaceDetectionService");
      if ((localIInterface != null) && ((localIInterface instanceof zzpt)))
        return (zzpt)localIInterface;
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
        paramParcel2.writeString("com.google.android.gms.location.places.internal.IGooglePlaceDetectionService");
        return true;
      case 2:
        paramParcel1.enforceInterface("com.google.android.gms.location.places.internal.IGooglePlaceDetectionService");
        zzf localzzf;
        zzqh localzzqh6;
        if (paramParcel1.readInt() != 0)
        {
          localzzf = zzf.CREATOR.zzdC(paramParcel1);
          if (paramParcel1.readInt() == 0)
            break label174;
          localzzqh6 = zzqh.CREATOR.zzdI(paramParcel1);
          if (paramParcel1.readInt() == 0)
            break label180;
        }
        for (PendingIntent localPendingIntent4 = (PendingIntent)PendingIntent.CREATOR.createFromParcel(paramParcel1); ; localPendingIntent4 = null)
        {
          zza(localzzf, localzzqh6, localPendingIntent4, zzpv.zza.zzbp(paramParcel1.readStrongBinder()));
          paramParcel2.writeNoException();
          return true;
          localzzf = null;
          break;
          localzzqh6 = null;
          break label124;
        }
      case 3:
        paramParcel1.enforceInterface("com.google.android.gms.location.places.internal.IGooglePlaceDetectionService");
        zzqh localzzqh5;
        if (paramParcel1.readInt() != 0)
        {
          localzzqh5 = zzqh.CREATOR.zzdI(paramParcel1);
          if (paramParcel1.readInt() == 0)
            break label256;
        }
        for (PendingIntent localPendingIntent3 = (PendingIntent)PendingIntent.CREATOR.createFromParcel(paramParcel1); ; localPendingIntent3 = null)
        {
          zza(localzzqh5, localPendingIntent3, zzpv.zza.zzbp(paramParcel1.readStrongBinder()));
          paramParcel2.writeNoException();
          return true;
          localzzqh5 = null;
          break;
        }
      case 4:
        paramParcel1.enforceInterface("com.google.android.gms.location.places.internal.IGooglePlaceDetectionService");
        zzc localzzc;
        zzqh localzzqh4;
        if (paramParcel1.readInt() != 0)
        {
          localzzc = zzc.CREATOR.zzdA(paramParcel1);
          if (paramParcel1.readInt() == 0)
            break label350;
          localzzqh4 = zzqh.CREATOR.zzdI(paramParcel1);
          if (paramParcel1.readInt() == 0)
            break label356;
        }
        for (PendingIntent localPendingIntent2 = (PendingIntent)PendingIntent.CREATOR.createFromParcel(paramParcel1); ; localPendingIntent2 = null)
        {
          zza(localzzc, localzzqh4, localPendingIntent2, zzpv.zza.zzbp(paramParcel1.readStrongBinder()));
          paramParcel2.writeNoException();
          return true;
          localzzc = null;
          break;
          localzzqh4 = null;
          break label300;
        }
      case 5:
        paramParcel1.enforceInterface("com.google.android.gms.location.places.internal.IGooglePlaceDetectionService");
        zzqh localzzqh3;
        if (paramParcel1.readInt() != 0)
        {
          localzzqh3 = zzqh.CREATOR.zzdI(paramParcel1);
          if (paramParcel1.readInt() == 0)
            break label432;
        }
        for (PendingIntent localPendingIntent1 = (PendingIntent)PendingIntent.CREATOR.createFromParcel(paramParcel1); ; localPendingIntent1 = null)
        {
          zzb(localzzqh3, localPendingIntent1, zzpv.zza.zzbp(paramParcel1.readStrongBinder()));
          paramParcel2.writeNoException();
          return true;
          localzzqh3 = null;
          break;
        }
      case 6:
        label124: paramParcel1.enforceInterface("com.google.android.gms.location.places.internal.IGooglePlaceDetectionService");
        label174: label180: label350: label356: if (paramParcel1.readInt() != 0);
        label256: label300: label432: for (PlaceFilter localPlaceFilter = PlaceFilter.CREATOR.zzdB(paramParcel1); ; localPlaceFilter = null)
        {
          int j = paramParcel1.readInt();
          zzqh localzzqh2 = null;
          if (j != 0)
            localzzqh2 = zzqh.CREATOR.zzdI(paramParcel1);
          zza(localPlaceFilter, localzzqh2, zzpv.zza.zzbp(paramParcel1.readStrongBinder()));
          paramParcel2.writeNoException();
          return true;
        }
      case 7:
      }
      paramParcel1.enforceInterface("com.google.android.gms.location.places.internal.IGooglePlaceDetectionService");
      if (paramParcel1.readInt() != 0);
      for (PlaceReport localPlaceReport = PlaceReport.CREATOR.createFromParcel(paramParcel1); ; localPlaceReport = null)
      {
        int i = paramParcel1.readInt();
        zzqh localzzqh1 = null;
        if (i != 0)
          localzzqh1 = zzqh.CREATOR.zzdI(paramParcel1);
        zza(localPlaceReport, localzzqh1, zzpv.zza.zzbp(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      }
    }

    private static class zza
      implements zzpt
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

      public void zza(zzqh paramzzqh, PendingIntent paramPendingIntent, zzpv paramzzpv)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.location.places.internal.IGooglePlaceDetectionService");
            if (paramzzqh != null)
            {
              localParcel1.writeInt(1);
              paramzzqh.writeToParcel(localParcel1, 0);
              if (paramPendingIntent != null)
              {
                localParcel1.writeInt(1);
                paramPendingIntent.writeToParcel(localParcel1, 0);
                if (paramzzpv == null)
                  break label135;
                localIBinder = paramzzpv.asBinder();
                localParcel1.writeStrongBinder(localIBinder);
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
          continue;
          label135: IBinder localIBinder = null;
        }
      }

      public void zza(PlaceFilter paramPlaceFilter, zzqh paramzzqh, zzpv paramzzpv)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.location.places.internal.IGooglePlaceDetectionService");
            if (paramPlaceFilter != null)
            {
              localParcel1.writeInt(1);
              paramPlaceFilter.writeToParcel(localParcel1, 0);
              if (paramzzqh != null)
              {
                localParcel1.writeInt(1);
                paramzzqh.writeToParcel(localParcel1, 0);
                if (paramzzpv == null)
                  break label136;
                localIBinder = paramzzpv.asBinder();
                localParcel1.writeStrongBinder(localIBinder);
                this.zzle.transact(6, localParcel1, localParcel2, 0);
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
          continue;
          label136: IBinder localIBinder = null;
        }
      }

      public void zza(PlaceReport paramPlaceReport, zzqh paramzzqh, zzpv paramzzpv)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.location.places.internal.IGooglePlaceDetectionService");
            if (paramPlaceReport != null)
            {
              localParcel1.writeInt(1);
              paramPlaceReport.writeToParcel(localParcel1, 0);
              if (paramzzqh != null)
              {
                localParcel1.writeInt(1);
                paramzzqh.writeToParcel(localParcel1, 0);
                if (paramzzpv == null)
                  break label136;
                localIBinder = paramzzpv.asBinder();
                localParcel1.writeStrongBinder(localIBinder);
                this.zzle.transact(7, localParcel1, localParcel2, 0);
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
          continue;
          label136: IBinder localIBinder = null;
        }
      }

      public void zza(zzc paramzzc, zzqh paramzzqh, PendingIntent paramPendingIntent, zzpv paramzzpv)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.location.places.internal.IGooglePlaceDetectionService");
            if (paramzzc != null)
            {
              localParcel1.writeInt(1);
              paramzzc.writeToParcel(localParcel1, 0);
              if (paramzzqh != null)
              {
                localParcel1.writeInt(1);
                paramzzqh.writeToParcel(localParcel1, 0);
                if (paramPendingIntent == null)
                  break label154;
                localParcel1.writeInt(1);
                paramPendingIntent.writeToParcel(localParcel1, 0);
                if (paramzzpv == null)
                  break label163;
                localIBinder = paramzzpv.asBinder();
                localParcel1.writeStrongBinder(localIBinder);
                this.zzle.transact(4, localParcel1, localParcel2, 0);
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
          continue;
          label154: localParcel1.writeInt(0);
          continue;
          label163: IBinder localIBinder = null;
        }
      }

      public void zza(zzf paramzzf, zzqh paramzzqh, PendingIntent paramPendingIntent, zzpv paramzzpv)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.location.places.internal.IGooglePlaceDetectionService");
            if (paramzzf != null)
            {
              localParcel1.writeInt(1);
              paramzzf.writeToParcel(localParcel1, 0);
              if (paramzzqh != null)
              {
                localParcel1.writeInt(1);
                paramzzqh.writeToParcel(localParcel1, 0);
                if (paramPendingIntent == null)
                  break label154;
                localParcel1.writeInt(1);
                paramPendingIntent.writeToParcel(localParcel1, 0);
                if (paramzzpv == null)
                  break label163;
                localIBinder = paramzzpv.asBinder();
                localParcel1.writeStrongBinder(localIBinder);
                this.zzle.transact(2, localParcel1, localParcel2, 0);
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
          continue;
          label154: localParcel1.writeInt(0);
          continue;
          label163: IBinder localIBinder = null;
        }
      }

      public void zzb(zzqh paramzzqh, PendingIntent paramPendingIntent, zzpv paramzzpv)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.location.places.internal.IGooglePlaceDetectionService");
            if (paramzzqh != null)
            {
              localParcel1.writeInt(1);
              paramzzqh.writeToParcel(localParcel1, 0);
              if (paramPendingIntent != null)
              {
                localParcel1.writeInt(1);
                paramPendingIntent.writeToParcel(localParcel1, 0);
                if (paramzzpv == null)
                  break label135;
                localIBinder = paramzzpv.asBinder();
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
          localParcel1.writeInt(0);
          continue;
          label135: IBinder localIBinder = null;
        }
      }
    }
  }
}