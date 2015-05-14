package com.google.android.gms.wearable.internal;

import android.content.Context;
import android.content.IntentFilter;
import android.net.Uri;
import android.os.Bundle;
import android.os.IBinder;
import android.os.Looper;
import android.os.ParcelFileDescriptor;
import android.os.RemoteException;
import android.util.Log;
import com.google.android.gms.common.api.GoogleApiClient.ConnectionCallbacks;
import com.google.android.gms.common.api.GoogleApiClient.OnConnectionFailedListener;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.zza.zzb;
import com.google.android.gms.common.internal.zzf;
import com.google.android.gms.common.internal.zzk;
import com.google.android.gms.wearable.Asset;
import com.google.android.gms.wearable.DataApi.DataItemResult;
import com.google.android.gms.wearable.DataApi.DataListener;
import com.google.android.gms.wearable.DataApi.DeleteDataItemsResult;
import com.google.android.gms.wearable.DataApi.GetFdForAssetResult;
import com.google.android.gms.wearable.DataItemAsset;
import com.google.android.gms.wearable.DataItemBuffer;
import com.google.android.gms.wearable.MessageApi.MessageListener;
import com.google.android.gms.wearable.MessageApi.SendMessageResult;
import com.google.android.gms.wearable.NodeApi.GetConnectedNodesResult;
import com.google.android.gms.wearable.NodeApi.GetLocalNodeResult;
import com.google.android.gms.wearable.NodeApi.NodeListener;
import com.google.android.gms.wearable.PutDataRequest;
import com.google.android.gms.wearable.zza.zza;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.FutureTask;

public class zzbd extends zzk<zzai>
{
  private final zzaj<zza.zza> zzaGG = new zzaj.zzb();
  private final zzaj<DataApi.DataListener> zzaGH = new zzaj.zzc();
  private final zzaj<MessageApi.MessageListener> zzaGI = new zzaj.zzd();
  private final zzaj<NodeApi.NodeListener> zzaGJ = new zzaj.zze();
  private final ExecutorService zzazT = Executors.newCachedThreadPool();

  public zzbd(Context paramContext, Looper paramLooper, GoogleApiClient.ConnectionCallbacks paramConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener paramOnConnectionFailedListener, zzf paramzzf)
  {
    super(paramContext, paramLooper, 14, paramConnectionCallbacks, paramOnConnectionFailedListener, paramzzf);
  }

