package com.google.android.gms.ads.identifier;

import android.content.Context;
import com.google.android.gms.common.GooglePlayServicesNotAvailableException;
import com.google.android.gms.common.GooglePlayServicesRepairableException;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.common.zza;
import com.google.android.gms.internal.zzs;
import com.google.android.gms.internal.zzs.zza;
import java.io.IOException;
import java.lang.ref.WeakReference;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

public class AdvertisingIdClient
{
  private final Context mContext;
  zza zzln;
  zzs zzlo;
  boolean zzlp;
  Object zzlq = new Object();
  zza zzlr;
  final long zzls;

  public AdvertisingIdClient(Context paramContext)
  {
    this(paramContext, 30000L);
  }

  public AdvertisingIdClient(Context paramContext, long paramLong)
  {
    zzx.zzl(paramContext);
    this.mContext = paramContext;
    this.zzlp = false;
    this.zzls = paramLong;
  }

  public static Info getAdvertisingIdInfo(Context paramContext)
    throws IOException, IllegalStateException, GooglePlayServicesNotAvailableException, GooglePlayServicesRepairableException
  {
    AdvertisingIdClient localAdvertisingIdClient = new AdvertisingIdClient(paramContext, -1L);
    try
    {
      localAdvertisingIdClient.zzb(false);
      Info localInfo = localAdvertisingIdClient.getInfo();
      return localInfo;
    }
    finally
    {
      localAdvertisingIdClient.finish();
    }
  }

  private void zzZ()
  {
    synchronized (this.zzlq)
    {
      if (this.zzlr != null)
        this.zzlr.cancel();
    }
    try
    {
      this.zzlr.join();
      label28: if (this.zzls > 0L)
        this.zzlr = new zza(this, this.zzls);
      return;
      localObject2 = finally;
      throw localObject2;
    }
    catch (InterruptedException localInterruptedException)
    {
      break label28;
    }
  }

  static zzs zza(Context paramContext, zza paramzza)
    throws IOException
  {
    try
    {
      zzs localzzs = zzs.zza.zzb(paramzza.zzhJ());
      return localzzs;
    }
    catch (InterruptedException localInterruptedException)
    {
    }
    throw new IOException("Interrupted exception");
  }

  // ERROR //
  static zza zzh(Context paramContext)
    throws IOException, GooglePlayServicesNotAvailableException, GooglePlayServicesRepairableException
  {
    // Byte code:
    //   0: aload_0
    //   1: invokevirtual 109\011android/content/Context:getPackageManager\011()Landroid/content/pm/PackageManager;
    //   4: ldc 111
    //   6: iconst_0
    //   7: invokevirtual 117\011android/content/pm/PackageManager:getPackageInfo\011(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    //   10: pop
    //   11: aload_0
    //   12: invokestatic 122\011com/google/android/gms/common/GooglePlayServicesUtil:zzI\011(Landroid/content/Context;)V
    //   15: new 85\011com/google/android/gms/common/zza
    //   18: dup
    //   19: invokespecial 123\011com/google/android/gms/common/zza:<init>\011()V
    //   22: astore 4
    //   24: new 125\011android/content/Intent
    //   27: dup
    //   28: ldc 127
    //   30: invokespecial 128\011android/content/Intent:<init>\011(Ljava/lang/String;)V
    //   33: astore 5
    //   35: aload 5
    //   37: ldc 130
    //   39: invokevirtual 134\011android/content/Intent:setPackage\011(Ljava/lang/String;)Landroid/content/Intent;
    //   42: pop
    //   43: invokestatic 140\011com/google/android/gms/internal/zzlo:zzka\011()Lcom/google/android/gms/internal/zzlo;
    //   46: aload_0
    //   47: aload 5
    //   49: aload 4
    //   51: iconst_1
    //   52: invokevirtual 143\011com/google/android/gms/internal/zzlo:zza\011(Landroid/content/Context;Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z
    //   55: ifeq +27 -> 82
    //   58: aload 4
    //   60: areturn
    //   61: astore_1
    //   62: new 50\011com/google/android/gms/common/GooglePlayServicesNotAvailableException
    //   65: dup
    //   66: bipush 9
    //   68: invokespecial 146\011com/google/android/gms/common/GooglePlayServicesNotAvailableException:<init>\011(I)V
    //   71: athrow
    //   72: astore_3
    //   73: new 46\011java/io/IOException
    //   76: dup
    //   77: aload_3
    //   78: invokespecial 149\011java/io/IOException:<init>\011(Ljava/lang/Throwable;)V
    //   81: athrow
    //   82: new 46\011java/io/IOException
    //   85: dup
    //   86: ldc 151
    //   88: invokespecial 99\011java/io/IOException:<init>\011(Ljava/lang/String;)V
    //   91: athrow
    //
    // Exception table:
    //   from\011to\011target\011type
    //   0\01111\01161\011android/content/pm/PackageManager$NameNotFoundException
    //   11\01115\01172\011com/google/android/gms/common/GooglePlayServicesNotAvailableException
  }

