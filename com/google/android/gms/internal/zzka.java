package com.google.android.gms.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import android.os.RemoteException;
import com.google.android.gms.cast.ApplicationMetadata;

public abstract interface zzka extends IInterface
{
  public abstract void onApplicationDisconnected(int paramInt)
    throws RemoteException;

  public abstract void zza(ApplicationMetadata paramApplicationMetadata, String paramString1, String paramString2, boolean paramBoolean)
    throws RemoteException;

  public abstract void zza(String paramString, double paramDouble, boolean paramBoolean)
    throws RemoteException;

  public abstract void zza(String paramString, long paramLong)
    throws RemoteException;

  public abstract void zza(String paramString, long paramLong, int paramInt)
    throws RemoteException;

  public abstract void zzai(int paramInt)
    throws RemoteException;

  public abstract void zzaj(int paramInt)
    throws RemoteException;

  public abstract void zzak(int paramInt)
    throws RemoteException;

  public abstract void zzal(int paramInt)
    throws RemoteException;

  public abstract void zzb(zzjp paramzzjp)
    throws RemoteException;

  public abstract void zzb(zzjw paramzzjw)
    throws RemoteException;

  public abstract void zzb(String paramString, byte[] paramArrayOfByte)
    throws RemoteException;

  public abstract void zzn(String paramString1, String paramString2)
    throws RemoteException;

  public static abstract class zza extends Binder
    implements zzka
  {
    public zza()
    {
      attachInterface(this, "com.google.android.gms.cast.internal.ICastDeviceControllerListener");
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
        paramParcel2.writeString("com.google.android.gms.cast.internal.ICastDeviceControllerListener");
        return true;
      case 1:
        paramParcel1.enforceInterface("com.google.android.gms.cast.internal.ICastDeviceControllerListener");
        zzai(paramParcel1.readInt());
        return true;
      case 2:
        paramParcel1.enforceInterface("com.google.android.gms.cast.internal.ICastDeviceControllerListener");
        int m = paramParcel1.readInt();
        ApplicationMetadata localApplicationMetadata = null;
        if (m != 0)
          localApplicationMetadata = (ApplicationMetadata)ApplicationMetadata.CREATOR.createFromParcel(paramParcel1);
        String str2 = paramParcel1.readString();
        String str3 = paramParcel1.readString();
        int n = paramParcel1.readInt();
        boolean bool2 = false;
        if (n != 0)
          bool2 = true;
        zza(localApplicationMetadata, str2, str3, bool2);
        return true;
      case 3:
        paramParcel1.enforceInterface("com.google.android.gms.cast.internal.ICastDeviceControllerListener");
        zzaj(paramParcel1.readInt());
        return true;
      case 4:
        paramParcel1.enforceInterface("com.google.android.gms.cast.internal.ICastDeviceControllerListener");
        String str1 = paramParcel1.readString();
        double d = paramParcel1.readDouble();
        int k = paramParcel1.readInt();
        boolean bool1 = false;
        if (k != 0)
          bool1 = true;
        zza(str1, d, bool1);
        return true;
      case 5:
        paramParcel1.enforceInterface("com.google.android.gms.cast.internal.ICastDeviceControllerListener");
        zzn(paramParcel1.readString(), paramParcel1.readString());
        return true;
      case 6:
        paramParcel1.enforceInterface("com.google.android.gms.cast.internal.ICastDeviceControllerListener");
        zzb(paramParcel1.readString(), paramParcel1.createByteArray());
        return true;
      case 7:
        paramParcel1.enforceInterface("com.google.android.gms.cast.internal.ICastDeviceControllerListener");
        zzal(paramParcel1.readInt());
        return true;
      case 8:
        paramParcel1.enforceInterface("com.google.android.gms.cast.internal.ICastDeviceControllerListener");
        zzak(paramParcel1.readInt());
        return true;
      case 9:
        paramParcel1.enforceInterface("com.google.android.gms.cast.internal.ICastDeviceControllerListener");
        onApplicationDisconnected(paramParcel1.readInt());
        return true;
      case 10:
        paramParcel1.enforceInterface("com.google.android.gms.cast.internal.ICastDeviceControllerListener");
        zza(paramParcel1.readString(), paramParcel1.readLong(), paramParcel1.readInt());
        return true;
      case 11:
        paramParcel1.enforceInterface("com.google.android.gms.cast.internal.ICastDeviceControllerListener");
        zza(paramParcel1.readString(), paramParcel1.readLong());
        return true;
      case 12:
        paramParcel1.enforceInterface("com.google.android.gms.cast.internal.ICastDeviceControllerListener");
        int j = paramParcel1.readInt();
        zzjp localzzjp = null;
        if (j != 0)
          localzzjp = (zzjp)zzjp.CREATOR.createFromParcel(paramParcel1);
        zzb(localzzjp);
        return true;
      case 13:
      }
      paramParcel1.enforceInterface("com.google.android.gms.cast.internal.ICastDeviceControllerListener");
      int i = paramParcel1.readInt();
      zzjw localzzjw = null;
      if (i != 0)
        localzzjw = (zzjw)zzjw.CREATOR.createFromParcel(paramParcel1);
      zzb(localzzjw);
      return true;
    }
  }
}