package com.google.android.gms.wearable.internal;

import android.net.Uri;
import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import android.os.RemoteException;
import com.google.android.gms.wearable.Asset;
import com.google.android.gms.wearable.PutDataRequest;

public abstract interface zzai extends IInterface
{
  public abstract void zza(zzag paramzzag)
    throws RemoteException;

  public abstract void zza(zzag paramzzag, int paramInt)
    throws RemoteException;

  public abstract void zza(zzag paramzzag, Uri paramUri)
    throws RemoteException;

  public abstract void zza(zzag paramzzag, Asset paramAsset)
    throws RemoteException;

  public abstract void zza(zzag paramzzag, PutDataRequest paramPutDataRequest)
    throws RemoteException;

  public abstract void zza(zzag paramzzag, zzau paramzzau)
    throws RemoteException;

  public abstract void zza(zzag paramzzag, zzb paramzzb)
    throws RemoteException;

  public abstract void zza(zzag paramzzag, zze paramzze)
    throws RemoteException;

  public abstract void zza(zzag paramzzag, com.google.android.gms.wearable.zze paramzze)
    throws RemoteException;

  public abstract void zza(zzag paramzzag, String paramString)
    throws RemoteException;

  public abstract void zza(zzag paramzzag, String paramString1, String paramString2, byte[] paramArrayOfByte)
    throws RemoteException;

  public abstract void zzb(zzag paramzzag)
    throws RemoteException;

  public abstract void zzb(zzag paramzzag, int paramInt)
    throws RemoteException;

  public abstract void zzb(zzag paramzzag, Uri paramUri)
    throws RemoteException;

  public abstract void zzb(zzag paramzzag, com.google.android.gms.wearable.zze paramzze)
    throws RemoteException;

  public abstract void zzb(zzag paramzzag, String paramString)
    throws RemoteException;

  public abstract void zzc(zzag paramzzag)
    throws RemoteException;

  public abstract void zzc(zzag paramzzag, Uri paramUri)
    throws RemoteException;

  public abstract void zzc(zzag paramzzag, String paramString)
    throws RemoteException;

  public abstract void zzd(zzag paramzzag)
    throws RemoteException;

  public abstract void zze(zzag paramzzag)
    throws RemoteException;

  public abstract void zzf(zzag paramzzag)
    throws RemoteException;

  public abstract void zzg(zzag paramzzag)
    throws RemoteException;

  public abstract void zzh(zzag paramzzag)
    throws RemoteException;

  public abstract void zzi(zzag paramzzag)
    throws RemoteException;

  public abstract void zzj(zzag paramzzag)
    throws RemoteException;

  public abstract void zzk(zzag paramzzag)
    throws RemoteException;

  public abstract void zzl(zzag paramzzag)
    throws RemoteException;

