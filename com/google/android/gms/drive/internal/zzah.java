package com.google.android.gms.drive.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import android.os.RemoteException;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.StatusCreator;
import com.google.android.gms.drive.ChangeSequenceNumber;
import com.google.android.gms.drive.execution.internal.ContentTransferInfoResponse;
import com.google.android.gms.drive.realtime.internal.zzm;
import com.google.android.gms.drive.realtime.internal.zzm.zza;

public abstract interface zzah extends IInterface
{
  public abstract void onSuccess()
    throws RemoteException;

  public abstract void zzQ(boolean paramBoolean)
    throws RemoteException;

  public abstract void zza(ChangeSequenceNumber paramChangeSequenceNumber)
    throws RemoteException;

  public abstract void zza(ContentTransferInfoResponse paramContentTransferInfoResponse)
    throws RemoteException;

  public abstract void zza(OnChangesResponse paramOnChangesResponse)
    throws RemoteException;

  public abstract void zza(OnContentsResponse paramOnContentsResponse)
    throws RemoteException;

  public abstract void zza(OnDeviceUsagePreferenceResponse paramOnDeviceUsagePreferenceResponse)
    throws RemoteException;

  public abstract void zza(OnDownloadProgressResponse paramOnDownloadProgressResponse)
    throws RemoteException;

  public abstract void zza(OnDriveIdResponse paramOnDriveIdResponse)
    throws RemoteException;

  public abstract void zza(OnDrivePreferencesResponse paramOnDrivePreferencesResponse)
    throws RemoteException;

  public abstract void zza(OnFetchThumbnailResponse paramOnFetchThumbnailResponse)
    throws RemoteException;

  public abstract void zza(OnListEntriesResponse paramOnListEntriesResponse)
    throws RemoteException;

  public abstract void zza(OnListParentsResponse paramOnListParentsResponse)
    throws RemoteException;

  public abstract void zza(OnLoadRealtimeResponse paramOnLoadRealtimeResponse, zzm paramzzm)
    throws RemoteException;

  public abstract void zza(OnMetadataResponse paramOnMetadataResponse)
    throws RemoteException;

  public abstract void zza(OnResourceIdSetResponse paramOnResourceIdSetResponse)
    throws RemoteException;

  public abstract void zza(OnStorageStatsResponse paramOnStorageStatsResponse)
    throws RemoteException;

  public abstract void zza(OnSyncMoreResponse paramOnSyncMoreResponse)
    throws RemoteException;

  public abstract void zzm(Status paramStatus)
    throws RemoteException;