  protected void finalize()
    throws Throwable
  {
    finish();
    super.finalize();
  }

  // ERROR //
  public void finish()
  {
    // Byte code:
    //   0: ldc 160
    //   2: invokestatic 163\011com/google/android/gms/common/internal/zzx:zzbe\011(Ljava/lang/String;)V
    //   5: aload_0
    //   6: monitorenter
    //   7: aload_0
    //   8: getfield 38\011com/google/android/gms/ads/identifier/AdvertisingIdClient:mContext\011Landroid/content/Context;
    //   11: ifnull +10 -> 21
    //   14: aload_0
    //   15: getfield 165\011com/google/android/gms/ads/identifier/AdvertisingIdClient:zzln\011Lcom/google/android/gms/common/zza;
    //   18: ifnonnull +6 -> 24
    //   21: aload_0
    //   22: monitorexit
    //   23: return
    //   24: aload_0
    //   25: getfield 40\011com/google/android/gms/ads/identifier/AdvertisingIdClient:zzlp\011Z
    //   28: ifeq +17 -> 45
    //   31: invokestatic 140\011com/google/android/gms/internal/zzlo:zzka\011()Lcom/google/android/gms/internal/zzlo;
    //   34: aload_0
    //   35: getfield 38\011com/google/android/gms/ads/identifier/AdvertisingIdClient:mContext\011Landroid/content/Context;
    //   38: aload_0
    //   39: getfield 165\011com/google/android/gms/ads/identifier/AdvertisingIdClient:zzln\011Lcom/google/android/gms/common/zza;
    //   42: invokevirtual 168\011com/google/android/gms/internal/zzlo:zza\011(Landroid/content/Context;Landroid/content/ServiceConnection;)V
    //   45: aload_0
    //   46: iconst_0
    //   47: putfield 40\011com/google/android/gms/ads/identifier/AdvertisingIdClient:zzlp\011Z
    //   50: aload_0
    //   51: aconst_null
    //   52: putfield 170\011com/google/android/gms/ads/identifier/AdvertisingIdClient:zzlo\011Lcom/google/android/gms/internal/zzs;
    //   55: aload_0
    //   56: aconst_null
    //   57: putfield 165\011com/google/android/gms/ads/identifier/AdvertisingIdClient:zzln\011Lcom/google/android/gms/common/zza;
    //   60: aload_0
    //   61: monitorexit
    //   62: return
    //   63: astore_1
    //   64: aload_0
    //   65: monitorexit
    //   66: aload_1
    //   67: athrow
    //   68: astore_2
    //   69: ldc 172
    //   71: ldc 174
    //   73: aload_2
    //   74: invokestatic 180\011android/util/Log:i\011(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    //   77: pop
    //   78: goto -33 -> 45
    //
    // Exception table:
    //   from\011to\011target\011type
    //   7\01121\01163\011finally
    //   21\01123\01163\011finally
    //   24\01145\01163\011finally
    //   45\01162\01163\011finally
    //   64\01166\01163\011finally
    //   69\01178\01163\011finally
    //   24\01145\01168\011java/lang/IllegalArgumentException
  }