  public static abstract class zza extends Binder
    implements zzai
  {
    public static zzai zzcR(IBinder paramIBinder)
    {
      if (paramIBinder == null)
        return null;
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.wearable.internal.IWearableService");
      if ((localIInterface != null) && ((localIInterface instanceof zzai)))
        return (zzai)localIInterface;
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
        paramParcel2.writeString("com.google.android.gms.wearable.internal.IWearableService");
        return true;
      case 20:
        paramParcel1.enforceInterface("com.google.android.gms.wearable.internal.IWearableService");
        zzag localzzag10 = zzag.zza.zzcP(paramParcel1.readStrongBinder());
        int i5 = paramParcel1.readInt();
        com.google.android.gms.wearable.zze localzze2 = null;
        if (i5 != 0)
          localzze2 = (com.google.android.gms.wearable.zze)com.google.android.gms.wearable.zze.CREATOR.createFromParcel(paramParcel1);
        zza(localzzag10, localzze2);
        paramParcel2.writeNoException();
        return true;
      case 21:
        paramParcel1.enforceInterface("com.google.android.gms.wearable.internal.IWearableService");
        zza(zzag.zza.zzcP(paramParcel1.readStrongBinder()), paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 22:
        paramParcel1.enforceInterface("com.google.android.gms.wearable.internal.IWearableService");
        zza(zzag.zza.zzcP(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 23:
        paramParcel1.enforceInterface("com.google.android.gms.wearable.internal.IWearableService");
        zzb(zzag.zza.zzcP(paramParcel1.readStrongBinder()), paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 24:
        paramParcel1.enforceInterface("com.google.android.gms.wearable.internal.IWearableService");
        zzc(zzag.zza.zzcP(paramParcel1.readStrongBinder()), paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 6:
        paramParcel1.enforceInterface("com.google.android.gms.wearable.internal.IWearableService");
        zzag localzzag9 = zzag.zza.zzcP(paramParcel1.readStrongBinder());
        int i4 = paramParcel1.readInt();
        PutDataRequest localPutDataRequest = null;
        if (i4 != 0)
          localPutDataRequest = (PutDataRequest)PutDataRequest.CREATOR.createFromParcel(paramParcel1);
        zza(localzzag9, localPutDataRequest);
        paramParcel2.writeNoException();
        return true;
      case 7:
        paramParcel1.enforceInterface("com.google.android.gms.wearable.internal.IWearableService");
        zzag localzzag8 = zzag.zza.zzcP(paramParcel1.readStrongBinder());
        int i3 = paramParcel1.readInt();
        Uri localUri3 = null;
        if (i3 != 0)
          localUri3 = (Uri)Uri.CREATOR.createFromParcel(paramParcel1);
        zza(localzzag8, localUri3);
        paramParcel2.writeNoException();
        return true;
      case 8:
        paramParcel1.enforceInterface("com.google.android.gms.wearable.internal.IWearableService");
        zzb(zzag.zza.zzcP(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 9:
        paramParcel1.enforceInterface("com.google.android.gms.wearable.internal.IWearableService");
        zzag localzzag7 = zzag.zza.zzcP(paramParcel1.readStrongBinder());
        int i2 = paramParcel1.readInt();
        Uri localUri2 = null;
        if (i2 != 0)
          localUri2 = (Uri)Uri.CREATOR.createFromParcel(paramParcel1);
        zzb(localzzag7, localUri2);
        paramParcel2.writeNoException();
        return true;
      case 11:
        paramParcel1.enforceInterface("com.google.android.gms.wearable.internal.IWearableService");
        zzag localzzag6 = zzag.zza.zzcP(paramParcel1.readStrongBinder());
        int i1 = paramParcel1.readInt();
        Uri localUri1 = null;
        if (i1 != 0)
          localUri1 = (Uri)Uri.CREATOR.createFromParcel(paramParcel1);
        zzc(localzzag6, localUri1);
        paramParcel2.writeNoException();
        return true;
      case 12:
        paramParcel1.enforceInterface("com.google.android.gms.wearable.internal.IWearableService");
        zza(zzag.zza.zzcP(paramParcel1.readStrongBinder()), paramParcel1.readString(), paramParcel1.readString(), paramParcel1.createByteArray());
        paramParcel2.writeNoException();
        return true;
      case 13:
        paramParcel1.enforceInterface("com.google.android.gms.wearable.internal.IWearableService");
        zzag localzzag5 = zzag.zza.zzcP(paramParcel1.readStrongBinder());
        int n = paramParcel1.readInt();
        Asset localAsset = null;
        if (n != 0)
          localAsset = (Asset)Asset.CREATOR.createFromParcel(paramParcel1);
        zza(localzzag5, localAsset);
        paramParcel2.writeNoException();
        return true;
      case 14:
        paramParcel1.enforceInterface("com.google.android.gms.wearable.internal.IWearableService");
        zzc(zzag.zza.zzcP(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 15:
        paramParcel1.enforceInterface("com.google.android.gms.wearable.internal.IWearableService");
        zzd(zzag.zza.zzcP(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 16:
        paramParcel1.enforceInterface("com.google.android.gms.wearable.internal.IWearableService");
        zzag localzzag4 = zzag.zza.zzcP(paramParcel1.readStrongBinder());
        int m = paramParcel1.readInt();
        zzb localzzb = null;
        if (m != 0)
          localzzb = (zzb)zzb.CREATOR.createFromParcel(paramParcel1);
        zza(localzzag4, localzzb);
        paramParcel2.writeNoException();
        return true;
      case 17:
        paramParcel1.enforceInterface("com.google.android.gms.wearable.internal.IWearableService");
        zzag localzzag3 = zzag.zza.zzcP(paramParcel1.readStrongBinder());
        int k = paramParcel1.readInt();
        zzau localzzau = null;
        if (k != 0)
          localzzau = (zzau)zzau.CREATOR.createFromParcel(paramParcel1);
        zza(localzzag3, localzzau);
        paramParcel2.writeNoException();
        return true;
      case 18:
        paramParcel1.enforceInterface("com.google.android.gms.wearable.internal.IWearableService");
        zze(zzag.zza.zzcP(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 19:
        paramParcel1.enforceInterface("com.google.android.gms.wearable.internal.IWearableService");
        zzf(zzag.zza.zzcP(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 25:
        paramParcel1.enforceInterface("com.google.android.gms.wearable.internal.IWearableService");
        zzg(zzag.zza.zzcP(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 26:
        paramParcel1.enforceInterface("com.google.android.gms.wearable.internal.IWearableService");
        zzh(zzag.zza.zzcP(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 27:
        paramParcel1.enforceInterface("com.google.android.gms.wearable.internal.IWearableService");
        zzag localzzag2 = zzag.zza.zzcP(paramParcel1.readStrongBinder());
        int j = paramParcel1.readInt();
        zze localzze = null;
        if (j != 0)
          localzze = (zze)zze.CREATOR.createFromParcel(paramParcel1);
        zza(localzzag2, localzze);
        paramParcel2.writeNoException();
        return true;
      case 28:
        paramParcel1.enforceInterface("com.google.android.gms.wearable.internal.IWearableService");
        zza(zzag.zza.zzcP(paramParcel1.readStrongBinder()), paramParcel1.readInt());
        paramParcel2.writeNoException();
        return true;
      case 29:
        paramParcel1.enforceInterface("com.google.android.gms.wearable.internal.IWearableService");
        zzb(zzag.zza.zzcP(paramParcel1.readStrongBinder()), paramParcel1.readInt());
        paramParcel2.writeNoException();
        return true;
      case 30:
        paramParcel1.enforceInterface("com.google.android.gms.wearable.internal.IWearableService");
        zzi(zzag.zza.zzcP(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 2:
        paramParcel1.enforceInterface("com.google.android.gms.wearable.internal.IWearableService");
        zzag localzzag1 = zzag.zza.zzcP(paramParcel1.readStrongBinder());
        int i = paramParcel1.readInt();
        com.google.android.gms.wearable.zze localzze1 = null;
        if (i != 0)
          localzze1 = (com.google.android.gms.wearable.zze)com.google.android.gms.wearable.zze.CREATOR.createFromParcel(paramParcel1);
        zzb(localzzag1, localzze1);
        paramParcel2.writeNoException();
        return true;
      case 3:
        paramParcel1.enforceInterface("com.google.android.gms.wearable.internal.IWearableService");
        zzj(zzag.zza.zzcP(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 4:
        paramParcel1.enforceInterface("com.google.android.gms.wearable.internal.IWearableService");
        zzk(zzag.zza.zzcP(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 5:
      }
      paramParcel1.enforceInterface("com.google.android.gms.wearable.internal.IWearableService");
      zzl(zzag.zza.zzcP(paramParcel1.readStrongBinder()));
      paramParcel2.writeNoException();
      return true;
    }

    private static class zza
      implements zzai
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

      public void zza(zzag paramzzag)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.wearable.internal.IWearableService");
          if (paramzzag != null);
          for (IBinder localIBinder = paramzzag.asBinder(); ; localIBinder = null)
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

      public void zza(zzag paramzzag, int paramInt)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.wearable.internal.IWearableService");
          if (paramzzag != null);
          for (IBinder localIBinder = paramzzag.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeInt(paramInt);
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

      public void zza(zzag paramzzag, Uri paramUri)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.wearable.internal.IWearableService");
          IBinder localIBinder;
          if (paramzzag != null)
          {
            localIBinder = paramzzag.asBinder();
            localParcel1.writeStrongBinder(localIBinder);
            if (paramUri == null)
              break label85;
            localParcel1.writeInt(1);
            paramUri.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(7, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localIBinder = null;
            break;
            label85: localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zza(zzag paramzzag, Asset paramAsset)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.wearable.internal.IWearableService");
          IBinder localIBinder;
          if (paramzzag != null)
          {
            localIBinder = paramzzag.asBinder();
            localParcel1.writeStrongBinder(localIBinder);
            if (paramAsset == null)
              break label85;
            localParcel1.writeInt(1);
            paramAsset.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(13, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localIBinder = null;
            break;
            label85: localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zza(zzag paramzzag, PutDataRequest paramPutDataRequest)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.wearable.internal.IWearableService");
          IBinder localIBinder;
          if (paramzzag != null)
          {
            localIBinder = paramzzag.asBinder();
            localParcel1.writeStrongBinder(localIBinder);
            if (paramPutDataRequest == null)
              break label85;
            localParcel1.writeInt(1);
            paramPutDataRequest.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(6, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localIBinder = null;
            break;
            label85: localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zza(zzag paramzzag, zzau paramzzau)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.wearable.internal.IWearableService");
          IBinder localIBinder;
          if (paramzzag != null)
          {
            localIBinder = paramzzag.asBinder();
            localParcel1.writeStrongBinder(localIBinder);
            if (paramzzau == null)
              break label85;
            localParcel1.writeInt(1);
            paramzzau.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(17, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localIBinder = null;
            break;
            label85: localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zza(zzag paramzzag, zzb paramzzb)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.wearable.internal.IWearableService");
          IBinder localIBinder;
          if (paramzzag != null)
          {
            localIBinder = paramzzag.asBinder();
            localParcel1.writeStrongBinder(localIBinder);
            if (paramzzb == null)
              break label85;
            localParcel1.writeInt(1);
            paramzzb.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(16, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localIBinder = null;
            break;
            label85: localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zza(zzag paramzzag, zze paramzze)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.wearable.internal.IWearableService");
          IBinder localIBinder;
          if (paramzzag != null)
          {
            localIBinder = paramzzag.asBinder();
            localParcel1.writeStrongBinder(localIBinder);
            if (paramzze == null)
              break label85;
            localParcel1.writeInt(1);
            paramzze.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(27, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localIBinder = null;
            break;
            label85: localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zza(zzag paramzzag, com.google.android.gms.wearable.zze paramzze)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.wearable.internal.IWearableService");
          IBinder localIBinder;
          if (paramzzag != null)
          {
            localIBinder = paramzzag.asBinder();
            localParcel1.writeStrongBinder(localIBinder);
            if (paramzze == null)
              break label85;
            localParcel1.writeInt(1);
            paramzze.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(20, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localIBinder = null;
            break;
            label85: localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zza(zzag paramzzag, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.wearable.internal.IWearableService");
          if (paramzzag != null);
          for (IBinder localIBinder = paramzzag.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
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

      public void zza(zzag paramzzag, String paramString1, String paramString2, byte[] paramArrayOfByte)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.wearable.internal.IWearableService");
          if (paramzzag != null);
          for (IBinder localIBinder = paramzzag.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString1);
            localParcel1.writeString(paramString2);
            localParcel1.writeByteArray(paramArrayOfByte);
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

      public void zzb(zzag paramzzag)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.wearable.internal.IWearableService");
          if (paramzzag != null);
          for (IBinder localIBinder = paramzzag.asBinder(); ; localIBinder = null)
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

      public void zzb(zzag paramzzag, int paramInt)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.wearable.internal.IWearableService");
          if (paramzzag != null);
          for (IBinder localIBinder = paramzzag.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeInt(paramInt);
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

      public void zzb(zzag paramzzag, Uri paramUri)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.wearable.internal.IWearableService");
          IBinder localIBinder;
          if (paramzzag != null)
          {
            localIBinder = paramzzag.asBinder();
            localParcel1.writeStrongBinder(localIBinder);
            if (paramUri == null)
              break label85;
            localParcel1.writeInt(1);
            paramUri.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(9, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localIBinder = null;
            break;
            label85: localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzb(zzag paramzzag, com.google.android.gms.wearable.zze paramzze)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.wearable.internal.IWearableService");
          IBinder localIBinder;
          if (paramzzag != null)
          {
            localIBinder = paramzzag.asBinder();
            localParcel1.writeStrongBinder(localIBinder);
            if (paramzze == null)
              break label84;
            localParcel1.writeInt(1);
            paramzze.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(2, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localIBinder = null;
            break;
            label84: localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzb(zzag paramzzag, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.wearable.internal.IWearableService");
          if (paramzzag != null);
          for (IBinder localIBinder = paramzzag.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
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

      public void zzc(zzag paramzzag)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.wearable.internal.IWearableService");
          if (paramzzag != null);
          for (IBinder localIBinder = paramzzag.asBinder(); ; localIBinder = null)
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

      public void zzc(zzag paramzzag, Uri paramUri)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.wearable.internal.IWearableService");
          IBinder localIBinder;
          if (paramzzag != null)
          {
            localIBinder = paramzzag.asBinder();
            localParcel1.writeStrongBinder(localIBinder);
            if (paramUri == null)
              break label85;
            localParcel1.writeInt(1);
            paramUri.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(11, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localIBinder = null;
            break;
            label85: localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzc(zzag paramzzag, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.wearable.internal.IWearableService");
          if (paramzzag != null);
          for (IBinder localIBinder = paramzzag.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
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

      public void zzd(zzag paramzzag)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.wearable.internal.IWearableService");
          if (paramzzag != null);
          for (IBinder localIBinder = paramzzag.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
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

      public void zze(zzag paramzzag)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.wearable.internal.IWearableService");
          if (paramzzag != null);
          for (IBinder localIBinder = paramzzag.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.zzle.transact(18, localParcel1, localParcel2, 0);
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

      public void zzf(zzag paramzzag)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.wearable.internal.IWearableService");
          if (paramzzag != null);
          for (IBinder localIBinder = paramzzag.asBinder(); ; localIBinder = null)
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

      public void zzg(zzag paramzzag)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.wearable.internal.IWearableService");
          if (paramzzag != null);
          for (IBinder localIBinder = paramzzag.asBinder(); ; localIBinder = null)
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

      public void zzh(zzag paramzzag)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.wearable.internal.IWearableService");
          if (paramzzag != null);
          for (IBinder localIBinder = paramzzag.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.zzle.transact(26, localParcel1, localParcel2, 0);
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

      public void zzi(zzag paramzzag)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.wearable.internal.IWearableService");
          if (paramzzag != null);
          for (IBinder localIBinder = paramzzag.asBinder(); ; localIBinder = null)
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

      public void zzj(zzag paramzzag)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.wearable.internal.IWearableService");
          if (paramzzag != null);
          for (IBinder localIBinder = paramzzag.asBinder(); ; localIBinder = null)
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

      public void zzk(zzag paramzzag)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.wearable.internal.IWearableService");
          if (paramzzag != null);
          for (IBinder localIBinder = paramzzag.asBinder(); ; localIBinder = null)
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

      public void zzl(zzag paramzzag)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.wearable.internal.IWearableService");
          if (paramzzag != null);
          for (IBinder localIBinder = paramzzag.asBinder(); ; localIBinder = null)
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
    }
  }
}