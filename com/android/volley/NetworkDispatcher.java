package com.android.volley;

import android.annotation.TargetApi;
import android.net.TrafficStats;
import android.os.Build.VERSION;
import java.util.concurrent.BlockingQueue;

public class NetworkDispatcher extends Thread
{
  private final Cache mCache;
  private final ResponseDelivery mDelivery;
  private final Network mNetwork;
  private final BlockingQueue<Request<?>> mQueue;
  private volatile boolean mQuit = false;

  public NetworkDispatcher(BlockingQueue<Request<?>> paramBlockingQueue, Network paramNetwork, Cache paramCache, ResponseDelivery paramResponseDelivery)
  {
    this.mQueue = paramBlockingQueue;
    this.mNetwork = paramNetwork;
    this.mCache = paramCache;
    this.mDelivery = paramResponseDelivery;
  }

  @TargetApi(14)
  private void addTrafficStatsTag(Request<?> paramRequest)
  {
    if (Build.VERSION.SDK_INT >= 14)
      TrafficStats.setThreadStatsTag(paramRequest.getTrafficStatsTag());
  }

  private void parseAndDeliverNetworkError(Request<?> paramRequest, VolleyError paramVolleyError)
  {
    VolleyError localVolleyError = paramRequest.parseNetworkError(paramVolleyError);
    this.mDelivery.postError(paramRequest, localVolleyError);
  }

  public void quit()
  {
    this.mQuit = true;
    interrupt();
  }

