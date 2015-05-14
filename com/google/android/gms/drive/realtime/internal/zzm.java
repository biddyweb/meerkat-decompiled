package com.google.android.gms.drive.realtime.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import android.os.RemoteException;
import com.google.android.gms.common.data.DataHolder;

public abstract interface zzm extends IInterface
{
  public abstract void zza(int paramInt, zzj paramzzj)
    throws RemoteException;

  public abstract void zza(BeginCompoundOperationRequest paramBeginCompoundOperationRequest, zzo paramzzo)
    throws RemoteException;

  public abstract void zza(EndCompoundOperationRequest paramEndCompoundOperationRequest, zzj paramzzj)
    throws RemoteException;

  public abstract void zza(EndCompoundOperationRequest paramEndCompoundOperationRequest, zzo paramzzo)
    throws RemoteException;

  public abstract void zza(ParcelableIndexReference paramParcelableIndexReference, zzn paramzzn)
    throws RemoteException;

  public abstract void zza(zzc paramzzc)
    throws RemoteException;

  public abstract void zza(zzd paramzzd)
    throws RemoteException;

  public abstract void zza(zze paramzze)
    throws RemoteException;

  public abstract void zza(zzh paramzzh)
    throws RemoteException;

  public abstract void zza(zzi paramzzi)
    throws RemoteException;

  public abstract void zza(zzj paramzzj)
    throws RemoteException;

  public abstract void zza(zzl paramzzl)
    throws RemoteException;

  public abstract void zza(zzo paramzzo)
    throws RemoteException;

  public abstract void zza(String paramString, int paramInt1, int paramInt2, zzg paramzzg)
    throws RemoteException;

  public abstract void zza(String paramString, int paramInt1, int paramInt2, zzj paramzzj)
    throws RemoteException;

  public abstract void zza(String paramString, int paramInt, DataHolder paramDataHolder, zzg paramzzg)
    throws RemoteException;

  public abstract void zza(String paramString, int paramInt, DataHolder paramDataHolder, zzj paramzzj)
    throws RemoteException;

  public abstract void zza(String paramString, int paramInt, zzo paramzzo)
    throws RemoteException;

  public abstract void zza(String paramString1, int paramInt1, String paramString2, int paramInt2, zzj paramzzj)
    throws RemoteException;

  public abstract void zza(String paramString1, int paramInt, String paramString2, zzj paramzzj)
    throws RemoteException;

  public abstract void zza(String paramString, DataHolder paramDataHolder, zzj paramzzj)
    throws RemoteException;

  public abstract void zza(String paramString, zzf paramzzf)
    throws RemoteException;

  public abstract void zza(String paramString, zzj paramzzj)
    throws RemoteException;

  public abstract void zza(String paramString, zzk paramzzk)
    throws RemoteException;

  public abstract void zza(String paramString, zzl paramzzl)
    throws RemoteException;

  public abstract void zza(String paramString, zzn paramzzn)
    throws RemoteException;

  public abstract void zza(String paramString, zzo paramzzo)
    throws RemoteException;

  public abstract void zza(String paramString1, String paramString2, DataHolder paramDataHolder, zzj paramzzj)
    throws RemoteException;

  public abstract void zza(String paramString1, String paramString2, zzf paramzzf)
    throws RemoteException;

  public abstract void zza(String paramString1, String paramString2, zzg paramzzg)
    throws RemoteException;

  public abstract void zza(String paramString1, String paramString2, zzj paramzzj)
    throws RemoteException;

  public abstract void zzb(zzc paramzzc)
    throws RemoteException;

  public abstract void zzb(zzj paramzzj)
    throws RemoteException;

  public abstract void zzb(zzl paramzzl)
    throws RemoteException;

  public abstract void zzb(zzo paramzzo)
    throws RemoteException;

  public abstract void zzb(String paramString, zzf paramzzf)
    throws RemoteException;

  public abstract void zzb(String paramString, zzl paramzzl)
    throws RemoteException;

  public abstract void zzb(String paramString, zzn paramzzn)
    throws RemoteException;

  public abstract void zzb(String paramString, zzo paramzzo)
    throws RemoteException;

  public abstract void zzb(String paramString1, String paramString2, zzf paramzzf)
    throws RemoteException;

  public abstract void zzc(zzc paramzzc)
    throws RemoteException;

