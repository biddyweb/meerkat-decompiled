package com.google.android.gms.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.dynamic.zzd;

public abstract interface zzco extends IInterface
{
  public abstract String getBody()
    throws RemoteException;

  public abstract void recordImpression()
    throws RemoteException;

  public abstract double zzcA()
    throws RemoteException;

  public abstract String zzcB()
    throws RemoteException;

  public abstract String zzcC()
    throws RemoteException;

  public abstract String zzcw()
    throws RemoteException;

  public abstract zzd zzcx()
    throws RemoteException;

  public abstract zzd zzcy()
    throws RemoteException;

  public abstract String zzcz()
    throws RemoteException;

  public abstract void zzl(int paramInt)
    throws RemoteException;

  public static abstract class zza extends Binder
    implements zzco
  {
    public zza()
    {
      attachInterface(this, "com.google.android.gms.ads.internal.formats.client.INativeAppInstallAd");
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
        paramParcel2.writeString("com.google.android.gms.ads.internal.formats.client.INativeAppInstallAd");
        return true;
      case 1:
        paramParcel1.enforceInterface("com.google.android.gms.ads.internal.formats.client.INativeAppInstallAd");
        zzl(paramParcel1.readInt());
        paramParcel2.writeNoException();
        return true;
      case 2:
        paramParcel1.enforceInterface("com.google.android.gms.ads.internal.formats.client.INativeAppInstallAd");
        recordImpression();
        paramParcel2.writeNoException();
        return true;
      case 3:
        paramParcel1.enforceInterface("com.google.android.gms.ads.internal.formats.client.INativeAppInstallAd");
        String str5 = zzcw();
        paramParcel2.writeNoException();
        paramParcel2.writeString(str5);
        return true;
      case 4:
        paramParcel1.enforceInterface("com.google.android.gms.ads.internal.formats.client.INativeAppInstallAd");
        zzd localzzd2 = zzcx();
        paramParcel2.writeNoException();
        IBinder localIBinder2 = null;
        if (localzzd2 != null)
          localIBinder2 = localzzd2.asBinder();
        paramParcel2.writeStrongBinder(localIBinder2);
        return true;
      case 5:
        paramParcel1.enforceInterface("com.google.android.gms.ads.internal.formats.client.INativeAppInstallAd");
        String str4 = getBody();
        paramParcel2.writeNoException();
        paramParcel2.writeString(str4);
        return true;
      case 6:
        paramParcel1.enforceInterface("com.google.android.gms.ads.internal.formats.client.INativeAppInstallAd");
        zzd localzzd1 = zzcy();
        paramParcel2.writeNoException();
        IBinder localIBinder1 = null;
        if (localzzd1 != null)
          localIBinder1 = localzzd1.asBinder();
        paramParcel2.writeStrongBinder(localIBinder1);
        return true;
      case 7:
        paramParcel1.enforceInterface("com.google.android.gms.ads.internal.formats.client.INativeAppInstallAd");
        String str3 = zzcz();
        paramParcel2.writeNoException();
        paramParcel2.writeString(str3);
        return true;
      case 8:
        paramParcel1.enforceInterface("com.google.android.gms.ads.internal.formats.client.INativeAppInstallAd");
        double d = zzcA();
        paramParcel2.writeNoException();
        paramParcel2.writeDouble(d);
        return true;
      case 9:
        paramParcel1.enforceInterface("com.google.android.gms.ads.internal.formats.client.INativeAppInstallAd");
        String str2 = zzcB();
        paramParcel2.writeNoException();
        paramParcel2.writeString(str2);
        return true;
      case 10:
      }
      paramParcel1.enforceInterface("com.google.android.gms.ads.internal.formats.client.INativeAppInstallAd");
      String str1 = zzcC();
      paramParcel2.writeNoException();
      paramParcel2.writeString(str1);
      return true;
    }
  }
}