package com.google.android.gms.plus.internal;

import android.net.Uri;
import android.os.Binder;
import android.os.Bundle;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import android.os.RemoteException;
import com.google.android.gms.common.internal.ICancelToken;
import com.google.android.gms.common.internal.ICancelToken.zza;
import com.google.android.gms.internal.zzkw;
import com.google.android.gms.internal.zzkx;
import com.google.android.gms.internal.zzlk;
import com.google.android.gms.internal.zzll;
import java.util.List;

public abstract interface zzd extends IInterface
{
  public abstract String getAccountName()
    throws RemoteException;

  public abstract ICancelToken zza(zzb paramzzb, int paramInt1, int paramInt2, int paramInt3, String paramString)
    throws RemoteException;

  public abstract void zza(zzlk paramzzlk)
    throws RemoteException;

  public abstract void zza(zzb paramzzb)
    throws RemoteException;

  public abstract void zza(zzb paramzzb, int paramInt, String paramString1, Uri paramUri, String paramString2, String paramString3)
    throws RemoteException;

  public abstract void zza(zzb paramzzb, Uri paramUri, Bundle paramBundle)
    throws RemoteException;

  public abstract void zza(zzb paramzzb, zzlk paramzzlk)
    throws RemoteException;

  public abstract void zza(zzb paramzzb, String paramString)
    throws RemoteException;

  public abstract void zza(zzb paramzzb, String paramString1, String paramString2)
    throws RemoteException;

  public abstract void zza(zzb paramzzb, List<String> paramList)
    throws RemoteException;

  public abstract void zza(String paramString, zzkw paramzzkw1, zzkw paramzzkw2)
    throws RemoteException;

  public abstract void zzb(zzb paramzzb)
    throws RemoteException;

  public abstract void zzb(zzb paramzzb, String paramString)
    throws RemoteException;

  public abstract void zzc(zzb paramzzb, String paramString)
    throws RemoteException;

  public abstract void zzcE(String paramString)
    throws RemoteException;

  public abstract void zzd(zzb paramzzb, String paramString)
    throws RemoteException;

  public abstract void zze(zzb paramzzb, String paramString)
    throws RemoteException;

  public abstract void zzrK()
    throws RemoteException;

  public abstract String zzrL()
    throws RemoteException;

  public abstract boolean zzrM()
    throws RemoteException;

  public abstract String zzrN()
    throws RemoteException;