  private FutureTask<Boolean> zza(final ParcelFileDescriptor paramParcelFileDescriptor, final byte[] paramArrayOfByte)
  {
    return new FutureTask(new Callable()
    {
      // ERROR //
      public Boolean zzvl()
      {
        // Byte code:
        //   0: ldc 41
        //   2: iconst_3
        //   3: invokestatic 47\011android/util/Log:isLoggable\011(Ljava/lang/String;I)Z
        //   6: ifeq +31 -> 37
        //   9: ldc 41
        //   11: new 49\011java/lang/StringBuilder
        //   14: dup
        //   15: invokespecial 50\011java/lang/StringBuilder:<init>\011()V
        //   18: ldc 52
        //   20: invokevirtual 56\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
        //   23: aload_0
        //   24: getfield 24\011com/google/android/gms/wearable/internal/zzbd$1:zzaGK\011Landroid/os/ParcelFileDescriptor;
        //   27: invokevirtual 59\011java/lang/StringBuilder:append\011(Ljava/lang/Object;)Ljava/lang/StringBuilder;
        //   30: invokevirtual 63\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
        //   33: invokestatic 67\011android/util/Log:d\011(Ljava/lang/String;Ljava/lang/String;)I
        //   36: pop
        //   37: new 69\011android/os/ParcelFileDescriptor$AutoCloseOutputStream
        //   40: dup
        //   41: aload_0
        //   42: getfield 24\011com/google/android/gms/wearable/internal/zzbd$1:zzaGK\011Landroid/os/ParcelFileDescriptor;
        //   45: invokespecial 72\011android/os/ParcelFileDescriptor$AutoCloseOutputStream:<init>\011(Landroid/os/ParcelFileDescriptor;)V
        //   48: astore_1
        //   49: aload_1
        //   50: aload_0
        //   51: getfield 26\011com/google/android/gms/wearable/internal/zzbd$1:zzGV\011[B
        //   54: invokevirtual 76\011android/os/ParcelFileDescriptor$AutoCloseOutputStream:write\011([B)V
        //   57: aload_1
        //   58: invokevirtual 79\011android/os/ParcelFileDescriptor$AutoCloseOutputStream:flush\011()V
        //   61: ldc 41
        //   63: iconst_3
        //   64: invokestatic 47\011android/util/Log:isLoggable\011(Ljava/lang/String;I)Z
        //   67: ifeq +31 -> 98
        //   70: ldc 41
        //   72: new 49\011java/lang/StringBuilder
        //   75: dup
        //   76: invokespecial 50\011java/lang/StringBuilder:<init>\011()V
        //   79: ldc 81
        //   81: invokevirtual 56\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
        //   84: aload_0
        //   85: getfield 24\011com/google/android/gms/wearable/internal/zzbd$1:zzaGK\011Landroid/os/ParcelFileDescriptor;
        //   88: invokevirtual 59\011java/lang/StringBuilder:append\011(Ljava/lang/Object;)Ljava/lang/StringBuilder;
        //   91: invokevirtual 63\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
        //   94: invokestatic 67\011android/util/Log:d\011(Ljava/lang/String;Ljava/lang/String;)I
        //   97: pop
        //   98: iconst_1
        //   99: invokestatic 87\011java/lang/Boolean:valueOf\011(Z)Ljava/lang/Boolean;
        //   102: astore 9
        //   104: ldc 41
        //   106: iconst_3
        //   107: invokestatic 47\011android/util/Log:isLoggable\011(Ljava/lang/String;I)Z
        //   110: ifeq +31 -> 141
        //   113: ldc 41
        //   115: new 49\011java/lang/StringBuilder
        //   118: dup
        //   119: invokespecial 50\011java/lang/StringBuilder:<init>\011()V
        //   122: ldc 89
        //   124: invokevirtual 56\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
        //   127: aload_0
        //   128: getfield 24\011com/google/android/gms/wearable/internal/zzbd$1:zzaGK\011Landroid/os/ParcelFileDescriptor;
        //   131: invokevirtual 59\011java/lang/StringBuilder:append\011(Ljava/lang/Object;)Ljava/lang/StringBuilder;
        //   134: invokevirtual 63\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
        //   137: invokestatic 67\011android/util/Log:d\011(Ljava/lang/String;Ljava/lang/String;)I
        //   140: pop
        //   141: aload_1
        //   142: invokevirtual 92\011android/os/ParcelFileDescriptor$AutoCloseOutputStream:close\011()V
        //   145: aload 9
        //   147: areturn
        //   148: astore 5
        //   150: ldc 41
        //   152: new 49\011java/lang/StringBuilder
        //   155: dup
        //   156: invokespecial 50\011java/lang/StringBuilder:<init>\011()V
        //   159: ldc 94
        //   161: invokevirtual 56\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
        //   164: aload_0
        //   165: getfield 24\011com/google/android/gms/wearable/internal/zzbd$1:zzaGK\011Landroid/os/ParcelFileDescriptor;
        //   168: invokevirtual 59\011java/lang/StringBuilder:append\011(Ljava/lang/Object;)Ljava/lang/StringBuilder;
        //   171: invokevirtual 63\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
        //   174: invokestatic 97\011android/util/Log:w\011(Ljava/lang/String;Ljava/lang/String;)I
        //   177: pop
        //   178: ldc 41
        //   180: iconst_3
        //   181: invokestatic 47\011android/util/Log:isLoggable\011(Ljava/lang/String;I)Z
        //   184: ifeq +31 -> 215
        //   187: ldc 41
        //   189: new 49\011java/lang/StringBuilder
        //   192: dup
        //   193: invokespecial 50\011java/lang/StringBuilder:<init>\011()V
        //   196: ldc 89
        //   198: invokevirtual 56\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
        //   201: aload_0
        //   202: getfield 24\011com/google/android/gms/wearable/internal/zzbd$1:zzaGK\011Landroid/os/ParcelFileDescriptor;
        //   205: invokevirtual 59\011java/lang/StringBuilder:append\011(Ljava/lang/Object;)Ljava/lang/StringBuilder;
        //   208: invokevirtual 63\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
        //   211: invokestatic 67\011android/util/Log:d\011(Ljava/lang/String;Ljava/lang/String;)I
        //   214: pop
        //   215: aload_1
        //   216: invokevirtual 92\011android/os/ParcelFileDescriptor$AutoCloseOutputStream:close\011()V
        //   219: iconst_0
        //   220: invokestatic 87\011java/lang/Boolean:valueOf\011(Z)Ljava/lang/Boolean;
        //   223: areturn
        //   224: astore_2
        //   225: ldc 41
        //   227: iconst_3
        //   228: invokestatic 47\011android/util/Log:isLoggable\011(Ljava/lang/String;I)Z
        //   231: ifeq +31 -> 262
        //   234: ldc 41
        //   236: new 49\011java/lang/StringBuilder
        //   239: dup
        //   240: invokespecial 50\011java/lang/StringBuilder:<init>\011()V
        //   243: ldc 89
        //   245: invokevirtual 56\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
        //   248: aload_0
        //   249: getfield 24\011com/google/android/gms/wearable/internal/zzbd$1:zzaGK\011Landroid/os/ParcelFileDescriptor;
        //   252: invokevirtual 59\011java/lang/StringBuilder:append\011(Ljava/lang/Object;)Ljava/lang/StringBuilder;
        //   255: invokevirtual 63\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
        //   258: invokestatic 67\011android/util/Log:d\011(Ljava/lang/String;Ljava/lang/String;)I
        //   261: pop
        //   262: aload_1
        //   263: invokevirtual 92\011android/os/ParcelFileDescriptor$AutoCloseOutputStream:close\011()V
        //   266: aload_2
        //   267: athrow
        //   268: astore_3
        //   269: goto -3 -> 266
        //   272: astore 7
        //   274: goto -55 -> 219
        //   277: astore 10
        //   279: aload 9
        //   281: areturn
        //
        // Exception table:
        //   from\011to\011target\011type
        //   49\01198\011148\011java/io/IOException
        //   98\011104\011148\011java/io/IOException
        //   49\01198\011224\011finally
        //   98\011104\011224\011finally
        //   150\011178\011224\011finally
        //   225\011262\011268\011java/io/IOException
        //   262\011266\011268\011java/io/IOException
        //   178\011215\011272\011java/io/IOException
        //   215\011219\011272\011java/io/IOException
        //   104\011141\011277\011java/io/IOException
        //   141\011145\011277\011java/io/IOException
      }
    });
  }

