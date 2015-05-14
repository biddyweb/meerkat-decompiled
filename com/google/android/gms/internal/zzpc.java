package com.google.android.gms.internal;

import android.app.PendingIntent;
import android.location.Location;
import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import android.os.RemoteException;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.StatusCreator;
import com.google.android.gms.location.GeofencingRequest;
import com.google.android.gms.location.LocationRequest;
import com.google.android.gms.location.LocationSettingsRequest;
import com.google.android.gms.location.zzb;
import com.google.android.gms.location.zzc;
import com.google.android.gms.location.zzd;
import com.google.android.gms.location.zzd.zza;
import com.google.android.gms.location.zzg;
import com.google.android.gms.location.zzl;
import com.google.android.gms.location.zzm;
import java.util.ArrayList;
import java.util.List;

public abstract interface zzpc extends IInterface
{
  public abstract void zzW(boolean paramBoolean)
    throws RemoteException;

  public abstract Status zza(zzb paramzzb, PendingIntent paramPendingIntent)
    throws RemoteException;

  public abstract void zza(long paramLong, boolean paramBoolean, PendingIntent paramPendingIntent)
    throws RemoteException;

  public abstract void zza(PendingIntent paramPendingIntent)
    throws RemoteException;

  public abstract void zza(PendingIntent paramPendingIntent, zzpb paramzzpb, String paramString)
    throws RemoteException;

  public abstract void zza(Location paramLocation, int paramInt)
    throws RemoteException;

  public abstract void zza(zzpb paramzzpb, String paramString)
    throws RemoteException;

  public abstract void zza(zzpg paramzzpg, PendingIntent paramPendingIntent)
    throws RemoteException;

  public abstract void zza(zzpg paramzzpg, zzd paramzzd)
    throws RemoteException;

  public abstract void zza(zzpi paramzzpi)
    throws RemoteException;

  public abstract void zza(GeofencingRequest paramGeofencingRequest, PendingIntent paramPendingIntent, zzpb paramzzpb)
    throws RemoteException;

  public abstract void zza(LocationRequest paramLocationRequest, PendingIntent paramPendingIntent)
    throws RemoteException;

  public abstract void zza(LocationRequest paramLocationRequest, zzd paramzzd)
    throws RemoteException;

  public abstract void zza(LocationRequest paramLocationRequest, zzd paramzzd, String paramString)
    throws RemoteException;

  public abstract void zza(LocationSettingsRequest paramLocationSettingsRequest, zzpd paramzzpd, String paramString)
    throws RemoteException;

  public abstract void zza(zzd paramzzd)
    throws RemoteException;

  public abstract void zza(List<zzpk> paramList, PendingIntent paramPendingIntent, zzpb paramzzpb, String paramString)
    throws RemoteException;

  public abstract void zza(String[] paramArrayOfString, zzpb paramzzpb, String paramString)
    throws RemoteException;

  public abstract Status zzb(PendingIntent paramPendingIntent)
    throws RemoteException;

  public abstract void zzb(Location paramLocation)
    throws RemoteException;

  public abstract void zzc(PendingIntent paramPendingIntent)
    throws RemoteException;

  public abstract Location zzcj(String paramString)
    throws RemoteException;

  public abstract zzl zzck(String paramString)
    throws RemoteException;

  public abstract Location zzpv()
    throws RemoteException;

  public abstract IBinder zzpw()
    throws RemoteException;

