package com.google.android.gms.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import android.os.RemoteException;
import com.google.android.gms.fitness.service.FitnessSensorServiceRequest;

public abstract interface zzoo extends IInterface
{
  public abstract void zza(FitnessSensorServiceRequest paramFitnessSensorServiceRequest, zznv paramzznv)
    throws RemoteException;

  public abstract void zza(zzok paramzzok, zznh paramzznh)
    throws RemoteException;

  public abstract void zza(zzom paramzzom, zznv paramzznv)
    throws RemoteException;

  public static abstract class zza extends Binder
    implements zzoo
  {
    public zza()
    {
      attachInterface(this, "com.google.android.gms.fitness.internal.service.IFitnessSensorService");
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
        paramParcel2.writeString("com.google.android.gms.fitness.internal.service.IFitnessSensorService");
        return true;
      case 1:
        paramParcel1.enforceInterface("com.google.android.gms.fitness.internal.service.IFitnessSensorService");
        int k = paramParcel1.readInt();
        zzok localzzok = null;
        if (k != 0)
          localzzok = (zzok)zzok.CREATOR.createFromParcel(paramParcel1);
        zza(localzzok, zznh.zza.zzaE(paramParcel1.readStrongBinder()));
        return true;
      case 2:
        paramParcel1.enforceInterface("com.google.android.gms.fitness.internal.service.IFitnessSensorService");
        int j = paramParcel1.readInt();
        FitnessSensorServiceRequest localFitnessSensorServiceRequest = null;
        if (j != 0)
          localFitnessSensorServiceRequest = (FitnessSensorServiceRequest)FitnessSensorServiceRequest.CREATOR.createFromParcel(paramParcel1);
        zza(localFitnessSensorServiceRequest, zznv.zza.zzaS(paramParcel1.readStrongBinder()));
        return true;
      case 3:
      }
      paramParcel1.enforceInterface("com.google.android.gms.fitness.internal.service.IFitnessSensorService");
      int i = paramParcel1.readInt();
      zzom localzzom = null;
      if (i != 0)
        localzzom = (zzom)zzom.CREATOR.createFromParcel(paramParcel1);
      zza(localzzom, zznv.zza.zzaS(paramParcel1.readStrongBinder()));
      return true;
    }
  }
}