  public void disconnect()
  {
    this.zzaGG.zzb(this);
    this.zzaGH.zzb(this);
    this.zzaGI.zzb(this);
    this.zzaGJ.zzb(this);
    super.disconnect();
  }

  protected void zza(int paramInt, IBinder paramIBinder, Bundle paramBundle)
  {
    if (Log.isLoggable("WearableClient", 2))
      Log.d("WearableClient", "onPostInitHandler: statusCode " + paramInt);
    if (paramInt == 0)
    {
      this.zzaGG.zzcS(paramIBinder);
      this.zzaGH.zzcS(paramIBinder);
      this.zzaGI.zzcS(paramIBinder);
      this.zzaGJ.zzcS(paramIBinder);
    }
    super.zza(paramInt, paramIBinder, paramBundle);
  }

  public void zza(zza.zzb<DataApi.DataItemResult> paramzzb, Uri paramUri)
    throws RemoteException
  {
    ((zzai)zzjb()).zza(new zzbc.zzd(paramzzb), paramUri);
  }

  public void zza(zza.zzb<DataApi.GetFdForAssetResult> paramzzb, Asset paramAsset)
    throws RemoteException
  {
    ((zzai)zzjb()).zza(new zzbc.zzf(paramzzb), paramAsset);
  }

  public void zza(zza.zzb<Status> paramzzb, DataApi.DataListener paramDataListener)
    throws RemoteException
  {
    this.zzaGH.zza(this, paramzzb, paramDataListener);
  }

  public void zza(zza.zzb<Status> paramzzb, DataApi.DataListener paramDataListener, IntentFilter[] paramArrayOfIntentFilter)
    throws RemoteException
  {
    this.zzaGH.zza(this, paramzzb, paramDataListener, paramArrayOfIntentFilter);
  }

  public void zza(zza.zzb<DataApi.GetFdForAssetResult> paramzzb, DataItemAsset paramDataItemAsset)
    throws RemoteException
  {
    zza(paramzzb, Asset.createFromRef(paramDataItemAsset.getId()));
  }

  public void zza(zza.zzb<Status> paramzzb, MessageApi.MessageListener paramMessageListener)
    throws RemoteException
  {
    this.zzaGI.zza(this, paramzzb, paramMessageListener);
  }

  public void zza(zza.zzb<Status> paramzzb, MessageApi.MessageListener paramMessageListener, IntentFilter[] paramArrayOfIntentFilter)
    throws RemoteException
  {
    this.zzaGI.zza(this, paramzzb, paramMessageListener, paramArrayOfIntentFilter);
  }

  public void zza(zza.zzb<Status> paramzzb, NodeApi.NodeListener paramNodeListener)
    throws RemoteException, RemoteException
  {
    this.zzaGJ.zza(this, paramzzb, paramNodeListener, null);
  }