  public static abstract class zza extends Binder
    implements zzah
  {
    public zza()
    {
      attachInterface(this, "com.google.android.gms.drive.internal.IDriveServiceCallbacks");
    }

    public static zzah zzad(IBinder paramIBinder)
    {
      if (paramIBinder == null)
        return null;
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.drive.internal.IDriveServiceCallbacks");
      if ((localIInterface != null) && ((localIInterface instanceof zzah)))
        return (zzah)localIInterface;
      return new zza(paramIBinder);
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
        paramParcel2.writeString("com.google.android.gms.drive.internal.IDriveServiceCallbacks");
        return true;
      case 1:
        paramParcel1.enforceInterface("com.google.android.gms.drive.internal.IDriveServiceCallbacks");
        int i12 = paramParcel1.readInt();
        OnDownloadProgressResponse localOnDownloadProgressResponse = null;
        if (i12 != 0)
          localOnDownloadProgressResponse = (OnDownloadProgressResponse)OnDownloadProgressResponse.CREATOR.createFromParcel(paramParcel1);
        zza(localOnDownloadProgressResponse);
        paramParcel2.writeNoException();
        return true;
      case 2:
        paramParcel1.enforceInterface("com.google.android.gms.drive.internal.IDriveServiceCallbacks");
        int i11 = paramParcel1.readInt();
        OnListEntriesResponse localOnListEntriesResponse = null;
        if (i11 != 0)
          localOnListEntriesResponse = (OnListEntriesResponse)OnListEntriesResponse.CREATOR.createFromParcel(paramParcel1);
        zza(localOnListEntriesResponse);
        paramParcel2.writeNoException();
        return true;
      case 3:
        paramParcel1.enforceInterface("com.google.android.gms.drive.internal.IDriveServiceCallbacks");
        int i10 = paramParcel1.readInt();
        OnDriveIdResponse localOnDriveIdResponse = null;
        if (i10 != 0)
          localOnDriveIdResponse = (OnDriveIdResponse)OnDriveIdResponse.CREATOR.createFromParcel(paramParcel1);
        zza(localOnDriveIdResponse);
        paramParcel2.writeNoException();
        return true;
      case 4:
        paramParcel1.enforceInterface("com.google.android.gms.drive.internal.IDriveServiceCallbacks");
        int i9 = paramParcel1.readInt();
        OnMetadataResponse localOnMetadataResponse = null;
        if (i9 != 0)
          localOnMetadataResponse = (OnMetadataResponse)OnMetadataResponse.CREATOR.createFromParcel(paramParcel1);
        zza(localOnMetadataResponse);
        paramParcel2.writeNoException();
        return true;
      case 5:
        paramParcel1.enforceInterface("com.google.android.gms.drive.internal.IDriveServiceCallbacks");
        int i8 = paramParcel1.readInt();
        OnContentsResponse localOnContentsResponse = null;
        if (i8 != 0)
          localOnContentsResponse = (OnContentsResponse)OnContentsResponse.CREATOR.createFromParcel(paramParcel1);
        zza(localOnContentsResponse);
        paramParcel2.writeNoException();
        return true;
      case 6:
        paramParcel1.enforceInterface("com.google.android.gms.drive.internal.IDriveServiceCallbacks");
        int i7 = paramParcel1.readInt();
        Status localStatus = null;
        if (i7 != 0)
          localStatus = Status.CREATOR.createFromParcel(paramParcel1);
        zzm(localStatus);
        paramParcel2.writeNoException();
        return true;
      case 7:
        paramParcel1.enforceInterface("com.google.android.gms.drive.internal.IDriveServiceCallbacks");
        onSuccess();
        paramParcel2.writeNoException();
        return true;
      case 8:
        paramParcel1.enforceInterface("com.google.android.gms.drive.internal.IDriveServiceCallbacks");
        int i6 = paramParcel1.readInt();
        OnListParentsResponse localOnListParentsResponse = null;
        if (i6 != 0)
          localOnListParentsResponse = (OnListParentsResponse)OnListParentsResponse.CREATOR.createFromParcel(paramParcel1);
        zza(localOnListParentsResponse);
        paramParcel2.writeNoException();
        return true;
      case 9:
        paramParcel1.enforceInterface("com.google.android.gms.drive.internal.IDriveServiceCallbacks");
        int i5 = paramParcel1.readInt();
        OnSyncMoreResponse localOnSyncMoreResponse = null;
        if (i5 != 0)
          localOnSyncMoreResponse = (OnSyncMoreResponse)OnSyncMoreResponse.CREATOR.createFromParcel(paramParcel1);
        zza(localOnSyncMoreResponse);
        paramParcel2.writeNoException();
        return true;
      case 10:
        paramParcel1.enforceInterface("com.google.android.gms.drive.internal.IDriveServiceCallbacks");
        int i4 = paramParcel1.readInt();
        OnStorageStatsResponse localOnStorageStatsResponse = null;
        if (i4 != 0)
          localOnStorageStatsResponse = (OnStorageStatsResponse)OnStorageStatsResponse.CREATOR.createFromParcel(paramParcel1);
        zza(localOnStorageStatsResponse);
        paramParcel2.writeNoException();
        return true;
      case 11:
        paramParcel1.enforceInterface("com.google.android.gms.drive.internal.IDriveServiceCallbacks");
        int i3 = paramParcel1.readInt();
        OnLoadRealtimeResponse localOnLoadRealtimeResponse = null;
        if (i3 != 0)
          localOnLoadRealtimeResponse = (OnLoadRealtimeResponse)OnLoadRealtimeResponse.CREATOR.createFromParcel(paramParcel1);
        zza(localOnLoadRealtimeResponse, zzm.zza.zzaq(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 12:
        paramParcel1.enforceInterface("com.google.android.gms.drive.internal.IDriveServiceCallbacks");
        int i2 = paramParcel1.readInt();
        OnResourceIdSetResponse localOnResourceIdSetResponse = null;
        if (i2 != 0)
          localOnResourceIdSetResponse = (OnResourceIdSetResponse)OnResourceIdSetResponse.CREATOR.createFromParcel(paramParcel1);
        zza(localOnResourceIdSetResponse);
        paramParcel2.writeNoException();
        return true;
      case 13:
        paramParcel1.enforceInterface("com.google.android.gms.drive.internal.IDriveServiceCallbacks");
        int i1 = paramParcel1.readInt();
        OnDrivePreferencesResponse localOnDrivePreferencesResponse = null;
        if (i1 != 0)
          localOnDrivePreferencesResponse = (OnDrivePreferencesResponse)OnDrivePreferencesResponse.CREATOR.createFromParcel(paramParcel1);
        zza(localOnDrivePreferencesResponse);
        paramParcel2.writeNoException();
        return true;
      case 14:
        paramParcel1.enforceInterface("com.google.android.gms.drive.internal.IDriveServiceCallbacks");
        int n = paramParcel1.readInt();
        OnDeviceUsagePreferenceResponse localOnDeviceUsagePreferenceResponse = null;
        if (n != 0)
          localOnDeviceUsagePreferenceResponse = (OnDeviceUsagePreferenceResponse)OnDeviceUsagePreferenceResponse.CREATOR.createFromParcel(paramParcel1);
        zza(localOnDeviceUsagePreferenceResponse);
        paramParcel2.writeNoException();
        return true;
      case 15:
        paramParcel1.enforceInterface("com.google.android.gms.drive.internal.IDriveServiceCallbacks");
        if (paramParcel1.readInt() != 0);
        for (boolean bool = true; ; bool = false)
        {
          zzQ(bool);
          paramParcel2.writeNoException();
          return true;
        }
      case 16:
        paramParcel1.enforceInterface("com.google.android.gms.drive.internal.IDriveServiceCallbacks");
        int m = paramParcel1.readInt();
        OnFetchThumbnailResponse localOnFetchThumbnailResponse = null;
        if (m != 0)
          localOnFetchThumbnailResponse = (OnFetchThumbnailResponse)OnFetchThumbnailResponse.CREATOR.createFromParcel(paramParcel1);
        zza(localOnFetchThumbnailResponse);
        paramParcel2.writeNoException();
        return true;
      case 17:
        paramParcel1.enforceInterface("com.google.android.gms.drive.internal.IDriveServiceCallbacks");
        int k = paramParcel1.readInt();
        ChangeSequenceNumber localChangeSequenceNumber = null;
        if (k != 0)
          localChangeSequenceNumber = (ChangeSequenceNumber)ChangeSequenceNumber.CREATOR.createFromParcel(paramParcel1);
        zza(localChangeSequenceNumber);
        paramParcel2.writeNoException();
        return true;
      case 18:
        paramParcel1.enforceInterface("com.google.android.gms.drive.internal.IDriveServiceCallbacks");
        int j = paramParcel1.readInt();
        OnChangesResponse localOnChangesResponse = null;
        if (j != 0)
          localOnChangesResponse = (OnChangesResponse)OnChangesResponse.CREATOR.createFromParcel(paramParcel1);
        zza(localOnChangesResponse);
        paramParcel2.writeNoException();
        return true;
      case 19:
      }
      paramParcel1.enforceInterface("com.google.android.gms.drive.internal.IDriveServiceCallbacks");
      int i = paramParcel1.readInt();
      ContentTransferInfoResponse localContentTransferInfoResponse = null;
      if (i != 0)
        localContentTransferInfoResponse = (ContentTransferInfoResponse)ContentTransferInfoResponse.CREATOR.createFromParcel(paramParcel1);
      zza(localContentTransferInfoResponse);
      paramParcel2.writeNoException();
      return true;
    }

    private static class zza
      implements zzah
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

      public void onSuccess()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.drive.internal.IDriveServiceCallbacks");
          this.zzle.transact(7, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzQ(boolean paramBoolean)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.drive.internal.IDriveServiceCallbacks");
          int i = 0;
          if (paramBoolean)
            i = 1;
          localParcel1.writeInt(i);
          this.zzle.transact(15, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zza(ChangeSequenceNumber paramChangeSequenceNumber)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.drive.internal.IDriveServiceCallbacks");
          if (paramChangeSequenceNumber != null)
          {
            localParcel1.writeInt(1);
            paramChangeSequenceNumber.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(17, localParcel1, localParcel2, 0);
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

      public void zza(ContentTransferInfoResponse paramContentTransferInfoResponse)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.drive.internal.IDriveServiceCallbacks");
          if (paramContentTransferInfoResponse != null)
          {
            localParcel1.writeInt(1);
            paramContentTransferInfoResponse.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(19, localParcel1, localParcel2, 0);
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

      public void zza(OnChangesResponse paramOnChangesResponse)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.drive.internal.IDriveServiceCallbacks");
          if (paramOnChangesResponse != null)
          {
            localParcel1.writeInt(1);
            paramOnChangesResponse.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(18, localParcel1, localParcel2, 0);
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

      public void zza(OnContentsResponse paramOnContentsResponse)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.drive.internal.IDriveServiceCallbacks");
          if (paramOnContentsResponse != null)
          {
            localParcel1.writeInt(1);
            paramOnContentsResponse.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(5, localParcel1, localParcel2, 0);
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

      public void zza(OnDeviceUsagePreferenceResponse paramOnDeviceUsagePreferenceResponse)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.drive.internal.IDriveServiceCallbacks");
          if (paramOnDeviceUsagePreferenceResponse != null)
          {
            localParcel1.writeInt(1);
            paramOnDeviceUsagePreferenceResponse.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(14, localParcel1, localParcel2, 0);
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

      public void zza(OnDownloadProgressResponse paramOnDownloadProgressResponse)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.drive.internal.IDriveServiceCallbacks");
          if (paramOnDownloadProgressResponse != null)
          {
            localParcel1.writeInt(1);
            paramOnDownloadProgressResponse.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(1, localParcel1, localParcel2, 0);
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

      public void zza(OnDriveIdResponse paramOnDriveIdResponse)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.drive.internal.IDriveServiceCallbacks");
          if (paramOnDriveIdResponse != null)
          {
            localParcel1.writeInt(1);
            paramOnDriveIdResponse.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(3, localParcel1, localParcel2, 0);
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

      public void zza(OnDrivePreferencesResponse paramOnDrivePreferencesResponse)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.drive.internal.IDriveServiceCallbacks");
          if (paramOnDrivePreferencesResponse != null)
          {
            localParcel1.writeInt(1);
            paramOnDrivePreferencesResponse.writeToParcel(localParcel1, 0);
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

      public void zza(OnFetchThumbnailResponse paramOnFetchThumbnailResponse)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.drive.internal.IDriveServiceCallbacks");
          if (paramOnFetchThumbnailResponse != null)
          {
            localParcel1.writeInt(1);
            paramOnFetchThumbnailResponse.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(16, localParcel1, localParcel2, 0);
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

      public void zza(OnListEntriesResponse paramOnListEntriesResponse)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.drive.internal.IDriveServiceCallbacks");
          if (paramOnListEntriesResponse != null)
          {
            localParcel1.writeInt(1);
            paramOnListEntriesResponse.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(2, localParcel1, localParcel2, 0);
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

      public void zza(OnListParentsResponse paramOnListParentsResponse)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.drive.internal.IDriveServiceCallbacks");
          if (paramOnListParentsResponse != null)
          {
            localParcel1.writeInt(1);
            paramOnListParentsResponse.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(8, localParcel1, localParcel2, 0);
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

      public void zza(OnLoadRealtimeResponse paramOnLoadRealtimeResponse, zzm paramzzm)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.drive.internal.IDriveServiceCallbacks");
            if (paramOnLoadRealtimeResponse != null)
            {
              localParcel1.writeInt(1);
              paramOnLoadRealtimeResponse.writeToParcel(localParcel1, 0);
              if (paramzzm != null)
              {
                localIBinder = paramzzm.asBinder();
                localParcel1.writeStrongBinder(localIBinder);
                this.zzle.transact(11, localParcel1, localParcel2, 0);
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

      public void zza(OnMetadataResponse paramOnMetadataResponse)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.drive.internal.IDriveServiceCallbacks");
          if (paramOnMetadataResponse != null)
          {
            localParcel1.writeInt(1);
            paramOnMetadataResponse.writeToParcel(localParcel1, 0);
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

      public void zza(OnResourceIdSetResponse paramOnResourceIdSetResponse)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.drive.internal.IDriveServiceCallbacks");
          if (paramOnResourceIdSetResponse != null)
          {
            localParcel1.writeInt(1);
            paramOnResourceIdSetResponse.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(12, localParcel1, localParcel2, 0);
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

      public void zza(OnStorageStatsResponse paramOnStorageStatsResponse)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.drive.internal.IDriveServiceCallbacks");
          if (paramOnStorageStatsResponse != null)
          {
            localParcel1.writeInt(1);
            paramOnStorageStatsResponse.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(10, localParcel1, localParcel2, 0);
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

      public void zza(OnSyncMoreResponse paramOnSyncMoreResponse)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.drive.internal.IDriveServiceCallbacks");
          if (paramOnSyncMoreResponse != null)
          {
            localParcel1.writeInt(1);
            paramOnSyncMoreResponse.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(9, localParcel1, localParcel2, 0);
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

      public void zzm(Status paramStatus)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.drive.internal.IDriveServiceCallbacks");
          if (paramStatus != null)
          {
            localParcel1.writeInt(1);
            paramStatus.writeToParcel(localParcel1, 0);
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
    }
  }
}