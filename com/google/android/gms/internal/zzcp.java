package com.google.android.gms.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.dynamic.zzd;

public abstract interface zzcp extends IInterface
{
  public abstract String getBody()
    throws RemoteException;

  public abstract void recordImpression()
    throws RemoteException;

  public abstract zzd zzcD()
    throws RemoteException;

  public abstract String zzcE()
    throws RemoteException;

  public abstract String zzcw()
    throws RemoteException;

  public abstract zzd zzcx()
    throws RemoteException;

  public abstract String zzcz()
    throws RemoteException;

  public abstract void zzl(int paramInt)
    throws RemoteException;

  public static abstract class zza extends Binder
    implements zzcp
  {
    public zza()
    {
      attachInterface(this, "com.google.android.gms.ads.internal.formats.client.INativeContentAd");
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
        paramParcel2.writeString("com.google.android.gms.ads.internal.formats.client.INativeContentAd");
        return true;
      case 1:
        paramParcel1.enforceInterface("com.google.android.gms.ads.internal.formats.client.INativeContentAd");
        zzl(paramParcel1.readInt());
        paramParcel2.writeNoException();
        return true;
      case 2:
        paramParcel1.enforceInterface("com.google.android.gms.ads.internal.formats.client.INativeContentAd");
        recordImpression();
        paramParcel2.writeNoException();
        return true;
      case 3:
        paramParcel1.enforceInterface("com.google.android.gms.ads.internal.formats.client.INativeContentAd");
        String str4 = zzcw();
        paramParcel2.writeNoException();
        paramParcel2.writeString(str4);
        return true;
      case 4:
        paramParcel1.enforceInterface("com.google.android.gms.ads.internal.formats.client.INativeContentAd");
        zzd localzzd2 = zzcx();
        paramParcel2.writeNoException();
        IBinder localIBinder2 = null;
        if (localzzd2 != null)
          localIBinder2 = localzzd2.asBinder();
        paramParcel2.writeStrongBinder(localIBinder2);
        return true;
      case 5:
        paramParcel1.enforceInterface("com.google.android.gms.ads.internal.formats.client.INativeContentAd");
        String str3 = getBody();
        paramParcel2.writeNoException();
        paramParcel2.writeString(str3);
        return true;
      case 6:
        paramParcel1.enforceInterface("com.google.android.gms.ads.internal.formats.client.INativeContentAd");
        zzd localzzd1 = zzcD();
        paramParcel2.writeNoException();
        IBinder localIBinder1 = null;
        if (localzzd1 != null)
          localIBinder1 = localzzd1.asBinder();
        paramParcel2.writeStrongBinder(localIBinder1);
        return true;
      case 7:
        paramParcel1.enforceInterface("com.google.android.gms.ads.internal.formats.client.INativeContentAd");
        String str2 = zzcz();
        paramParcel2.writeNoException();
        paramParcel2.writeString(str2);
        return true;
      case 8:
      }
      paramParcel1.enforceInterface("com.google.android.gms.ads.internal.formats.client.INativeContentAd");
      String str1 = zzcE();
      paramParcel2.writeNoException();
      paramParcel2.writeString(str1);
      return true;
    }
  }
}