  public static abstract class zza extends Binder
    implements zzpc
  {
    public static zzpc zzbk(IBinder paramIBinder)
    {
      if (paramIBinder == null)
        return null;
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.location.internal.IGoogleLocationManagerService");
      if ((localIInterface != null) && ((localIInterface instanceof zzpc)))
        return (zzpc)localIInterface;
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
        paramParcel2.writeString("com.google.android.gms.location.internal.IGoogleLocationManagerService");
        return true;
      case 1:
        paramParcel1.enforceInterface("com.google.android.gms.location.internal.IGoogleLocationManagerService");
        ArrayList localArrayList = paramParcel1.createTypedArrayList(zzpk.CREATOR);
        if (paramParcel1.readInt() != 0);
        for (PendingIntent localPendingIntent10 = (PendingIntent)PendingIntent.CREATOR.createFromParcel(paramParcel1); ; localPendingIntent10 = null)
        {
          zza(localArrayList, localPendingIntent10, zzpb.zza.zzbj(paramParcel1.readStrongBinder()), paramParcel1.readString());
          paramParcel2.writeNoException();
          return true;
        }
      case 57:
        paramParcel1.enforceInterface("com.google.android.gms.location.internal.IGoogleLocationManagerService");
        GeofencingRequest localGeofencingRequest;
        if (paramParcel1.readInt() != 0)
        {
          localGeofencingRequest = (GeofencingRequest)GeofencingRequest.CREATOR.createFromParcel(paramParcel1);
          if (paramParcel1.readInt() == 0)
            break label380;
        }
        for (PendingIntent localPendingIntent9 = (PendingIntent)PendingIntent.CREATOR.createFromParcel(paramParcel1); ; localPendingIntent9 = null)
        {
          zza(localGeofencingRequest, localPendingIntent9, zzpb.zza.zzbj(paramParcel1.readStrongBinder()));
          paramParcel2.writeNoException();
          return true;
          localGeofencingRequest = null;
          break;
        }
      case 2:
        paramParcel1.enforceInterface("com.google.android.gms.location.internal.IGoogleLocationManagerService");
        if (paramParcel1.readInt() != 0);
        for (PendingIntent localPendingIntent8 = (PendingIntent)PendingIntent.CREATOR.createFromParcel(paramParcel1); ; localPendingIntent8 = null)
        {
          zza(localPendingIntent8, zzpb.zza.zzbj(paramParcel1.readStrongBinder()), paramParcel1.readString());
          paramParcel2.writeNoException();
          return true;
        }
      case 3:
        paramParcel1.enforceInterface("com.google.android.gms.location.internal.IGoogleLocationManagerService");
        zza(paramParcel1.createStringArray(), zzpb.zza.zzbj(paramParcel1.readStrongBinder()), paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 4:
        paramParcel1.enforceInterface("com.google.android.gms.location.internal.IGoogleLocationManagerService");
        zza(zzpb.zza.zzbj(paramParcel1.readStrongBinder()), paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 5:
        paramParcel1.enforceInterface("com.google.android.gms.location.internal.IGoogleLocationManagerService");
        long l = paramParcel1.readLong();
        int i1 = paramParcel1.readInt();
        boolean bool2 = false;
        if (i1 != 0)
          bool2 = true;
        if (paramParcel1.readInt() != 0);
        for (PendingIntent localPendingIntent7 = (PendingIntent)PendingIntent.CREATOR.createFromParcel(paramParcel1); ; localPendingIntent7 = null)
        {
          zza(l, bool2, localPendingIntent7);
          paramParcel2.writeNoException();
          return true;
        }
      case 6:
        paramParcel1.enforceInterface("com.google.android.gms.location.internal.IGoogleLocationManagerService");
        if (paramParcel1.readInt() != 0);
        for (PendingIntent localPendingIntent6 = (PendingIntent)PendingIntent.CREATOR.createFromParcel(paramParcel1); ; localPendingIntent6 = null)
        {
          zza(localPendingIntent6);
          paramParcel2.writeNoException();
          return true;
        }
      case 60:
        paramParcel1.enforceInterface("com.google.android.gms.location.internal.IGoogleLocationManagerService");
        zzb localzzb;
        if (paramParcel1.readInt() != 0)
        {
          localzzb = zzb.CREATOR.zzdo(paramParcel1);
          if (paramParcel1.readInt() == 0)
            break label699;
        }
        for (PendingIntent localPendingIntent5 = (PendingIntent)PendingIntent.CREATOR.createFromParcel(paramParcel1); ; localPendingIntent5 = null)
        {
          Status localStatus2 = zza(localzzb, localPendingIntent5);
          paramParcel2.writeNoException();
          if (localStatus2 == null)
            break label705;
          paramParcel2.writeInt(1);
          localStatus2.writeToParcel(paramParcel2, 1);
          return true;
          localzzb = null;
          break;
        }
        paramParcel2.writeInt(0);
        return true;
      case 61:
        paramParcel1.enforceInterface("com.google.android.gms.location.internal.IGoogleLocationManagerService");
        if (paramParcel1.readInt() != 0);
        for (PendingIntent localPendingIntent4 = (PendingIntent)PendingIntent.CREATOR.createFromParcel(paramParcel1); ; localPendingIntent4 = null)
        {
          Status localStatus1 = zzb(localPendingIntent4);
          paramParcel2.writeNoException();
          if (localStatus1 == null)
            break;
          paramParcel2.writeInt(1);
          localStatus1.writeToParcel(paramParcel2, 1);
          return true;
        }
        paramParcel2.writeInt(0);
        return true;
      case 7:
        paramParcel1.enforceInterface("com.google.android.gms.location.internal.IGoogleLocationManagerService");
        Location localLocation4 = zzpv();
        paramParcel2.writeNoException();
        if (localLocation4 != null)
        {
          paramParcel2.writeInt(1);
          localLocation4.writeToParcel(paramParcel2, 1);
          return true;
        }
        paramParcel2.writeInt(0);
        return true;
      case 8:
        paramParcel1.enforceInterface("com.google.android.gms.location.internal.IGoogleLocationManagerService");
        int n = paramParcel1.readInt();
        LocationRequest localLocationRequest3 = null;
        if (n != 0)
          localLocationRequest3 = LocationRequest.CREATOR.zzdp(paramParcel1);
        zza(localLocationRequest3, zzd.zza.zzbg(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 20:
        paramParcel1.enforceInterface("com.google.android.gms.location.internal.IGoogleLocationManagerService");
        int m = paramParcel1.readInt();
        LocationRequest localLocationRequest2 = null;
        if (m != 0)
          localLocationRequest2 = LocationRequest.CREATOR.zzdp(paramParcel1);
        zza(localLocationRequest2, zzd.zza.zzbg(paramParcel1.readStrongBinder()), paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 9:
        paramParcel1.enforceInterface("com.google.android.gms.location.internal.IGoogleLocationManagerService");
        LocationRequest localLocationRequest1;
        if (paramParcel1.readInt() != 0)
        {
          localLocationRequest1 = LocationRequest.CREATOR.zzdp(paramParcel1);
          if (paramParcel1.readInt() == 0)
            break label988;
        }
        for (PendingIntent localPendingIntent3 = (PendingIntent)PendingIntent.CREATOR.createFromParcel(paramParcel1); ; localPendingIntent3 = null)
        {
          zza(localLocationRequest1, localPendingIntent3);
          paramParcel2.writeNoException();
          return true;
          localLocationRequest1 = null;
          break;
        }
      case 52:
        paramParcel1.enforceInterface("com.google.android.gms.location.internal.IGoogleLocationManagerService");
        int k = paramParcel1.readInt();
        zzpg localzzpg2 = null;
        if (k != 0)
          localzzpg2 = zzpg.CREATOR.zzdv(paramParcel1);
        zza(localzzpg2, zzd.zza.zzbg(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 53:
        paramParcel1.enforceInterface("com.google.android.gms.location.internal.IGoogleLocationManagerService");
        zzpg localzzpg1;
        if (paramParcel1.readInt() != 0)
        {
          localzzpg1 = zzpg.CREATOR.zzdv(paramParcel1);
          if (paramParcel1.readInt() == 0)
            break label1105;
        }
        for (PendingIntent localPendingIntent2 = (PendingIntent)PendingIntent.CREATOR.createFromParcel(paramParcel1); ; localPendingIntent2 = null)
        {
          zza(localzzpg1, localPendingIntent2);
          paramParcel2.writeNoException();
          return true;
          localzzpg1 = null;
          break;
        }
      case 10:
        paramParcel1.enforceInterface("com.google.android.gms.location.internal.IGoogleLocationManagerService");
        zza(zzd.zza.zzbg(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 11:
        paramParcel1.enforceInterface("com.google.android.gms.location.internal.IGoogleLocationManagerService");
        if (paramParcel1.readInt() != 0);
        for (PendingIntent localPendingIntent1 = (PendingIntent)PendingIntent.CREATOR.createFromParcel(paramParcel1); ; localPendingIntent1 = null)
        {
          zzc(localPendingIntent1);
          paramParcel2.writeNoException();
          return true;
        }
      case 59:
        paramParcel1.enforceInterface("com.google.android.gms.location.internal.IGoogleLocationManagerService");
        int j = paramParcel1.readInt();
        zzpi localzzpi = null;
        if (j != 0)
          localzzpi = zzpi.CREATOR.zzdw(paramParcel1);
        zza(localzzpi);
        paramParcel2.writeNoException();
        return true;
      case 12:
        paramParcel1.enforceInterface("com.google.android.gms.location.internal.IGoogleLocationManagerService");
        int i = paramParcel1.readInt();
        boolean bool1 = false;
        if (i != 0)
          bool1 = true;
        zzW(bool1);
        paramParcel2.writeNoException();
        return true;
      case 13:
        paramParcel1.enforceInterface("com.google.android.gms.location.internal.IGoogleLocationManagerService");
        if (paramParcel1.readInt() != 0);
        for (Location localLocation3 = (Location)Location.CREATOR.createFromParcel(paramParcel1); ; localLocation3 = null)
        {
          zzb(localLocation3);
          paramParcel2.writeNoException();
          return true;
        }
      case 21:
        paramParcel1.enforceInterface("com.google.android.gms.location.internal.IGoogleLocationManagerService");
        Location localLocation2 = zzcj(paramParcel1.readString());
        paramParcel2.writeNoException();
        if (localLocation2 != null)
        {
          paramParcel2.writeInt(1);
          localLocation2.writeToParcel(paramParcel2, 1);
          return true;
        }
        paramParcel2.writeInt(0);
        return true;
      case 26:
        paramParcel1.enforceInterface("com.google.android.gms.location.internal.IGoogleLocationManagerService");
        if (paramParcel1.readInt() != 0);
        for (Location localLocation1 = (Location)Location.CREATOR.createFromParcel(paramParcel1); ; localLocation1 = null)
        {
          zza(localLocation1, paramParcel1.readInt());
          paramParcel2.writeNoException();
          return true;
        }
      case 34:
        paramParcel1.enforceInterface("com.google.android.gms.location.internal.IGoogleLocationManagerService");
        zzl localzzl = zzck(paramParcel1.readString());
        paramParcel2.writeNoException();
        if (localzzl != null)
        {
          paramParcel2.writeInt(1);
          localzzl.writeToParcel(paramParcel2, 1);
          return true;
        }
        paramParcel2.writeInt(0);
        return true;
      case 51:
        label380: paramParcel1.enforceInterface("com.google.android.gms.location.internal.IGoogleLocationManagerService");
        label699: label705: label988: IBinder localIBinder = zzpw();
        label1105: paramParcel2.writeNoException();
        paramParcel2.writeStrongBinder(localIBinder);
        return true;
      case 63:
      }
      paramParcel1.enforceInterface("com.google.android.gms.location.internal.IGoogleLocationManagerService");
      if (paramParcel1.readInt() != 0);
      for (LocationSettingsRequest localLocationSettingsRequest = (LocationSettingsRequest)LocationSettingsRequest.CREATOR.createFromParcel(paramParcel1); ; localLocationSettingsRequest = null)
      {
        zza(localLocationSettingsRequest, zzpd.zza.zzbl(paramParcel1.readStrongBinder()), paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      }
    }

    private static class zza
      implements zzpc
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

      public void zzW(boolean paramBoolean)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.location.internal.IGoogleLocationManagerService");
          int i = 0;
          if (paramBoolean)
            i = 1;
          localParcel1.writeInt(i);
          this.zzle.transact(12, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public Status zza(zzb paramzzb, PendingIntent paramPendingIntent)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.location.internal.IGoogleLocationManagerService");
            if (paramzzb != null)
            {
              localParcel1.writeInt(1);
              paramzzb.writeToParcel(localParcel1, 0);
              if (paramPendingIntent != null)
              {
                localParcel1.writeInt(1);
                paramPendingIntent.writeToParcel(localParcel1, 0);
                this.zzle.transact(60, localParcel1, localParcel2, 0);
                localParcel2.readException();
                if (localParcel2.readInt() == 0)
                  break label130;
                Status localStatus2 = Status.CREATOR.createFromParcel(localParcel2);
                localStatus1 = localStatus2;
                return localStatus1;
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
          label130: Status localStatus1 = null;
        }
      }

      public void zza(long paramLong, boolean paramBoolean, PendingIntent paramPendingIntent)
        throws RemoteException
      {
        int i = 1;
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.location.internal.IGoogleLocationManagerService");
          localParcel1.writeLong(paramLong);
          if (paramBoolean)
          {
            localParcel1.writeInt(i);
            if (paramPendingIntent == null)
              break label94;
            localParcel1.writeInt(1);
            paramPendingIntent.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(5, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            i = 0;
            break;
            label94: localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zza(PendingIntent paramPendingIntent)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.location.internal.IGoogleLocationManagerService");
          if (paramPendingIntent != null)
          {
            localParcel1.writeInt(1);
            paramPendingIntent.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(6, localParcel1, localParcel2, 0);
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

      public void zza(PendingIntent paramPendingIntent, zzpb paramzzpb, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.location.internal.IGoogleLocationManagerService");
            if (paramPendingIntent != null)
            {
              localParcel1.writeInt(1);
              paramPendingIntent.writeToParcel(localParcel1, 0);
              if (paramzzpb != null)
              {
                localIBinder = paramzzpb.asBinder();
                localParcel1.writeStrongBinder(localIBinder);
                localParcel1.writeString(paramString);
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
          IBinder localIBinder = null;
        }
      }

      public void zza(Location paramLocation, int paramInt)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.location.internal.IGoogleLocationManagerService");
          if (paramLocation != null)
          {
            localParcel1.writeInt(1);
            paramLocation.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            localParcel1.writeInt(paramInt);
            this.zzle.transact(26, localParcel1, localParcel2, 0);
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

      public void zza(zzpb paramzzpb, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.location.internal.IGoogleLocationManagerService");
          if (paramzzpb != null);
          for (IBinder localIBinder = paramzzpb.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
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

      public void zza(zzpg paramzzpg, PendingIntent paramPendingIntent)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.location.internal.IGoogleLocationManagerService");
            if (paramzzpg != null)
            {
              localParcel1.writeInt(1);
              paramzzpg.writeToParcel(localParcel1, 0);
              if (paramPendingIntent != null)
              {
                localParcel1.writeInt(1);
                paramPendingIntent.writeToParcel(localParcel1, 0);
                this.zzle.transact(53, localParcel1, localParcel2, 0);
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

      public void zza(zzpg paramzzpg, zzd paramzzd)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.location.internal.IGoogleLocationManagerService");
            if (paramzzpg != null)
            {
              localParcel1.writeInt(1);
              paramzzpg.writeToParcel(localParcel1, 0);
              if (paramzzd != null)
              {
                localIBinder = paramzzd.asBinder();
                localParcel1.writeStrongBinder(localIBinder);
                this.zzle.transact(52, localParcel1, localParcel2, 0);
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

      public void zza(zzpi paramzzpi)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.location.internal.IGoogleLocationManagerService");
          if (paramzzpi != null)
          {
            localParcel1.writeInt(1);
            paramzzpi.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(59, localParcel1, localParcel2, 0);
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

      public void zza(GeofencingRequest paramGeofencingRequest, PendingIntent paramPendingIntent, zzpb paramzzpb)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.location.internal.IGoogleLocationManagerService");
            if (paramGeofencingRequest != null)
            {
              localParcel1.writeInt(1);
              paramGeofencingRequest.writeToParcel(localParcel1, 0);
              if (paramPendingIntent != null)
              {
                localParcel1.writeInt(1);
                paramPendingIntent.writeToParcel(localParcel1, 0);
                if (paramzzpb == null)
                  break label136;
                localIBinder = paramzzpb.asBinder();
                localParcel1.writeStrongBinder(localIBinder);
                this.zzle.transact(57, localParcel1, localParcel2, 0);
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

      public void zza(LocationRequest paramLocationRequest, PendingIntent paramPendingIntent)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.location.internal.IGoogleLocationManagerService");
            if (paramLocationRequest != null)
            {
              localParcel1.writeInt(1);
              paramLocationRequest.writeToParcel(localParcel1, 0);
              if (paramPendingIntent != null)
              {
                localParcel1.writeInt(1);
                paramPendingIntent.writeToParcel(localParcel1, 0);
                this.zzle.transact(9, localParcel1, localParcel2, 0);
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

      public void zza(LocationRequest paramLocationRequest, zzd paramzzd)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.location.internal.IGoogleLocationManagerService");
            if (paramLocationRequest != null)
            {
              localParcel1.writeInt(1);
              paramLocationRequest.writeToParcel(localParcel1, 0);
              if (paramzzd != null)
              {
                localIBinder = paramzzd.asBinder();
                localParcel1.writeStrongBinder(localIBinder);
                this.zzle.transact(8, localParcel1, localParcel2, 0);
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

      public void zza(LocationRequest paramLocationRequest, zzd paramzzd, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.location.internal.IGoogleLocationManagerService");
            if (paramLocationRequest != null)
            {
              localParcel1.writeInt(1);
              paramLocationRequest.writeToParcel(localParcel1, 0);
              if (paramzzd != null)
              {
                localIBinder = paramzzd.asBinder();
                localParcel1.writeStrongBinder(localIBinder);
                localParcel1.writeString(paramString);
                this.zzle.transact(20, localParcel1, localParcel2, 0);
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

      public void zza(LocationSettingsRequest paramLocationSettingsRequest, zzpd paramzzpd, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.location.internal.IGoogleLocationManagerService");
            if (paramLocationSettingsRequest != null)
            {
              localParcel1.writeInt(1);
              paramLocationSettingsRequest.writeToParcel(localParcel1, 0);
              if (paramzzpd != null)
              {
                localIBinder = paramzzpd.asBinder();
                localParcel1.writeStrongBinder(localIBinder);
                localParcel1.writeString(paramString);
                this.zzle.transact(63, localParcel1, localParcel2, 0);
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

      public void zza(zzd paramzzd)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.location.internal.IGoogleLocationManagerService");
          if (paramzzd != null);
          for (IBinder localIBinder = paramzzd.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.zzle.transact(10, localParcel1, localParcel2, 0);
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

      public void zza(List<zzpk> paramList, PendingIntent paramPendingIntent, zzpb paramzzpb, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.location.internal.IGoogleLocationManagerService");
            localParcel1.writeTypedList(paramList);
            if (paramPendingIntent != null)
            {
              localParcel1.writeInt(1);
              paramPendingIntent.writeToParcel(localParcel1, 0);
              if (paramzzpb != null)
              {
                localIBinder = paramzzpb.asBinder();
                localParcel1.writeStrongBinder(localIBinder);
                localParcel1.writeString(paramString);
                this.zzle.transact(1, localParcel1, localParcel2, 0);
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

      public void zza(String[] paramArrayOfString, zzpb paramzzpb, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.location.internal.IGoogleLocationManagerService");
          localParcel1.writeStringArray(paramArrayOfString);
          if (paramzzpb != null);
          for (IBinder localIBinder = paramzzpb.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
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

      public Status zzb(PendingIntent paramPendingIntent)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.location.internal.IGoogleLocationManagerService");
            if (paramPendingIntent != null)
            {
              localParcel1.writeInt(1);
              paramPendingIntent.writeToParcel(localParcel1, 0);
              this.zzle.transact(61, localParcel1, localParcel2, 0);
              localParcel2.readException();
              if (localParcel2.readInt() != 0)
              {
                Status localStatus2 = Status.CREATOR.createFromParcel(localParcel2);
                localStatus1 = localStatus2;
                return localStatus1;
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
          Status localStatus1 = null;
        }
      }

      public void zzb(Location paramLocation)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.location.internal.IGoogleLocationManagerService");
          if (paramLocation != null)
          {
            localParcel1.writeInt(1);
            paramLocation.writeToParcel(localParcel1, 0);
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

      public void zzc(PendingIntent paramPendingIntent)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.location.internal.IGoogleLocationManagerService");
          if (paramPendingIntent != null)
          {
            localParcel1.writeInt(1);
            paramPendingIntent.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(11, localParcel1, localParcel2, 0);
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

      public Location zzcj(String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.location.internal.IGoogleLocationManagerService");
          localParcel1.writeString(paramString);
          this.zzle.transact(21, localParcel1, localParcel2, 0);
          localParcel2.readException();
          if (localParcel2.readInt() != 0)
          {
            localLocation = (Location)Location.CREATOR.createFromParcel(localParcel2);
            return localLocation;
          }
          Location localLocation = null;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public zzl zzck(String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.location.internal.IGoogleLocationManagerService");
          localParcel1.writeString(paramString);
          this.zzle.transact(34, localParcel1, localParcel2, 0);
          localParcel2.readException();
          if (localParcel2.readInt() != 0)
          {
            zzl localzzl2 = zzl.CREATOR.zzdt(localParcel2);
            localzzl1 = localzzl2;
            return localzzl1;
          }
          zzl localzzl1 = null;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public Location zzpv()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.location.internal.IGoogleLocationManagerService");
          this.zzle.transact(7, localParcel1, localParcel2, 0);
          localParcel2.readException();
          if (localParcel2.readInt() != 0)
          {
            localLocation = (Location)Location.CREATOR.createFromParcel(localParcel2);
            return localLocation;
          }
          Location localLocation = null;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public IBinder zzpw()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.location.internal.IGoogleLocationManagerService");
          this.zzle.transact(51, localParcel1, localParcel2, 0);
          localParcel2.readException();
          IBinder localIBinder = localParcel2.readStrongBinder();
          return localIBinder;
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