  // ERROR //
  public void run()
  {
    // Byte code:
    //   0: bipush 10
    //   2: invokestatic 80\011android/os/Process:setThreadPriority\011(I)V
    //   5: invokestatic 86\011android/os/SystemClock:elapsedRealtime\011()J
    //   8: lstore_1
    //   9: aload_0
    //   10: getfield 24\011com/android/volley/NetworkDispatcher:mQueue\011Ljava/util/concurrent/BlockingQueue;
    //   13: invokeinterface 92 1 0
    //   18: checkcast 43\011com/android/volley/Request
    //   21: astore 4
    //   23: aload 4
    //   25: ldc 94
    //   27: invokevirtual 98\011com/android/volley/Request:addMarker\011(Ljava/lang/String;)V
    //   30: aload 4
    //   32: invokevirtual 102\011com/android/volley/Request:isCanceled\011()Z
    //   35: ifeq +45 -> 80
    //   38: aload 4
    //   40: ldc 104
    //   42: invokevirtual 107\011com/android/volley/Request:finish\011(Ljava/lang/String;)V
    //   45: goto -40 -> 5
    //   48: astore 8
    //   50: aload 8
    //   52: invokestatic 86\011android/os/SystemClock:elapsedRealtime\011()J
    //   55: lload_1
    //   56: lsub
    //   57: invokevirtual 111\011com/android/volley/VolleyError:setNetworkTimeMs\011(J)V
    //   60: aload_0
    //   61: aload 4
    //   63: aload 8
    //   65: invokespecial 113\011com/android/volley/NetworkDispatcher:parseAndDeliverNetworkError\011(Lcom/android/volley/Request;Lcom/android/volley/VolleyError;)V
    //   68: goto -63 -> 5
    //   71: astore_3
    //   72: aload_0
    //   73: getfield 22\011com/android/volley/NetworkDispatcher:mQuit\011Z
    //   76: ifeq -71 -> 5
    //   79: return
    //   80: aload_0
    //   81: aload 4
    //   83: invokespecial 115\011com/android/volley/NetworkDispatcher:addTrafficStatsTag\011(Lcom/android/volley/Request;)V
    //   86: aload_0
    //   87: getfield 26\011com/android/volley/NetworkDispatcher:mNetwork\011Lcom/android/volley/Network;
    //   90: aload 4
    //   92: invokeinterface 121 2 0
    //   97: astore 9
    //   99: aload 4
    //   101: ldc 123
    //   103: invokevirtual 98\011com/android/volley/Request:addMarker\011(Ljava/lang/String;)V
    //   106: aload 9
    //   108: getfield 128\011com/android/volley/NetworkResponse:notModified\011Z
    //   111: ifeq +84 -> 195
    //   114: aload 4
    //   116: invokevirtual 131\011com/android/volley/Request:hasHadResponseDelivered\011()Z
    //   119: ifeq +76 -> 195
    //   122: aload 4
    //   124: ldc 133
    //   126: invokevirtual 107\011com/android/volley/Request:finish\011(Ljava/lang/String;)V
    //   129: goto -124 -> 5
    //   132: astore 5
    //   134: iconst_1
    //   135: anewarray 135\011java/lang/Object
    //   138: astore 6
    //   140: aload 6
    //   142: iconst_0
    //   143: aload 5
    //   145: invokevirtual 139\011java/lang/Exception:toString\011()Ljava/lang/String;
    //   148: aastore
    //   149: aload 5
    //   151: ldc 141
    //   153: aload 6
    //   155: invokestatic 147\011com/android/volley/VolleyLog:e\011(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
    //   158: new 73\011com/android/volley/VolleyError
    //   161: dup
    //   162: aload 5
    //   164: invokespecial 150\011com/android/volley/VolleyError:<init>\011(Ljava/lang/Throwable;)V
    //   167: astore 7
    //   169: aload 7
    //   171: invokestatic 86\011android/os/SystemClock:elapsedRealtime\011()J
    //   174: lload_1
    //   175: lsub
    //   176: invokevirtual 111\011com/android/volley/VolleyError:setNetworkTimeMs\011(J)V
    //   179: aload_0
    //   180: getfield 30\011com/android/volley/NetworkDispatcher:mDelivery\011Lcom/android/volley/ResponseDelivery;
    //   183: aload 4
    //   185: aload 7
    //   187: invokeinterface 64 3 0
    //   192: goto -187 -> 5
    //   195: aload 4
    //   197: aload 9
    //   199: invokevirtual 154\011com/android/volley/Request:parseNetworkResponse\011(Lcom/android/volley/NetworkResponse;)Lcom/android/volley/Response;
    //   202: astore 10
    //   204: aload 4
    //   206: ldc 156
    //   208: invokevirtual 98\011com/android/volley/Request:addMarker\011(Ljava/lang/String;)V
    //   211: aload 4
    //   213: invokevirtual 159\011com/android/volley/Request:shouldCache\011()Z
    //   216: ifeq +37 -> 253
    //   219: aload 10
    //   221: getfield 165\011com/android/volley/Response:cacheEntry\011Lcom/android/volley/Cache$Entry;
    //   224: ifnull +29 -> 253
    //   227: aload_0
    //   228: getfield 28\011com/android/volley/NetworkDispatcher:mCache\011Lcom/android/volley/Cache;
    //   231: aload 4
    //   233: invokevirtual 168\011com/android/volley/Request:getCacheKey\011()Ljava/lang/String;
    //   236: aload 10
    //   238: getfield 165\011com/android/volley/Response:cacheEntry\011Lcom/android/volley/Cache$Entry;
    //   241: invokeinterface 174 3 0
    //   246: aload 4
    //   248: ldc 176
    //   250: invokevirtual 98\011com/android/volley/Request:addMarker\011(Ljava/lang/String;)V
    //   253: aload 4
    //   255: invokevirtual 179\011com/android/volley/Request:markDelivered\011()V
    //   258: aload_0
    //   259: getfield 30\011com/android/volley/NetworkDispatcher:mDelivery\011Lcom/android/volley/ResponseDelivery;
    //   262: aload 4
    //   264: aload 10
    //   266: invokeinterface 183 3 0
    //   271: goto -266 -> 5
    //
    // Exception table:
    //   from\011to\011target\011type
    //   23\01145\01148\011com/android/volley/VolleyError
    //   80\011129\01148\011com/android/volley/VolleyError
    //   195\011253\01148\011com/android/volley/VolleyError
    //   253\011271\01148\011com/android/volley/VolleyError
    //   9\01123\01171\011java/lang/InterruptedException
    //   23\01145\011132\011java/lang/Exception
    //   80\011129\011132\011java/lang/Exception
    //   195\011253\011132\011java/lang/Exception
    //   253\011271\011132\011java/lang/Exception
  }
}