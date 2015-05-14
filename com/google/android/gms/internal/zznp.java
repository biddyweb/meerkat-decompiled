package com.google.android.gms.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import android.os.RemoteException;
import com.google.android.gms.fitness.request.SessionInsertRequest;
import com.google.android.gms.fitness.request.SessionReadRequest;
import com.google.android.gms.fitness.request.zzai;
import com.google.android.gms.fitness.request.zzak;
import com.google.android.gms.fitness.request.zzam;
import com.google.android.gms.fitness.request.zzao;

public abstract interface zznp extends IInterface
{
  public abstract void zza(SessionInsertRequest paramSessionInsertRequest)
    throws RemoteException;

  public abstract void zza(SessionReadRequest paramSessionReadRequest)
    throws RemoteException;

  public abstract void zza(zzai paramzzai)
    throws RemoteException;

  public abstract void zza(zzak paramzzak)
    throws RemoteException;

  public abstract void zza(zzam paramzzam)
    throws RemoteException;

  public abstract void zza(zzao paramzzao)
    throws RemoteException;

  public static abstract class zza extends Binder
    implements zznp
  {
    public static zznp zzaM(IBinder paramIBinder)
    {
      if (paramIBinder == null)
        return null;
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.fitness.internal.IGoogleFitSessionsApi");
      if ((localIInterface != null) && ((localIInterface instanceof zznp)))
        return (zznp)localIInterface;
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
        paramParcel2.writeString("com.google.android.gms.fitness.internal.IGoogleFitSessionsApi");
        return true;
      case 1:
        paramParcel1.enforceInterface("com.google.android.gms.fitness.internal.IGoogleFitSessionsApi");
        int i1 = paramParcel1.readInt();
        zzak localzzak = null;
        if (i1 != 0)
          localzzak = (zzak)zzak.CREATOR.createFromParcel(paramParcel1);
        zza(localzzak);
        return true;
      case 2:
        paramParcel1.enforceInterface("com.google.android.gms.fitness.internal.IGoogleFitSessionsApi");
        int n = paramParcel1.readInt();
        zzam localzzam = null;
        if (n != 0)
          localzzam = (zzam)zzam.CREATOR.createFromParcel(paramParcel1);
        zza(localzzam);
        return true;
      case 3:
        paramParcel1.enforceInterface("com.google.android.gms.fitness.internal.IGoogleFitSessionsApi");
        int m = paramParcel1.readInt();
        SessionInsertRequest localSessionInsertRequest = null;
        if (m != 0)
          localSessionInsertRequest = (SessionInsertRequest)SessionInsertRequest.CREATOR.createFromParcel(paramParcel1);
        zza(localSessionInsertRequest);
        return true;
      case 4:
        paramParcel1.enforceInterface("com.google.android.gms.fitness.internal.IGoogleFitSessionsApi");
        int k = paramParcel1.readInt();
        SessionReadRequest localSessionReadRequest = null;
        if (k != 0)
          localSessionReadRequest = (SessionReadRequest)SessionReadRequest.CREATOR.createFromParcel(paramParcel1);
        zza(localSessionReadRequest);
        return true;
      case 5:
        paramParcel1.enforceInterface("com.google.android.gms.fitness.internal.IGoogleFitSessionsApi");
        int j = paramParcel1.readInt();
        zzai localzzai = null;
        if (j != 0)
          localzzai = (zzai)zzai.CREATOR.createFromParcel(paramParcel1);
        zza(localzzai);
        return true;
      case 6:
      }
      paramParcel1.enforceInterface("com.google.android.gms.fitness.internal.IGoogleFitSessionsApi");
      int i = paramParcel1.readInt();
      zzao localzzao = null;
      if (i != 0)
        localzzao = (zzao)zzao.CREATOR.createFromParcel(paramParcel1);
      zza(localzzao);
      return true;
    }

    private static class zza
      implements zznp
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

      public void zza(SessionInsertRequest paramSessionInsertRequest)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.fitness.internal.IGoogleFitSessionsApi");
          if (paramSessionInsertRequest != null)
          {
            localParcel.writeInt(1);
            paramSessionInsertRequest.writeToParcel(localParcel, 0);
          }
          while (true)
          {
            this.zzle.transact(3, localParcel, null, 1);
            return;
            localParcel.writeInt(0);
          }
        }
        finally
        {
          localParcel.recycle();
        }
      }

      public void zza(SessionReadRequest paramSessionReadRequest)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.fitness.internal.IGoogleFitSessionsApi");
          if (paramSessionReadRequest != null)
          {
            localParcel.writeInt(1);
            paramSessionReadRequest.writeToParcel(localParcel, 0);
          }
          while (true)
          {
            this.zzle.transact(4, localParcel, null, 1);
            return;
            localParcel.writeInt(0);
          }
        }
        finally
        {
          localParcel.recycle();
        }
      }

      public void zza(zzai paramzzai)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.fitness.internal.IGoogleFitSessionsApi");
          if (paramzzai != null)
          {
            localParcel.writeInt(1);
            paramzzai.writeToParcel(localParcel, 0);
          }
          while (true)
          {
            this.zzle.transact(5, localParcel, null, 1);
            return;
            localParcel.writeInt(0);
          }
        }
        finally
        {
          localParcel.recycle();
        }
      }

      public void zza(zzak paramzzak)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.fitness.internal.IGoogleFitSessionsApi");
          if (paramzzak != null)
          {
            localParcel.writeInt(1);
            paramzzak.writeToParcel(localParcel, 0);
          }
          while (true)
          {
            this.zzle.transact(1, localParcel, null, 1);
            return;
            localParcel.writeInt(0);
          }
        }
        finally
        {
          localParcel.recycle();
        }
      }

      public void zza(zzam paramzzam)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.fitness.internal.IGoogleFitSessionsApi");
          if (paramzzam != null)
          {
            localParcel.writeInt(1);
            paramzzam.writeToParcel(localParcel, 0);
          }
          while (true)
          {
            this.zzle.transact(2, localParcel, null, 1);
            return;
            localParcel.writeInt(0);
          }
        }
        finally
        {
          localParcel.recycle();
        }
      }

      public void zza(zzao paramzzao)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.fitness.internal.IGoogleFitSessionsApi");
          if (paramzzao != null)
          {
            localParcel.writeInt(1);
            paramzzao.writeToParcel(localParcel, 0);
          }
          while (true)
          {
            this.zzle.transact(6, localParcel, null, 1);
            return;
            localParcel.writeInt(0);
          }
        }
        finally
        {
          localParcel.recycle();
        }
      }
    }
  }
}