  public abstract void zzc(String paramString, zzl paramzzl)
    throws RemoteException;

  public abstract void zzd(zzc paramzzc)
    throws RemoteException;

  public static abstract class zza extends Binder
    implements zzm
  {
    public static zzm zzaq(IBinder paramIBinder)
    {
      if (paramIBinder == null)
        return null;
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.drive.realtime.internal.IRealtimeService");
      if ((localIInterface != null) && ((localIInterface instanceof zzm)))
        return (zzm)localIInterface;
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
        paramParcel2.writeString("com.google.android.gms.drive.realtime.internal.IRealtimeService");
        return true;
      case 1:
        paramParcel1.enforceInterface("com.google.android.gms.drive.realtime.internal.IRealtimeService");
        zza(paramParcel1.readString(), zzn.zza.zzar(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 2:
        paramParcel1.enforceInterface("com.google.android.gms.drive.realtime.internal.IRealtimeService");
        zza(zzc.zza.zzag(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 3:
        paramParcel1.enforceInterface("com.google.android.gms.drive.realtime.internal.IRealtimeService");
        zza(zzo.zza.zzas(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 33:
        paramParcel1.enforceInterface("com.google.android.gms.drive.realtime.internal.IRealtimeService");
        zzb(zzc.zza.zzag(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 35:
        paramParcel1.enforceInterface("com.google.android.gms.drive.realtime.internal.IRealtimeService");
        zzb(zzo.zza.zzas(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 40:
        paramParcel1.enforceInterface("com.google.android.gms.drive.realtime.internal.IRealtimeService");
        zza(zzl.zza.zzap(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 4:
        paramParcel1.enforceInterface("com.google.android.gms.drive.realtime.internal.IRealtimeService");
        zza(paramParcel1.readString(), paramParcel1.readString(), zzf.zza.zzaj(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 5:
        paramParcel1.enforceInterface("com.google.android.gms.drive.realtime.internal.IRealtimeService");
        zza(paramParcel1.readString(), zzl.zza.zzap(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 6:
        paramParcel1.enforceInterface("com.google.android.gms.drive.realtime.internal.IRealtimeService");
        String str5 = paramParcel1.readString();
        int i5 = paramParcel1.readInt();
        DataHolder localDataHolder4 = null;
        if (i5 != 0)
          localDataHolder4 = DataHolder.CREATOR.zzA(paramParcel1);
        zza(str5, localDataHolder4, zzj.zza.zzan(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 7:
        paramParcel1.enforceInterface("com.google.android.gms.drive.realtime.internal.IRealtimeService");
        zza(paramParcel1.readString(), zzj.zza.zzan(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 20:
        paramParcel1.enforceInterface("com.google.android.gms.drive.realtime.internal.IRealtimeService");
        zza(paramParcel1.readString(), zzf.zza.zzaj(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 21:
        paramParcel1.enforceInterface("com.google.android.gms.drive.realtime.internal.IRealtimeService");
        zza(paramParcel1.readString(), paramParcel1.readString(), zzg.zza.zzak(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 8:
        paramParcel1.enforceInterface("com.google.android.gms.drive.realtime.internal.IRealtimeService");
        zzb(paramParcel1.readString(), zzl.zza.zzap(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 9:
        paramParcel1.enforceInterface("com.google.android.gms.drive.realtime.internal.IRealtimeService");
        zzb(paramParcel1.readString(), zzn.zza.zzar(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 10:
        paramParcel1.enforceInterface("com.google.android.gms.drive.realtime.internal.IRealtimeService");
        zza(paramParcel1.readString(), paramParcel1.readInt(), paramParcel1.readString(), zzj.zza.zzan(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 11:
        paramParcel1.enforceInterface("com.google.android.gms.drive.realtime.internal.IRealtimeService");
        zza(paramParcel1.readString(), paramParcel1.readInt(), paramParcel1.readInt(), zzj.zza.zzan(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 12:
        paramParcel1.enforceInterface("com.google.android.gms.drive.realtime.internal.IRealtimeService");
        zza(paramParcel1.readString(), paramParcel1.readString(), zzj.zza.zzan(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 13:
        paramParcel1.enforceInterface("com.google.android.gms.drive.realtime.internal.IRealtimeService");
        zzb(paramParcel1.readString(), zzf.zza.zzaj(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 14:
        paramParcel1.enforceInterface("com.google.android.gms.drive.realtime.internal.IRealtimeService");
        zzc(paramParcel1.readString(), zzl.zza.zzap(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 15:
        paramParcel1.enforceInterface("com.google.android.gms.drive.realtime.internal.IRealtimeService");
        String str4 = paramParcel1.readString();
        int i3 = paramParcel1.readInt();
        int i4 = paramParcel1.readInt();
        DataHolder localDataHolder3 = null;
        if (i4 != 0)
          localDataHolder3 = DataHolder.CREATOR.zzA(paramParcel1);
        zza(str4, i3, localDataHolder3, zzj.zza.zzan(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 16:
        paramParcel1.enforceInterface("com.google.android.gms.drive.realtime.internal.IRealtimeService");
        String str3 = paramParcel1.readString();
        int i1 = paramParcel1.readInt();
        int i2 = paramParcel1.readInt();
        DataHolder localDataHolder2 = null;
        if (i2 != 0)
          localDataHolder2 = DataHolder.CREATOR.zzA(paramParcel1);
        zza(str3, i1, localDataHolder2, zzg.zza.zzak(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 17:
        paramParcel1.enforceInterface("com.google.android.gms.drive.realtime.internal.IRealtimeService");
        zza(paramParcel1.readString(), paramParcel1.readInt(), paramParcel1.readInt(), zzg.zza.zzak(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 37:
        paramParcel1.enforceInterface("com.google.android.gms.drive.realtime.internal.IRealtimeService");
        zza(paramParcel1.readString(), paramParcel1.readInt(), paramParcel1.readString(), paramParcel1.readInt(), zzj.zza.zzan(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 18:
        paramParcel1.enforceInterface("com.google.android.gms.drive.realtime.internal.IRealtimeService");
        int n = paramParcel1.readInt();
        BeginCompoundOperationRequest localBeginCompoundOperationRequest = null;
        if (n != 0)
          localBeginCompoundOperationRequest = (BeginCompoundOperationRequest)BeginCompoundOperationRequest.CREATOR.createFromParcel(paramParcel1);
        zza(localBeginCompoundOperationRequest, zzo.zza.zzas(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 41:
        paramParcel1.enforceInterface("com.google.android.gms.drive.realtime.internal.IRealtimeService");
        int m = paramParcel1.readInt();
        EndCompoundOperationRequest localEndCompoundOperationRequest2 = null;
        if (m != 0)
          localEndCompoundOperationRequest2 = (EndCompoundOperationRequest)EndCompoundOperationRequest.CREATOR.createFromParcel(paramParcel1);
        zza(localEndCompoundOperationRequest2, zzj.zza.zzan(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 22:
        paramParcel1.enforceInterface("com.google.android.gms.drive.realtime.internal.IRealtimeService");
        zza(zzj.zza.zzan(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 23:
        paramParcel1.enforceInterface("com.google.android.gms.drive.realtime.internal.IRealtimeService");
        zzb(zzj.zza.zzan(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 24:
        paramParcel1.enforceInterface("com.google.android.gms.drive.realtime.internal.IRealtimeService");
        zzc(zzc.zza.zzag(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 25:
        paramParcel1.enforceInterface("com.google.android.gms.drive.realtime.internal.IRealtimeService");
        zzd(zzc.zza.zzag(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 26:
        paramParcel1.enforceInterface("com.google.android.gms.drive.realtime.internal.IRealtimeService");
        int k = paramParcel1.readInt();
        ParcelableIndexReference localParcelableIndexReference = null;
        if (k != 0)
          localParcelableIndexReference = (ParcelableIndexReference)ParcelableIndexReference.CREATOR.createFromParcel(paramParcel1);
        zza(localParcelableIndexReference, zzn.zza.zzar(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 27:
        paramParcel1.enforceInterface("com.google.android.gms.drive.realtime.internal.IRealtimeService");
        zza(paramParcel1.readString(), zzk.zza.zzao(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 28:
        paramParcel1.enforceInterface("com.google.android.gms.drive.realtime.internal.IRealtimeService");
        zza(paramParcel1.readString(), paramParcel1.readInt(), zzo.zza.zzas(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 29:
        paramParcel1.enforceInterface("com.google.android.gms.drive.realtime.internal.IRealtimeService");
        zzb(zzl.zza.zzap(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 30:
        paramParcel1.enforceInterface("com.google.android.gms.drive.realtime.internal.IRealtimeService");
        zza(paramParcel1.readInt(), zzj.zza.zzan(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 31:
        paramParcel1.enforceInterface("com.google.android.gms.drive.realtime.internal.IRealtimeService");
        zza(zze.zza.zzai(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 32:
        paramParcel1.enforceInterface("com.google.android.gms.drive.realtime.internal.IRealtimeService");
        zza(zzd.zza.zzah(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 34:
        paramParcel1.enforceInterface("com.google.android.gms.drive.realtime.internal.IRealtimeService");
        zza(zzi.zza.zzam(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 36:
        paramParcel1.enforceInterface("com.google.android.gms.drive.realtime.internal.IRealtimeService");
        zza(zzh.zza.zzal(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 38:
        paramParcel1.enforceInterface("com.google.android.gms.drive.realtime.internal.IRealtimeService");
        zza(paramParcel1.readString(), zzo.zza.zzas(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 39:
        paramParcel1.enforceInterface("com.google.android.gms.drive.realtime.internal.IRealtimeService");
        zzb(paramParcel1.readString(), zzo.zza.zzas(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 42:
        paramParcel1.enforceInterface("com.google.android.gms.drive.realtime.internal.IRealtimeService");
        zzb(paramParcel1.readString(), paramParcel1.readString(), zzf.zza.zzaj(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 43:
        paramParcel1.enforceInterface("com.google.android.gms.drive.realtime.internal.IRealtimeService");
        String str1 = paramParcel1.readString();
        String str2 = paramParcel1.readString();
        int j = paramParcel1.readInt();
        DataHolder localDataHolder1 = null;
        if (j != 0)
          localDataHolder1 = DataHolder.CREATOR.zzA(paramParcel1);
        zza(str1, str2, localDataHolder1, zzj.zza.zzan(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 19:
      }
      paramParcel1.enforceInterface("com.google.android.gms.drive.realtime.internal.IRealtimeService");
      int i = paramParcel1.readInt();
      EndCompoundOperationRequest localEndCompoundOperationRequest1 = null;
      if (i != 0)
        localEndCompoundOperationRequest1 = (EndCompoundOperationRequest)EndCompoundOperationRequest.CREATOR.createFromParcel(paramParcel1);
      zza(localEndCompoundOperationRequest1, zzo.zza.zzas(paramParcel1.readStrongBinder()));
      paramParcel2.writeNoException();
      return true;
    }

    private static class zza
      implements zzm
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

      public void zza(int paramInt, zzj paramzzj)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.drive.realtime.internal.IRealtimeService");
          localParcel1.writeInt(paramInt);
          if (paramzzj != null);
          for (IBinder localIBinder = paramzzj.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.zzle.transact(30, localParcel1, localParcel2, 0);
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

      public void zza(BeginCompoundOperationRequest paramBeginCompoundOperationRequest, zzo paramzzo)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.drive.realtime.internal.IRealtimeService");
            if (paramBeginCompoundOperationRequest != null)
            {
              localParcel1.writeInt(1);
              paramBeginCompoundOperationRequest.writeToParcel(localParcel1, 0);
              if (paramzzo != null)
              {
                localIBinder = paramzzo.asBinder();
                localParcel1.writeStrongBinder(localIBinder);
                this.zzle.transact(18, localParcel1, localParcel2, 0);
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

      public void zza(EndCompoundOperationRequest paramEndCompoundOperationRequest, zzj paramzzj)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.drive.realtime.internal.IRealtimeService");
            if (paramEndCompoundOperationRequest != null)
            {
              localParcel1.writeInt(1);
              paramEndCompoundOperationRequest.writeToParcel(localParcel1, 0);
              if (paramzzj != null)
              {
                localIBinder = paramzzj.asBinder();
                localParcel1.writeStrongBinder(localIBinder);
                this.zzle.transact(41, localParcel1, localParcel2, 0);
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

      public void zza(EndCompoundOperationRequest paramEndCompoundOperationRequest, zzo paramzzo)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.drive.realtime.internal.IRealtimeService");
            if (paramEndCompoundOperationRequest != null)
            {
              localParcel1.writeInt(1);
              paramEndCompoundOperationRequest.writeToParcel(localParcel1, 0);
              if (paramzzo != null)
              {
                localIBinder = paramzzo.asBinder();
                localParcel1.writeStrongBinder(localIBinder);
                this.zzle.transact(19, localParcel1, localParcel2, 0);
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

      public void zza(ParcelableIndexReference paramParcelableIndexReference, zzn paramzzn)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.drive.realtime.internal.IRealtimeService");
            if (paramParcelableIndexReference != null)
            {
              localParcel1.writeInt(1);
              paramParcelableIndexReference.writeToParcel(localParcel1, 0);
              if (paramzzn != null)
              {
                localIBinder = paramzzn.asBinder();
                localParcel1.writeStrongBinder(localIBinder);
                this.zzle.transact(26, localParcel1, localParcel2, 0);
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

      public void zza(zzc paramzzc)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.drive.realtime.internal.IRealtimeService");
          if (paramzzc != null);
          for (IBinder localIBinder = paramzzc.asBinder(); ; localIBinder = null)
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

      public void zza(zzd paramzzd)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.drive.realtime.internal.IRealtimeService");
          if (paramzzd != null);
          for (IBinder localIBinder = paramzzd.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.zzle.transact(32, localParcel1, localParcel2, 0);
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

      public void zza(zze paramzze)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.drive.realtime.internal.IRealtimeService");
          if (paramzze != null);
          for (IBinder localIBinder = paramzze.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.zzle.transact(31, localParcel1, localParcel2, 0);
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

      public void zza(zzh paramzzh)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.drive.realtime.internal.IRealtimeService");
          if (paramzzh != null);
          for (IBinder localIBinder = paramzzh.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.zzle.transact(36, localParcel1, localParcel2, 0);
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

      public void zza(zzi paramzzi)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.drive.realtime.internal.IRealtimeService");
          if (paramzzi != null);
          for (IBinder localIBinder = paramzzi.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.zzle.transact(34, localParcel1, localParcel2, 0);
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

      public void zza(zzj paramzzj)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.drive.realtime.internal.IRealtimeService");
          if (paramzzj != null);
          for (IBinder localIBinder = paramzzj.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.zzle.transact(22, localParcel1, localParcel2, 0);
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

      public void zza(zzl paramzzl)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.drive.realtime.internal.IRealtimeService");
          if (paramzzl != null);
          for (IBinder localIBinder = paramzzl.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.zzle.transact(40, localParcel1, localParcel2, 0);
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

      public void zza(zzo paramzzo)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.drive.realtime.internal.IRealtimeService");
          if (paramzzo != null);
          for (IBinder localIBinder = paramzzo.asBinder(); ; localIBinder = null)
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

      public void zza(String paramString, int paramInt1, int paramInt2, zzg paramzzg)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.drive.realtime.internal.IRealtimeService");
          localParcel1.writeString(paramString);
          localParcel1.writeInt(paramInt1);
          localParcel1.writeInt(paramInt2);
          if (paramzzg != null);
          for (IBinder localIBinder = paramzzg.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.zzle.transact(17, localParcel1, localParcel2, 0);
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

      public void zza(String paramString, int paramInt1, int paramInt2, zzj paramzzj)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.drive.realtime.internal.IRealtimeService");
          localParcel1.writeString(paramString);
          localParcel1.writeInt(paramInt1);
          localParcel1.writeInt(paramInt2);
          if (paramzzj != null);
          for (IBinder localIBinder = paramzzj.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.zzle.transact(11, localParcel1, localParcel2, 0);
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

      public void zza(String paramString, int paramInt, DataHolder paramDataHolder, zzg paramzzg)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.drive.realtime.internal.IRealtimeService");
            localParcel1.writeString(paramString);
            localParcel1.writeInt(paramInt);
            if (paramDataHolder != null)
            {
              localParcel1.writeInt(1);
              paramDataHolder.writeToParcel(localParcel1, 0);
              if (paramzzg != null)
              {
                localIBinder = paramzzg.asBinder();
                localParcel1.writeStrongBinder(localIBinder);
                this.zzle.transact(16, localParcel1, localParcel2, 0);
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

      public void zza(String paramString, int paramInt, DataHolder paramDataHolder, zzj paramzzj)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.drive.realtime.internal.IRealtimeService");
            localParcel1.writeString(paramString);
            localParcel1.writeInt(paramInt);
            if (paramDataHolder != null)
            {
              localParcel1.writeInt(1);
              paramDataHolder.writeToParcel(localParcel1, 0);
              if (paramzzj != null)
              {
                localIBinder = paramzzj.asBinder();
                localParcel1.writeStrongBinder(localIBinder);
                this.zzle.transact(15, localParcel1, localParcel2, 0);
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

      public void zza(String paramString, int paramInt, zzo paramzzo)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.drive.realtime.internal.IRealtimeService");
          localParcel1.writeString(paramString);
          localParcel1.writeInt(paramInt);
          if (paramzzo != null);
          for (IBinder localIBinder = paramzzo.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.zzle.transact(28, localParcel1, localParcel2, 0);
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

      public void zza(String paramString1, int paramInt1, String paramString2, int paramInt2, zzj paramzzj)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.drive.realtime.internal.IRealtimeService");
          localParcel1.writeString(paramString1);
          localParcel1.writeInt(paramInt1);
          localParcel1.writeString(paramString2);
          localParcel1.writeInt(paramInt2);
          if (paramzzj != null);
          for (IBinder localIBinder = paramzzj.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.zzle.transact(37, localParcel1, localParcel2, 0);
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

      public void zza(String paramString1, int paramInt, String paramString2, zzj paramzzj)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.drive.realtime.internal.IRealtimeService");
          localParcel1.writeString(paramString1);
          localParcel1.writeInt(paramInt);
          localParcel1.writeString(paramString2);
          if (paramzzj != null);
          for (IBinder localIBinder = paramzzj.asBinder(); ; localIBinder = null)
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

      public void zza(String paramString, DataHolder paramDataHolder, zzj paramzzj)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.drive.realtime.internal.IRealtimeService");
            localParcel1.writeString(paramString);
            if (paramDataHolder != null)
            {
              localParcel1.writeInt(1);
              paramDataHolder.writeToParcel(localParcel1, 0);
              if (paramzzj != null)
              {
                localIBinder = paramzzj.asBinder();
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
          IBinder localIBinder = null;
        }
      }

      public void zza(String paramString, zzf paramzzf)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.drive.realtime.internal.IRealtimeService");
          localParcel1.writeString(paramString);
          if (paramzzf != null);
          for (IBinder localIBinder = paramzzf.asBinder(); ; localIBinder = null)
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

      public void zza(String paramString, zzj paramzzj)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.drive.realtime.internal.IRealtimeService");
          localParcel1.writeString(paramString);
          if (paramzzj != null);
          for (IBinder localIBinder = paramzzj.asBinder(); ; localIBinder = null)
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

      public void zza(String paramString, zzk paramzzk)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.drive.realtime.internal.IRealtimeService");
          localParcel1.writeString(paramString);
          if (paramzzk != null);
          for (IBinder localIBinder = paramzzk.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.zzle.transact(27, localParcel1, localParcel2, 0);
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

      public void zza(String paramString, zzl paramzzl)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.drive.realtime.internal.IRealtimeService");
          localParcel1.writeString(paramString);
          if (paramzzl != null);
          for (IBinder localIBinder = paramzzl.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.zzle.transact(5, localParcel1, localParcel2, 0);
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

      public void zza(String paramString, zzn paramzzn)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.drive.realtime.internal.IRealtimeService");
          localParcel1.writeString(paramString);
          if (paramzzn != null);
          for (IBinder localIBinder = paramzzn.asBinder(); ; localIBinder = null)
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

      public void zza(String paramString, zzo paramzzo)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.drive.realtime.internal.IRealtimeService");
          localParcel1.writeString(paramString);
          if (paramzzo != null);
          for (IBinder localIBinder = paramzzo.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.zzle.transact(38, localParcel1, localParcel2, 0);
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

      public void zza(String paramString1, String paramString2, DataHolder paramDataHolder, zzj paramzzj)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.drive.realtime.internal.IRealtimeService");
            localParcel1.writeString(paramString1);
            localParcel1.writeString(paramString2);
            if (paramDataHolder != null)
            {
              localParcel1.writeInt(1);
              paramDataHolder.writeToParcel(localParcel1, 0);
              if (paramzzj != null)
              {
                localIBinder = paramzzj.asBinder();
                localParcel1.writeStrongBinder(localIBinder);
                this.zzle.transact(43, localParcel1, localParcel2, 0);
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

      public void zza(String paramString1, String paramString2, zzf paramzzf)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.drive.realtime.internal.IRealtimeService");
          localParcel1.writeString(paramString1);
          localParcel1.writeString(paramString2);
          if (paramzzf != null);
          for (IBinder localIBinder = paramzzf.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
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

      public void zza(String paramString1, String paramString2, zzg paramzzg)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.drive.realtime.internal.IRealtimeService");
          localParcel1.writeString(paramString1);
          localParcel1.writeString(paramString2);
          if (paramzzg != null);
          for (IBinder localIBinder = paramzzg.asBinder(); ; localIBinder = null)
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

      public void zza(String paramString1, String paramString2, zzj paramzzj)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.drive.realtime.internal.IRealtimeService");
          localParcel1.writeString(paramString1);
          localParcel1.writeString(paramString2);
          if (paramzzj != null);
          for (IBinder localIBinder = paramzzj.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.zzle.transact(12, localParcel1, localParcel2, 0);
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

      public void zzb(zzc paramzzc)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.drive.realtime.internal.IRealtimeService");
          if (paramzzc != null);
          for (IBinder localIBinder = paramzzc.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.zzle.transact(33, localParcel1, localParcel2, 0);
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

      public void zzb(zzj paramzzj)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.drive.realtime.internal.IRealtimeService");
          if (paramzzj != null);
          for (IBinder localIBinder = paramzzj.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.zzle.transact(23, localParcel1, localParcel2, 0);
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

      public void zzb(zzl paramzzl)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.drive.realtime.internal.IRealtimeService");
          if (paramzzl != null);
          for (IBinder localIBinder = paramzzl.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.zzle.transact(29, localParcel1, localParcel2, 0);
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

      public void zzb(zzo paramzzo)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.drive.realtime.internal.IRealtimeService");
          if (paramzzo != null);
          for (IBinder localIBinder = paramzzo.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.zzle.transact(35, localParcel1, localParcel2, 0);
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

      public void zzb(String paramString, zzf paramzzf)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.drive.realtime.internal.IRealtimeService");
          localParcel1.writeString(paramString);
          if (paramzzf != null);
          for (IBinder localIBinder = paramzzf.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.zzle.transact(13, localParcel1, localParcel2, 0);
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

      public void zzb(String paramString, zzl paramzzl)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.drive.realtime.internal.IRealtimeService");
          localParcel1.writeString(paramString);
          if (paramzzl != null);
          for (IBinder localIBinder = paramzzl.asBinder(); ; localIBinder = null)
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

      public void zzb(String paramString, zzn paramzzn)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.drive.realtime.internal.IRealtimeService");
          localParcel1.writeString(paramString);
          if (paramzzn != null);
          for (IBinder localIBinder = paramzzn.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.zzle.transact(9, localParcel1, localParcel2, 0);
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

      public void zzb(String paramString, zzo paramzzo)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.drive.realtime.internal.IRealtimeService");
          localParcel1.writeString(paramString);
          if (paramzzo != null);
          for (IBinder localIBinder = paramzzo.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.zzle.transact(39, localParcel1, localParcel2, 0);
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

      public void zzb(String paramString1, String paramString2, zzf paramzzf)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.drive.realtime.internal.IRealtimeService");
          localParcel1.writeString(paramString1);
          localParcel1.writeString(paramString2);
          if (paramzzf != null);
          for (IBinder localIBinder = paramzzf.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.zzle.transact(42, localParcel1, localParcel2, 0);
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

      public void zzc(zzc paramzzc)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.drive.realtime.internal.IRealtimeService");
          if (paramzzc != null);
          for (IBinder localIBinder = paramzzc.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.zzle.transact(24, localParcel1, localParcel2, 0);
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

      public void zzc(String paramString, zzl paramzzl)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.drive.realtime.internal.IRealtimeService");
          localParcel1.writeString(paramString);
          if (paramzzl != null);
          for (IBinder localIBinder = paramzzl.asBinder(); ; localIBinder = null)
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

      public void zzd(zzc paramzzc)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.drive.realtime.internal.IRealtimeService");
          if (paramzzc != null);
          for (IBinder localIBinder = paramzzc.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.zzle.transact(25, localParcel1, localParcel2, 0);
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