  // ERROR //
  public Info getInfo()
    throws IOException
  {
    // Byte code:
    //   0: ldc 160
    //   2: invokestatic 163\011com/google/android/gms/common/internal/zzx:zzbe\011(Ljava/lang/String;)V
    //   5: aload_0
    //   6: monitorenter
    //   7: aload_0
    //   8: getfield 40\011com/google/android/gms/ads/identifier/AdvertisingIdClient:zzlp\011Z
    //   11: ifne +91 -> 102
    //   14: aload_0
    //   15: getfield 30\011com/google/android/gms/ads/identifier/AdvertisingIdClient:zzlq\011Ljava/lang/Object;
    //   18: astore 7
    //   20: aload 7
    //   22: monitorenter
    //   23: aload_0
    //   24: getfield 70\011com/google/android/gms/ads/identifier/AdvertisingIdClient:zzlr\011Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$zza;
    //   27: ifnull +13 -> 40
    //   30: aload_0
    //   31: getfield 70\011com/google/android/gms/ads/identifier/AdvertisingIdClient:zzlr\011Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$zza;
    //   34: invokevirtual 188\011com/google/android/gms/ads/identifier/AdvertisingIdClient$zza:zzaa\011()Z
    //   37: ifne +26 -> 63
    //   40: new 46\011java/io/IOException
    //   43: dup
    //   44: ldc 190
    //   46: invokespecial 99\011java/io/IOException:<init>\011(Ljava/lang/String;)V
    //   49: athrow
    //   50: astore 8
    //   52: aload 7
    //   54: monitorexit
    //   55: aload 8
    //   57: athrow
    //   58: astore_1
    //   59: aload_0
    //   60: monitorexit
    //   61: aload_1
    //   62: athrow
    //   63: aload 7
    //   65: monitorexit
    //   66: aload_0
    //   67: iconst_0
    //   68: invokevirtual 58\011com/google/android/gms/ads/identifier/AdvertisingIdClient:zzb\011(Z)V
    //   71: aload_0
    //   72: getfield 40\011com/google/android/gms/ads/identifier/AdvertisingIdClient:zzlp\011Z
    //   75: ifne +27 -> 102
    //   78: new 46\011java/io/IOException
    //   81: dup
    //   82: ldc 192
    //   84: invokespecial 99\011java/io/IOException:<init>\011(Ljava/lang/String;)V
    //   87: athrow
    //   88: astore 9
    //   90: new 46\011java/io/IOException
    //   93: dup
    //   94: ldc 192
    //   96: aload 9
    //   98: invokespecial 195\011java/io/IOException:<init>\011(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   101: athrow
    //   102: aload_0
    //   103: getfield 165\011com/google/android/gms/ads/identifier/AdvertisingIdClient:zzln\011Lcom/google/android/gms/common/zza;
    //   106: invokestatic 36\011com/google/android/gms/common/internal/zzx:zzl\011(Ljava/lang/Object;)Ljava/lang/Object;
    //   109: pop
    //   110: aload_0
    //   111: getfield 170\011com/google/android/gms/ads/identifier/AdvertisingIdClient:zzlo\011Lcom/google/android/gms/internal/zzs;
    //   114: invokestatic 36\011com/google/android/gms/common/internal/zzx:zzl\011(Ljava/lang/Object;)Ljava/lang/Object;
    //   117: pop
    //   118: new 197\011com/google/android/gms/ads/identifier/AdvertisingIdClient$Info
    //   121: dup
    //   122: aload_0
    //   123: getfield 170\011com/google/android/gms/ads/identifier/AdvertisingIdClient:zzlo\011Lcom/google/android/gms/internal/zzs;
    //   126: invokeinterface 203 1 0
    //   131: aload_0
    //   132: getfield 170\011com/google/android/gms/ads/identifier/AdvertisingIdClient:zzlo\011Lcom/google/android/gms/internal/zzs;
    //   135: iconst_1
    //   136: invokeinterface 207 2 0
    //   141: invokespecial 210\011com/google/android/gms/ads/identifier/AdvertisingIdClient$Info:<init>\011(Ljava/lang/String;Z)V
    //   144: astore 4
    //   146: aload_0
    //   147: monitorexit
    //   148: aload_0
    //   149: invokespecial 212\011com/google/android/gms/ads/identifier/AdvertisingIdClient:zzZ\011()V
    //   152: aload 4
    //   154: areturn
    //   155: astore 5
    //   157: ldc 172
    //   159: ldc 214
    //   161: aload 5
    //   163: invokestatic 180\011android/util/Log:i\011(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    //   166: pop
    //   167: new 46\011java/io/IOException
    //   170: dup
    //   171: ldc 216
    //   173: invokespecial 99\011java/io/IOException:<init>\011(Ljava/lang/String;)V
    //   176: athrow
    //
    // Exception table:
    //   from\011to\011target\011type
    //   23\01140\01150\011finally
    //   40\01150\01150\011finally
    //   52\01155\01150\011finally
    //   63\01166\01150\011finally
    //   7\01123\01158\011finally
    //   55\01158\01158\011finally
    //   59\01161\01158\011finally
    //   66\01171\01158\011finally
    //   71\01188\01158\011finally
    //   90\011102\01158\011finally
    //   102\011118\01158\011finally
    //   118\011146\01158\011finally
    //   146\011148\01158\011finally
    //   157\011177\01158\011finally
    //   66\01171\01188\011java/lang/Exception
    //   118\011146\011155\011android/os/RemoteException
  }

