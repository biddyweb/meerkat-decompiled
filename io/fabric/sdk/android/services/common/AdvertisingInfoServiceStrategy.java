package io.fabric.sdk.android.services.common;

import android.content.ComponentName;
import android.content.Context;
import android.content.ServiceConnection;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import io.fabric.sdk.android.Fabric;
import io.fabric.sdk.android.Logger;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.TimeUnit;

class AdvertisingInfoServiceStrategy
  implements AdvertisingInfoStrategy
{
  public static final String GOOGLE_PLAY_SERVICES_INTENT = "com.google.android.gms.ads.identifier.service.START";
  public static final String GOOGLE_PLAY_SERVICES_INTENT_PACKAGE_NAME = "com.google.android.gms";
  private static final String GOOGLE_PLAY_SERVICE_PACKAGE_NAME = "com.android.vending";
  private final Context context;

  public AdvertisingInfoServiceStrategy(Context paramContext)
  {
    this.context = paramContext.getApplicationContext();
  }

  // ERROR //
  public AdvertisingInfo getAdvertisingInfo()
  {
    // Byte code:
    //   0: invokestatic 43\011android/os/Looper:myLooper\011()Landroid/os/Looper;
    //   3: invokestatic 46\011android/os/Looper:getMainLooper\011()Landroid/os/Looper;
    //   6: if_acmpne +17 -> 23
    //   9: invokestatic 52\011io/fabric/sdk/android/Fabric:getLogger\011()Lio/fabric/sdk/android/Logger;
    //   12: ldc 54
    //   14: ldc 56
    //   16: invokeinterface 62 3 0
    //   21: aconst_null
    //   22: areturn
    //   23: aload_0
    //   24: getfield 31\011io/fabric/sdk/android/services/common/AdvertisingInfoServiceStrategy:context\011Landroid/content/Context;
    //   27: invokevirtual 66\011android/content/Context:getPackageManager\011()Landroid/content/pm/PackageManager;
    //   30: ldc 16
    //   32: iconst_0
    //   33: invokevirtual 72\011android/content/pm/PackageManager:getPackageInfo\011(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    //   36: pop
    //   37: new 74\011io/fabric/sdk/android/services/common/AdvertisingInfoServiceStrategy$AdvertisingConnection
    //   40: dup
    //   41: aconst_null
    //   42: invokespecial 77\011io/fabric/sdk/android/services/common/AdvertisingInfoServiceStrategy$AdvertisingConnection:<init>\011(Lio/fabric/sdk/android/services/common/AdvertisingInfoServiceStrategy$1;)V
    //   45: astore_3
    //   46: new 79\011android/content/Intent
    //   49: dup
    //   50: ldc 10
    //   52: invokespecial 82\011android/content/Intent:<init>\011(Ljava/lang/String;)V
    //   55: astore 4
    //   57: aload 4
    //   59: ldc 13
    //   61: invokevirtual 86\011android/content/Intent:setPackage\011(Ljava/lang/String;)Landroid/content/Intent;
    //   64: pop
    //   65: aload_0
    //   66: getfield 31\011io/fabric/sdk/android/services/common/AdvertisingInfoServiceStrategy:context\011Landroid/content/Context;
    //   69: aload 4
    //   71: aload_3
    //   72: iconst_1
    //   73: invokevirtual 90\011android/content/Context:bindService\011(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z
    //   76: istore 7
    //   78: iload 7
    //   80: ifeq +119 -> 199
    //   83: new 92\011io/fabric/sdk/android/services/common/AdvertisingInfoServiceStrategy$AdvertisingInterface
    //   86: dup
    //   87: aload_3
    //   88: invokevirtual 96\011io/fabric/sdk/android/services/common/AdvertisingInfoServiceStrategy$AdvertisingConnection:getBinder\011()Landroid/os/IBinder;
    //   91: invokespecial 99\011io/fabric/sdk/android/services/common/AdvertisingInfoServiceStrategy$AdvertisingInterface:<init>\011(Landroid/os/IBinder;)V
    //   94: astore 8
    //   96: new 101\011io/fabric/sdk/android/services/common/AdvertisingInfo
    //   99: dup
    //   100: aload 8
    //   102: invokevirtual 105\011io/fabric/sdk/android/services/common/AdvertisingInfoServiceStrategy$AdvertisingInterface:getId\011()Ljava/lang/String;
    //   105: aload 8
    //   107: invokevirtual 109\011io/fabric/sdk/android/services/common/AdvertisingInfoServiceStrategy$AdvertisingInterface:isLimitAdTrackingEnabled\011()Z
    //   110: invokespecial 112\011io/fabric/sdk/android/services/common/AdvertisingInfo:<init>\011(Ljava/lang/String;Z)V
    //   113: astore 9
    //   115: aload_0
    //   116: getfield 31\011io/fabric/sdk/android/services/common/AdvertisingInfoServiceStrategy:context\011Landroid/content/Context;
    //   119: aload_3
    //   120: invokevirtual 116\011android/content/Context:unbindService\011(Landroid/content/ServiceConnection;)V
    //   123: aload 9
    //   125: areturn
    //   126: astore_1
    //   127: invokestatic 52\011io/fabric/sdk/android/Fabric:getLogger\011()Lio/fabric/sdk/android/Logger;
    //   130: ldc 54
    //   132: ldc 118
    //   134: aload_1
    //   135: invokeinterface 121 4 0
    //   140: aconst_null
    //   141: areturn
    //   142: astore 11
    //   144: invokestatic 52\011io/fabric/sdk/android/Fabric:getLogger\011()Lio/fabric/sdk/android/Logger;
    //   147: ldc 54
    //   149: ldc 123
    //   151: aload 11
    //   153: invokeinterface 126 4 0
    //   158: aload_0
    //   159: getfield 31\011io/fabric/sdk/android/services/common/AdvertisingInfoServiceStrategy:context\011Landroid/content/Context;
    //   162: aload_3
    //   163: invokevirtual 116\011android/content/Context:unbindService\011(Landroid/content/ServiceConnection;)V
    //   166: aconst_null
    //   167: areturn
    //   168: astore 6
    //   170: invokestatic 52\011io/fabric/sdk/android/Fabric:getLogger\011()Lio/fabric/sdk/android/Logger;
    //   173: ldc 54
    //   175: ldc 128
    //   177: aload 6
    //   179: invokeinterface 121 4 0
    //   184: aconst_null
    //   185: areturn
    //   186: astore 10
    //   188: aload_0
    //   189: getfield 31\011io/fabric/sdk/android/services/common/AdvertisingInfoServiceStrategy:context\011Landroid/content/Context;
    //   192: aload_3
    //   193: invokevirtual 116\011android/content/Context:unbindService\011(Landroid/content/ServiceConnection;)V
    //   196: aload 10
    //   198: athrow
    //   199: invokestatic 52\011io/fabric/sdk/android/Fabric:getLogger\011()Lio/fabric/sdk/android/Logger;
    //   202: ldc 54
    //   204: ldc 128
    //   206: invokeinterface 62 3 0
    //   211: aconst_null
    //   212: areturn
    //
    // Exception table:
    //   from\011to\011target\011type
    //   23\01137\011126\011java/lang/Exception
    //   83\011115\011142\011java/lang/Exception
    //   65\01178\011168\011java/lang/Throwable
    //   115\011123\011168\011java/lang/Throwable
    //   158\011166\011168\011java/lang/Throwable
    //   188\011199\011168\011java/lang/Throwable
    //   199\011211\011168\011java/lang/Throwable
    //   83\011115\011186\011finally
    //   144\011158\011186\011finally
  }

  private static final class AdvertisingConnection
    implements ServiceConnection
  {
    private static final int QUEUE_TIMEOUT_IN_MS = 200;
    private final LinkedBlockingQueue<IBinder> queue = new LinkedBlockingQueue(1);
    private boolean retrieved = false;

    public IBinder getBinder()
    {
      if (this.retrieved)
        Fabric.getLogger().e("Fabric", "getBinder already called");
      this.retrieved = true;
      try
      {
        IBinder localIBinder = (IBinder)this.queue.poll(200L, TimeUnit.MILLISECONDS);
        return localIBinder;
      }
      catch (InterruptedException localInterruptedException)
      {
      }
      return null;
    }

    public void onServiceConnected(ComponentName paramComponentName, IBinder paramIBinder)
    {
      try
      {
        this.queue.put(paramIBinder);
        return;
      }
      catch (InterruptedException localInterruptedException)
      {
      }
    }

    public void onServiceDisconnected(ComponentName paramComponentName)
    {
      this.queue.clear();
    }
  }

  private static final class AdvertisingInterface
    implements IInterface
  {
    public static final String ADVERTISING_ID_SERVICE_INTERFACE_TOKEN = "com.google.android.gms.ads.identifier.internal.IAdvertisingIdService";
    private static final int AD_TRANSACTION_CODE_ID = 1;
    private static final int AD_TRANSACTION_CODE_LIMIT_AD_TRACKING = 2;
    private static final int FLAGS_NONE;
    private final IBinder binder;

    public AdvertisingInterface(IBinder paramIBinder)
    {
      this.binder = paramIBinder;
    }

    public IBinder asBinder()
    {
      return this.binder;
    }

    public String getId()
      throws RemoteException
    {
      Parcel localParcel1 = Parcel.obtain();
      Parcel localParcel2 = Parcel.obtain();
      try
      {
        localParcel1.writeInterfaceToken("com.google.android.gms.ads.identifier.internal.IAdvertisingIdService");
        this.binder.transact(1, localParcel1, localParcel2, 0);
        localParcel2.readException();
        String str = localParcel2.readString();
        return str;
      }
      catch (Exception localException)
      {
        Fabric.getLogger().d("Fabric", "Could not get parcel from Google Play Service to capture AdvertisingId");
        return null;
      }
      finally
      {
        localParcel2.recycle();
        localParcel1.recycle();
      }
    }

    public boolean isLimitAdTrackingEnabled()
      throws RemoteException
    {
      Parcel localParcel1 = Parcel.obtain();
      Parcel localParcel2 = Parcel.obtain();
      try
      {
        localParcel1.writeInterfaceToken("com.google.android.gms.ads.identifier.internal.IAdvertisingIdService");
        localParcel1.writeInt(1);
        this.binder.transact(2, localParcel1, localParcel2, 0);
        localParcel2.readException();
        int i = localParcel2.readInt();
        if (i != 0);
        for (boolean bool = true; ; bool = false)
          return bool;
      }
      catch (Exception localException)
      {
        Fabric.getLogger().d("Fabric", "Could not get parcel from Google Play Service to capture Advertising limitAdTracking");
        return false;
      }
      finally
      {
        localParcel2.recycle();
        localParcel1.recycle();
      }
    }
  }
}