  public static abstract class zza extends Binder
    implements zzd
  {
    public static zzd zzcy(IBinder paramIBinder)
    {
      if (paramIBinder == null)
        return null;
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.plus.internal.IPlusService");
      if ((localIInterface != null) && ((localIInterface instanceof zzd)))
        return (zzd)localIInterface;
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
        paramParcel2.writeString("com.google.android.gms.plus.internal.IPlusService");
        return true;
      case 1:
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
        zza(zzb.zza.zzcw(paramParcel1.readStrongBinder()), paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 2:
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
        zza(zzb.zza.zzcw(paramParcel1.readStrongBinder()), paramParcel1.readString(), paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 3:
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
        zzb(zzb.zza.zzcw(paramParcel1.readStrongBinder()), paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 4:
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
        if (paramParcel1.readInt() != 0);
        for (zzlk localzzlk2 = zzlk.CREATOR.zzT(paramParcel1); ; localzzlk2 = null)
        {
          zza(localzzlk2);
          paramParcel2.writeNoException();
          return true;
        }
      case 5:
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
        String str5 = getAccountName();
        paramParcel2.writeNoException();
        paramParcel2.writeString(str5);
        return true;
      case 6:
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
        zzrK();
        paramParcel2.writeNoException();
        return true;
      case 8:
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
        zza(zzb.zza.zzcw(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 9:
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
        zzb localzzb3 = zzb.zza.zzcw(paramParcel1.readStrongBinder());
        Uri localUri2;
        if (paramParcel1.readInt() != 0)
        {
          localUri2 = (Uri)Uri.CREATOR.createFromParcel(paramParcel1);
          if (paramParcel1.readInt() == 0)
            break label473;
        }
        for (Bundle localBundle = (Bundle)Bundle.CREATOR.createFromParcel(paramParcel1); ; localBundle = null)
        {
          zza(localzzb3, localUri2, localBundle);
          paramParcel2.writeNoException();
          return true;
          localUri2 = null;
          break;
        }
      case 14:
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
        zzb localzzb2 = zzb.zza.zzcw(paramParcel1.readStrongBinder());
        int m = paramParcel1.readInt();
        String str4 = paramParcel1.readString();
        if (paramParcel1.readInt() != 0);
        for (Uri localUri1 = (Uri)Uri.CREATOR.createFromParcel(paramParcel1); ; localUri1 = null)
        {
          zza(localzzb2, m, str4, localUri1, paramParcel1.readString(), paramParcel1.readString());
          paramParcel2.writeNoException();
          return true;
        }
      case 16:
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
        ICancelToken localICancelToken = zza(zzb.zza.zzcw(paramParcel1.readStrongBinder()), paramParcel1.readInt(), paramParcel1.readInt(), paramParcel1.readInt(), paramParcel1.readString());
        paramParcel2.writeNoException();
        IBinder localIBinder = null;
        if (localICancelToken != null)
          localIBinder = localICancelToken.asBinder();
        paramParcel2.writeStrongBinder(localIBinder);
        return true;
      case 17:
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
        zzcE(paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 18:
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
        zzc(zzb.zza.zzcw(paramParcel1.readStrongBinder()), paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 19:
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
        zzb(zzb.zza.zzcw(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 34:
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
        zza(zzb.zza.zzcw(paramParcel1.readStrongBinder()), paramParcel1.createStringArrayList());
        paramParcel2.writeNoException();
        return true;
      case 40:
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
        zzd(zzb.zza.zzcw(paramParcel1.readStrongBinder()), paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 41:
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
        String str3 = zzrL();
        paramParcel2.writeNoException();
        paramParcel2.writeString(str3);
        return true;
      case 42:
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
        boolean bool = zzrM();
        paramParcel2.writeNoException();
        if (bool);
        for (int k = 1; ; k = 0)
        {
          paramParcel2.writeInt(k);
          return true;
        }
      case 43:
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
        String str2 = zzrN();
        paramParcel2.writeNoException();
        paramParcel2.writeString(str2);
        return true;
      case 44:
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
        zze(zzb.zza.zzcw(paramParcel1.readStrongBinder()), paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 45:
        label473: paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
        zzb localzzb1 = zzb.zza.zzcw(paramParcel1.readStrongBinder());
        int j = paramParcel1.readInt();
        zzlk localzzlk1 = null;
        if (j != 0)
          localzzlk1 = zzlk.CREATOR.zzT(paramParcel1);
        zza(localzzb1, localzzlk1);
        paramParcel2.writeNoException();
        return true;
      case 46:
      }
      paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
      String str1 = paramParcel1.readString();
      if (paramParcel1.readInt() != 0);
      for (zzkw localzzkw1 = zzkw.CREATOR.zzL(paramParcel1); ; localzzkw1 = null)
      {
        int i = paramParcel1.readInt();
        zzkw localzzkw2 = null;
        if (i != 0)
          localzzkw2 = zzkw.CREATOR.zzL(paramParcel1);
        zza(str1, localzzkw1, localzzkw2);
        paramParcel2.writeNoException();
        return true;
      }
    }

    private static class zza
      implements zzd
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

      public String getAccountName()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.plus.internal.IPlusService");
          this.zzle.transact(5, localParcel1, localParcel2, 0);
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

      public ICancelToken zza(zzb paramzzb, int paramInt1, int paramInt2, int paramInt3, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.plus.internal.IPlusService");
          if (paramzzb != null);
          for (IBinder localIBinder = paramzzb.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeInt(paramInt1);
            localParcel1.writeInt(paramInt2);
            localParcel1.writeInt(paramInt3);
            localParcel1.writeString(paramString);
            this.zzle.transact(16, localParcel1, localParcel2, 0);
            localParcel2.readException();
            ICancelToken localICancelToken = ICancelToken.zza.zzS(localParcel2.readStrongBinder());
            return localICancelToken;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zza(zzlk paramzzlk)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.plus.internal.IPlusService");
          if (paramzzlk != null)
          {
            localParcel1.writeInt(1);
            paramzzlk.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(4, localParcel1, localParcel2, 0);
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

      public void zza(zzb paramzzb)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.plus.internal.IPlusService");
          if (paramzzb != null);
          for (IBinder localIBinder = paramzzb.asBinder(); ; localIBinder = null)
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

      public void zza(zzb paramzzb, int paramInt, String paramString1, Uri paramUri, String paramString2, String paramString3)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.plus.internal.IPlusService");
          IBinder localIBinder;
          if (paramzzb != null)
          {
            localIBinder = paramzzb.asBinder();
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeInt(paramInt);
            localParcel1.writeString(paramString1);
            if (paramUri == null)
              break label120;
            localParcel1.writeInt(1);
            paramUri.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            localParcel1.writeString(paramString2);
            localParcel1.writeString(paramString3);
            this.zzle.transact(14, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localIBinder = null;
            break;
            label120: localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zza(zzb paramzzb, Uri paramUri, Bundle paramBundle)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.plus.internal.IPlusService");
            IBinder localIBinder;
            if (paramzzb != null)
            {
              localIBinder = paramzzb.asBinder();
              localParcel1.writeStrongBinder(localIBinder);
              if (paramUri != null)
              {
                localParcel1.writeInt(1);
                paramUri.writeToParcel(localParcel1, 0);
                if (paramBundle == null)
                  break label133;
                localParcel1.writeInt(1);
                paramBundle.writeToParcel(localParcel1, 0);
                this.zzle.transact(9, localParcel1, localParcel2, 0);
                localParcel2.readException();
              }
            }
            else
            {
              localIBinder = null;
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
          label133: localParcel1.writeInt(0);
        }
      }

      public void zza(zzb paramzzb, zzlk paramzzlk)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.plus.internal.IPlusService");
          IBinder localIBinder;
          if (paramzzb != null)
          {
            localIBinder = paramzzb.asBinder();
            localParcel1.writeStrongBinder(localIBinder);
            if (paramzzlk == null)
              break label85;
            localParcel1.writeInt(1);
            paramzzlk.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(45, localParcel1, localParcel2, 0);
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

      public void zza(zzb paramzzb, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.plus.internal.IPlusService");
          if (paramzzb != null);
          for (IBinder localIBinder = paramzzb.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
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

      public void zza(zzb paramzzb, String paramString1, String paramString2)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.plus.internal.IPlusService");
          if (paramzzb != null);
          for (IBinder localIBinder = paramzzb.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString1);
            localParcel1.writeString(paramString2);
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

      public void zza(zzb paramzzb, List<String> paramList)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.plus.internal.IPlusService");
          if (paramzzb != null);
          for (IBinder localIBinder = paramzzb.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeStringList(paramList);
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

      public void zza(String paramString, zzkw paramzzkw1, zzkw paramzzkw2)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.plus.internal.IPlusService");
            localParcel1.writeString(paramString);
            if (paramzzkw1 != null)
            {
              localParcel1.writeInt(1);
              paramzzkw1.writeToParcel(localParcel1, 0);
              if (paramzzkw2 != null)
              {
                localParcel1.writeInt(1);
                paramzzkw2.writeToParcel(localParcel1, 0);
                this.zzle.transact(46, localParcel1, localParcel2, 0);
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

      public void zzb(zzb paramzzb)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.plus.internal.IPlusService");
          if (paramzzb != null);
          for (IBinder localIBinder = paramzzb.asBinder(); ; localIBinder = null)
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

      public void zzb(zzb paramzzb, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.plus.internal.IPlusService");
          if (paramzzb != null);
          for (IBinder localIBinder = paramzzb.asBinder(); ; localIBinder = null)
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

      public void zzc(zzb paramzzb, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.plus.internal.IPlusService");
          if (paramzzb != null);
          for (IBinder localIBinder = paramzzb.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
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

      public void zzcE(String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.plus.internal.IPlusService");
          localParcel1.writeString(paramString);
          this.zzle.transact(17, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzd(zzb paramzzb, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.plus.internal.IPlusService");
          if (paramzzb != null);
          for (IBinder localIBinder = paramzzb.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
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

      public void zze(zzb paramzzb, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.plus.internal.IPlusService");
          if (paramzzb != null);
          for (IBinder localIBinder = paramzzb.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            this.zzle.transact(44, localParcel1, localParcel2, 0);
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

      public void zzrK()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.plus.internal.IPlusService");
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

      public String zzrL()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.plus.internal.IPlusService");
          this.zzle.transact(41, localParcel1, localParcel2, 0);
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

      public boolean zzrM()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.plus.internal.IPlusService");
          this.zzle.transact(42, localParcel1, localParcel2, 0);
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

      public String zzrN()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.plus.internal.IPlusService");
          this.zzle.transact(43, localParcel1, localParcel2, 0);
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
    }
  }
}