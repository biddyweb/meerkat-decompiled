package com.google.android.gms.wearable.internal;

import android.content.IntentFilter;
import android.net.Uri;
import android.os.ParcelFileDescriptor;
import android.os.ParcelFileDescriptor.AutoCloseInputStream;
import android.os.RemoteException;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.wearable.Asset;
import com.google.android.gms.wearable.DataApi;
import com.google.android.gms.wearable.DataApi.DataItemResult;
import com.google.android.gms.wearable.DataApi.DataListener;
import com.google.android.gms.wearable.DataApi.DeleteDataItemsResult;
import com.google.android.gms.wearable.DataApi.GetFdForAssetResult;
import com.google.android.gms.wearable.DataItem;
import com.google.android.gms.wearable.DataItemAsset;
import com.google.android.gms.wearable.DataItemBuffer;
import com.google.android.gms.wearable.PutDataRequest;
import java.io.IOException;
import java.io.InputStream;

public final class zzi
  implements DataApi
{
  private PendingResult<Status> zza(GoogleApiClient paramGoogleApiClient, DataApi.DataListener paramDataListener, IntentFilter[] paramArrayOfIntentFilter)
  {
    return paramGoogleApiClient.zza(new zza(paramGoogleApiClient, paramDataListener, paramArrayOfIntentFilter, null));
  }

  private void zza(Asset paramAsset)
  {
    if (paramAsset == null)
      throw new IllegalArgumentException("asset is null");
    if (paramAsset.getDigest() == null)
      throw new IllegalArgumentException("invalid asset");
    if (paramAsset.getData() != null)
      throw new IllegalArgumentException("invalid asset");
  }

  public PendingResult<Status> addListener(GoogleApiClient paramGoogleApiClient, DataApi.DataListener paramDataListener)
  {
    return zza(paramGoogleApiClient, paramDataListener, null);
  }

  public PendingResult<DataApi.DeleteDataItemsResult> deleteDataItems(GoogleApiClient paramGoogleApiClient, final Uri paramUri)
  {
    return paramGoogleApiClient.zza(new zzg(paramGoogleApiClient)
    {
      protected void zza(zzbd paramAnonymouszzbd)
        throws RemoteException
      {
        paramAnonymouszzbd.zzc(this, paramUri);
      }

      protected DataApi.DeleteDataItemsResult zzaR(Status paramAnonymousStatus)
      {
        return new zzi.zzc(paramAnonymousStatus, 0);
      }
    });
  }

  public PendingResult<DataApi.DataItemResult> getDataItem(GoogleApiClient paramGoogleApiClient, final Uri paramUri)
  {
    return paramGoogleApiClient.zza(new zzg(paramGoogleApiClient)
    {
      protected void zza(zzbd paramAnonymouszzbd)
        throws RemoteException
      {
        paramAnonymouszzbd.zza(this, paramUri);
      }

      protected DataApi.DataItemResult zzaP(Status paramAnonymousStatus)
      {
        return new zzi.zzb(paramAnonymousStatus, null);
      }
    });
  }

  public PendingResult<DataItemBuffer> getDataItems(GoogleApiClient paramGoogleApiClient)
  {
    return paramGoogleApiClient.zza(new zzg(paramGoogleApiClient)
    {
      protected void zza(zzbd paramAnonymouszzbd)
        throws RemoteException
      {
        paramAnonymouszzbd.zzm(this);
      }

      protected DataItemBuffer zzaQ(Status paramAnonymousStatus)
      {
        return new DataItemBuffer(DataHolder.zzay(paramAnonymousStatus.getStatusCode()));
      }
    });
  }

  public PendingResult<DataItemBuffer> getDataItems(GoogleApiClient paramGoogleApiClient, final Uri paramUri)
  {
    return paramGoogleApiClient.zza(new zzg(paramGoogleApiClient)
    {
      protected void zza(zzbd paramAnonymouszzbd)
        throws RemoteException
      {
        paramAnonymouszzbd.zzb(this, paramUri);
      }

      protected DataItemBuffer zzaQ(Status paramAnonymousStatus)
      {
        return new DataItemBuffer(DataHolder.zzay(paramAnonymousStatus.getStatusCode()));
      }
    });
  }

  public PendingResult<DataApi.GetFdForAssetResult> getFdForAsset(GoogleApiClient paramGoogleApiClient, final Asset paramAsset)
  {
    zza(paramAsset);
    return paramGoogleApiClient.zza(new zzg(paramGoogleApiClient)
    {
      protected void zza(zzbd paramAnonymouszzbd)
        throws RemoteException
      {
        paramAnonymouszzbd.zza(this, paramAsset);
      }

      protected DataApi.GetFdForAssetResult zzaS(Status paramAnonymousStatus)
      {
        return new zzi.zzd(paramAnonymousStatus, null);
      }
    });
  }

  public PendingResult<DataApi.GetFdForAssetResult> getFdForAsset(GoogleApiClient paramGoogleApiClient, final DataItemAsset paramDataItemAsset)
  {
    return paramGoogleApiClient.zza(new zzg(paramGoogleApiClient)
    {
      protected void zza(zzbd paramAnonymouszzbd)
        throws RemoteException
      {
        paramAnonymouszzbd.zza(this, paramDataItemAsset);
      }

      protected DataApi.GetFdForAssetResult zzaS(Status paramAnonymousStatus)
      {
        return new zzi.zzd(paramAnonymousStatus, null);
      }
    });
  }

  public PendingResult<DataApi.DataItemResult> putDataItem(GoogleApiClient paramGoogleApiClient, final PutDataRequest paramPutDataRequest)
  {
    return paramGoogleApiClient.zza(new zzg(paramGoogleApiClient)
    {
      protected void zza(zzbd paramAnonymouszzbd)
        throws RemoteException
      {
        paramAnonymouszzbd.zza(this, paramPutDataRequest);
      }

      public DataApi.DataItemResult zzaP(Status paramAnonymousStatus)
      {
        return new zzi.zzb(paramAnonymousStatus, null);
      }
    });
  }

  public PendingResult<Status> removeListener(GoogleApiClient paramGoogleApiClient, final DataApi.DataListener paramDataListener)
  {
    return paramGoogleApiClient.zza(new zzg(paramGoogleApiClient)
    {
      protected void zza(zzbd paramAnonymouszzbd)
        throws RemoteException
      {
        paramAnonymouszzbd.zza(this, paramDataListener);
      }

      public Status zzb(Status paramAnonymousStatus)
      {
        return paramAnonymousStatus;
      }
    });
  }

  private static final class zza extends zzg<Status>
  {
    private DataApi.DataListener zzaGa;
    private IntentFilter[] zzaGb;

    private zza(GoogleApiClient paramGoogleApiClient, DataApi.DataListener paramDataListener, IntentFilter[] paramArrayOfIntentFilter)
    {
      super();
      this.zzaGa = paramDataListener;
      this.zzaGb = paramArrayOfIntentFilter;
    }

    protected void zza(zzbd paramzzbd)
      throws RemoteException
    {
      paramzzbd.zza(this, this.zzaGa, this.zzaGb);
      this.zzaGa = null;
      this.zzaGb = null;
    }

    public Status zzb(Status paramStatus)
    {
      this.zzaGa = null;
      this.zzaGb = null;
      return paramStatus;
    }
  }

  public static class zzb
    implements DataApi.DataItemResult
  {
    private final Status zzHb;
    private final DataItem zzaGc;

    public zzb(Status paramStatus, DataItem paramDataItem)
    {
      this.zzHb = paramStatus;
      this.zzaGc = paramDataItem;
    }

    public DataItem getDataItem()
    {
      return this.zzaGc;
    }

    public Status getStatus()
    {
      return this.zzHb;
    }
  }

  public static class zzc
    implements DataApi.DeleteDataItemsResult
  {
    private final Status zzHb;
    private final int zzaGd;

    public zzc(Status paramStatus, int paramInt)
    {
      this.zzHb = paramStatus;
      this.zzaGd = paramInt;
    }

    public int getNumDeleted()
    {
      return this.zzaGd;
    }

    public Status getStatus()
    {
      return this.zzHb;
    }
  }

  public static class zzd
    implements DataApi.GetFdForAssetResult
  {
    private volatile boolean mClosed = false;
    private final Status zzHb;
    private volatile ParcelFileDescriptor zzaGe;
    private volatile InputStream zzaGf;

    public zzd(Status paramStatus, ParcelFileDescriptor paramParcelFileDescriptor)
    {
      this.zzHb = paramStatus;
      this.zzaGe = paramParcelFileDescriptor;
    }

    public ParcelFileDescriptor getFd()
    {
      if (this.mClosed)
        throw new IllegalStateException("Cannot access the file descriptor after release().");
      return this.zzaGe;
    }

    public InputStream getInputStream()
    {
      if (this.mClosed)
        throw new IllegalStateException("Cannot access the input stream after release().");
      if (this.zzaGe == null)
        return null;
      if (this.zzaGf == null)
        this.zzaGf = new ParcelFileDescriptor.AutoCloseInputStream(this.zzaGe);
      return this.zzaGf;
    }

    public Status getStatus()
    {
      return this.zzHb;
    }

    public void release()
    {
      if (this.zzaGe == null)
        return;
      if (this.mClosed)
        throw new IllegalStateException("releasing an already released result.");
      try
      {
        if (this.zzaGf != null)
          this.zzaGf.close();
        while (true)
        {
          this.mClosed = true;
          this.zzaGe = null;
          this.zzaGf = null;
          return;
          this.zzaGe.close();
        }
      }
      catch (IOException localIOException)
      {
      }
    }
  }
}