  public void zza(zza.zzb<DataApi.DataItemResult> paramzzb, PutDataRequest paramPutDataRequest)
    throws RemoteException
  {
    Iterator localIterator1 = paramPutDataRequest.getAssets().entrySet().iterator();
    while (localIterator1.hasNext())
    {
      Asset localAsset2 = (Asset)((Map.Entry)localIterator1.next()).getValue();
      if ((localAsset2.getData() == null) && (localAsset2.getDigest() == null) && (localAsset2.getFd() == null) && (localAsset2.getUri() == null))
        throw new IllegalArgumentException("Put for " + paramPutDataRequest.getUri() + " contains invalid asset: " + localAsset2);
    }
    PutDataRequest localPutDataRequest = PutDataRequest.zzn(paramPutDataRequest.getUri());
    localPutDataRequest.setData(paramPutDataRequest.getData());
    ArrayList localArrayList = new ArrayList();
    Iterator localIterator2 = paramPutDataRequest.getAssets().entrySet().iterator();
    while (localIterator2.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)localIterator2.next();
      Asset localAsset1 = (Asset)localEntry.getValue();
      if (localAsset1.getData() == null)
        localPutDataRequest.putAsset((String)localEntry.getKey(), (Asset)localEntry.getValue());
      else
        try
        {
          ParcelFileDescriptor[] arrayOfParcelFileDescriptor = ParcelFileDescriptor.createPipe();
          if (Log.isLoggable("WearableClient", 3))
            Log.d("WearableClient", "processAssets: replacing data with FD in asset: " + localAsset1 + " read:" + arrayOfParcelFileDescriptor[0] + " write:" + arrayOfParcelFileDescriptor[1]);
          localPutDataRequest.putAsset((String)localEntry.getKey(), Asset.createFromFd(arrayOfParcelFileDescriptor[0]));
          FutureTask localFutureTask = zza(arrayOfParcelFileDescriptor[1], localAsset1.getData());
          localArrayList.add(localFutureTask);
          this.zzazT.submit(localFutureTask);
        }
        catch (IOException localIOException)
        {
          throw new IllegalStateException("Unable to create ParcelFileDescriptor for asset in request: " + paramPutDataRequest, localIOException);
        }
    }
    try
    {
      ((zzai)zzjb()).zza(new zzbc.zzi(paramzzb, localArrayList), localPutDataRequest);
      return;
    }
    catch (NullPointerException localNullPointerException)
    {
      throw new IllegalStateException("Unable to putDataItem: " + paramPutDataRequest, localNullPointerException);
    }
  }

  public void zza(zza.zzb<MessageApi.SendMessageResult> paramzzb, String paramString1, String paramString2, byte[] paramArrayOfByte)
    throws RemoteException
  {
    ((zzai)zzjb()).zza(new zzbc.zzj(paramzzb), paramString1, paramString2, paramArrayOfByte);
  }

  public void zzb(zza.zzb<DataItemBuffer> paramzzb, Uri paramUri)
    throws RemoteException
  {
    ((zzai)zzjb()).zzb(new zzbc.zze(paramzzb), paramUri);
  }

  public void zzb(zza.zzb<Status> paramzzb, NodeApi.NodeListener paramNodeListener)
    throws RemoteException
  {
    this.zzaGJ.zza(this, paramzzb, paramNodeListener);
  }

  public void zzc(zza.zzb<DataApi.DeleteDataItemsResult> paramzzb, Uri paramUri)
    throws RemoteException
  {
    ((zzai)zzjb()).zzc(new zzbc.zzb(paramzzb), paramUri);
  }

  protected String zzcF()
  {
    return "com.google.android.gms.wearable.BIND";
  }

  protected String zzcG()
  {
    return "com.google.android.gms.wearable.internal.IWearableService";
  }

  protected zzai zzcT(IBinder paramIBinder)
  {
    return zzai.zza.zzcR(paramIBinder);
  }

  public void zzm(zza.zzb<DataItemBuffer> paramzzb)
    throws RemoteException
  {
    ((zzai)zzjb()).zzb(new zzbc.zze(paramzzb));
  }

  public void zzn(zza.zzb<NodeApi.GetLocalNodeResult> paramzzb)
    throws RemoteException
  {
    ((zzai)zzjb()).zzc(new zzbc.zzg(paramzzb));
  }

  public void zzo(zza.zzb<NodeApi.GetConnectedNodesResult> paramzzb)
    throws RemoteException
  {
    ((zzai)zzjb()).zzd(new zzbc.zzc(paramzzb));
  }
}