  public void start()
    throws IOException, IllegalStateException, GooglePlayServicesNotAvailableException, GooglePlayServicesRepairableException
  {
    zzb(true);
  }

  protected void zzb(boolean paramBoolean)
    throws IOException, IllegalStateException, GooglePlayServicesNotAvailableException, GooglePlayServicesRepairableException
  {
    zzx.zzbe("Calling this from your main thread can lead to deadlock");
    try
    {
      if (this.zzlp)
        finish();
      this.zzln = zzh(this.mContext);
      this.zzlo = zza(this.mContext, this.zzln);
      this.zzlp = true;
      if (paramBoolean)
        zzZ();
      return;
    }
    finally
    {
    }
  }

  public static final class Info
  {
    private final String zzlx;
    private final boolean zzly;

    public Info(String paramString, boolean paramBoolean)
    {
      this.zzlx = paramString;
      this.zzly = paramBoolean;
    }

    public String getId()
    {
      return this.zzlx;
    }

    public boolean isLimitAdTrackingEnabled()
    {
      return this.zzly;
    }

    public String toString()
    {
      return "{" + this.zzlx + "}" + this.zzly;
    }
  }

  static class zza extends Thread
  {
    private WeakReference<AdvertisingIdClient> zzlt;
    private long zzlu;
    CountDownLatch zzlv;
    boolean zzlw;

    public zza(AdvertisingIdClient paramAdvertisingIdClient, long paramLong)
    {
      this.zzlt = new WeakReference(paramAdvertisingIdClient);
      this.zzlu = paramLong;
      this.zzlv = new CountDownLatch(1);
      this.zzlw = false;
      start();
    }

    private void disconnect()
    {
      AdvertisingIdClient localAdvertisingIdClient = (AdvertisingIdClient)this.zzlt.get();
      if (localAdvertisingIdClient != null)
      {
        localAdvertisingIdClient.finish();
        this.zzlw = true;
      }
    }

    public void cancel()
    {
      this.zzlv.countDown();
    }

    public void run()
    {
      try
      {
        if (!this.zzlv.await(this.zzlu, TimeUnit.MILLISECONDS))
          disconnect();
        return;
      }
      catch (InterruptedException localInterruptedException)
      {
        disconnect();
      }
    }

    public boolean zzaa()
    {
      return this.zzlw;
    }
  }
}