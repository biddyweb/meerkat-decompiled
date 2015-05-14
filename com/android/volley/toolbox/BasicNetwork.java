package com.android.volley.toolbox;

import android.os.SystemClock;
import com.android.volley.Cache.Entry;
import com.android.volley.Network;
import com.android.volley.Request;
import com.android.volley.RetryPolicy;
import com.android.volley.ServerError;
import com.android.volley.VolleyError;
import com.android.volley.VolleyLog;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.Map;
import java.util.TreeMap;
import org.apache.http.Header;
import org.apache.http.HttpEntity;
import org.apache.http.StatusLine;
import org.apache.http.impl.cookie.DateUtils;

public class BasicNetwork
  implements Network
{
  protected static final boolean DEBUG = VolleyLog.DEBUG;
  private static int DEFAULT_POOL_SIZE = 4096;
  private static int SLOW_REQUEST_THRESHOLD_MS = 3000;
  protected final HttpStack mHttpStack;
  protected final ByteArrayPool mPool;

  public BasicNetwork(HttpStack paramHttpStack)
  {
    this(paramHttpStack, new ByteArrayPool(DEFAULT_POOL_SIZE));
  }

  public BasicNetwork(HttpStack paramHttpStack, ByteArrayPool paramByteArrayPool)
  {
    this.mHttpStack = paramHttpStack;
    this.mPool = paramByteArrayPool;
  }

  private void addCacheHeaders(Map<String, String> paramMap, Cache.Entry paramEntry)
  {
    if (paramEntry == null);
    do
    {
      return;
      if (paramEntry.etag != null)
        paramMap.put("If-None-Match", paramEntry.etag);
    }
    while (paramEntry.lastModified <= 0L);
    paramMap.put("If-Modified-Since", DateUtils.formatDate(new Date(paramEntry.lastModified)));
  }

  private static void attemptRetryOnException(String paramString, Request<?> paramRequest, VolleyError paramVolleyError)
    throws VolleyError
  {
    RetryPolicy localRetryPolicy = paramRequest.getRetryPolicy();
    int i = paramRequest.getTimeoutMs();
    try
    {
      localRetryPolicy.retry(paramVolleyError);
      Object[] arrayOfObject2 = new Object[2];
      arrayOfObject2[0] = paramString;
      arrayOfObject2[1] = Integer.valueOf(i);
      paramRequest.addMarker(String.format("%s-retry [timeout=%s]", arrayOfObject2));
      return;
    }
    catch (VolleyError localVolleyError)
    {
      Object[] arrayOfObject1 = new Object[2];
      arrayOfObject1[0] = paramString;
      arrayOfObject1[1] = Integer.valueOf(i);
      paramRequest.addMarker(String.format("%s-timeout-giveup [timeout=%s]", arrayOfObject1));
      throw localVolleyError;
    }
  }

  protected static Map<String, String> convertHeaders(Header[] paramArrayOfHeader)
  {
    TreeMap localTreeMap = new TreeMap(String.CASE_INSENSITIVE_ORDER);
    for (int i = 0; i < paramArrayOfHeader.length; i++)
      localTreeMap.put(paramArrayOfHeader[i].getName(), paramArrayOfHeader[i].getValue());
    return localTreeMap;
  }

  private byte[] entityToBytes(HttpEntity paramHttpEntity)
    throws IOException, ServerError
  {
    PoolingByteArrayOutputStream localPoolingByteArrayOutputStream = new PoolingByteArrayOutputStream(this.mPool, (int)paramHttpEntity.getContentLength());
    byte[] arrayOfByte1 = null;
    InputStream localInputStream;
    try
    {
      localInputStream = paramHttpEntity.getContent();
      arrayOfByte1 = null;
      if (localInputStream == null)
        throw new ServerError();
    }
    finally
    {
    }
    try
    {
      paramHttpEntity.consumeContent();
      this.mPool.returnBuf(arrayOfByte1);
      localPoolingByteArrayOutputStream.close();
      throw localObject;
      arrayOfByte1 = this.mPool.getBuf(1024);
      while (true)
      {
        int i = localInputStream.read(arrayOfByte1);
        if (i == -1)
          break;
        localPoolingByteArrayOutputStream.write(arrayOfByte1, 0, i);
      }
      byte[] arrayOfByte2 = localPoolingByteArrayOutputStream.toByteArray();
      try
      {
        paramHttpEntity.consumeContent();
        this.mPool.returnBuf(arrayOfByte1);
        localPoolingByteArrayOutputStream.close();
        return arrayOfByte2;
      }
      catch (IOException localIOException2)
      {
        while (true)
          VolleyLog.v("Error occured when calling consumingContent", new Object[0]);
      }
    }
    catch (IOException localIOException1)
    {
      while (true)
        VolleyLog.v("Error occured when calling consumingContent", new Object[0]);
    }
  }

  private void logSlowRequests(long paramLong, Request<?> paramRequest, byte[] paramArrayOfByte, StatusLine paramStatusLine)
  {
    Object[] arrayOfObject;
    if ((DEBUG) || (paramLong > SLOW_REQUEST_THRESHOLD_MS))
    {
      arrayOfObject = new Object[5];
      arrayOfObject[0] = paramRequest;
      arrayOfObject[1] = Long.valueOf(paramLong);
      if (paramArrayOfByte == null)
        break label91;
    }
    label91: for (Object localObject = Integer.valueOf(paramArrayOfByte.length); ; localObject = "null")
    {
      arrayOfObject[2] = localObject;
      arrayOfObject[3] = Integer.valueOf(paramStatusLine.getStatusCode());
      arrayOfObject[4] = Integer.valueOf(paramRequest.getRetryPolicy().getCurrentRetryCount());
      VolleyLog.d("HTTP response for request=<%s> [lifetime=%d], [size=%s], [rc=%d], [retryCount=%s]", arrayOfObject);
      return;
    }
  }

  protected void logError(String paramString1, String paramString2, long paramLong)
  {
    long l = SystemClock.elapsedRealtime();
    Object[] arrayOfObject = new Object[3];
    arrayOfObject[0] = paramString1;
    arrayOfObject[1] = Long.valueOf(l - paramLong);
    arrayOfObject[2] = paramString2;
    VolleyLog.v("HTTP ERROR(%s) %d ms to fetch %s", arrayOfObject);
  }

  // ERROR //
  public com.android.volley.NetworkResponse performRequest(Request<?> paramRequest)
    throws VolleyError
  {
    // Byte code:
    //   0: invokestatic 220\011android/os/SystemClock:elapsedRealtime\011()J
    //   3: lstore_2
    //   4: aconst_null
    //   5: astore 4
    //   7: invokestatic 236\011java/util/Collections:emptyMap\011()Ljava/util/Map;
    //   10: astore 5
    //   12: new 238\011java/util/HashMap
    //   15: dup
    //   16: invokespecial 239\011java/util/HashMap:<init>\011()V
    //   19: astore 6
    //   21: aload_0
    //   22: aload 6
    //   24: aload_1
    //   25: invokevirtual 243\011com/android/volley/Request:getCacheEntry\011()Lcom/android/volley/Cache$Entry;
    //   28: invokespecial 245\011com/android/volley/toolbox/BasicNetwork:addCacheHeaders\011(Ljava/util/Map;Lcom/android/volley/Cache$Entry;)V
    //   31: aload_0
    //   32: getfield 40\011com/android/volley/toolbox/BasicNetwork:mHttpStack\011Lcom/android/volley/toolbox/HttpStack;
    //   35: aload_1
    //   36: aload 6
    //   38: invokeinterface 250 3 0
    //   43: astore 4
    //   45: aload 4
    //   47: invokeinterface 256 1 0
    //   52: astore 18
    //   54: aload 18
    //   56: invokeinterface 203 1 0
    //   61: istore 19
    //   63: aload 4
    //   65: invokeinterface 260 1 0
    //   70: invokestatic 262\011com/android/volley/toolbox/BasicNetwork:convertHeaders\011([Lorg/apache/http/Header;)Ljava/util/Map;
    //   73: astore 5
    //   75: iload 19
    //   77: sipush 304
    //   80: if_icmpne +517 -> 597
    //   83: aload_1
    //   84: invokevirtual 243\011com/android/volley/Request:getCacheEntry\011()Lcom/android/volley/Cache$Entry;
    //   87: astore 20
    //   89: aload 20
    //   91: ifnonnull +23 -> 114
    //   94: new 264\011com/android/volley/NetworkResponse
    //   97: dup
    //   98: sipush 304
    //   101: aconst_null
    //   102: aload 5
    //   104: iconst_1
    //   105: invokestatic 220\011android/os/SystemClock:elapsedRealtime\011()J
    //   108: lload_2
    //   109: lsub
    //   110: invokespecial 267\011com/android/volley/NetworkResponse:<init>\011(I[BLjava/util/Map;ZJ)V
    //   113: areturn
    //   114: aload 20
    //   116: getfield 271\011com/android/volley/Cache$Entry:responseHeaders\011Ljava/util/Map;
    //   119: aload 5
    //   121: invokeinterface 275 2 0
    //   126: new 264\011com/android/volley/NetworkResponse
    //   129: dup
    //   130: sipush 304
    //   133: aload 20
    //   135: getfield 279\011com/android/volley/Cache$Entry:data\011[B
    //   138: aload 20
    //   140: getfield 271\011com/android/volley/Cache$Entry:responseHeaders\011Ljava/util/Map;
    //   143: iconst_1
    //   144: invokestatic 220\011android/os/SystemClock:elapsedRealtime\011()J
    //   147: lload_2
    //   148: lsub
    //   149: invokespecial 267\011com/android/volley/NetworkResponse:<init>\011(I[BLjava/util/Map;ZJ)V
    //   152: areturn
    //   153: aload_1
    //   154: aload 5
    //   156: ldc_w 281
    //   159: invokeinterface 285 2 0
    //   164: checkcast 105\011java/lang/String
    //   167: invokevirtual 288\011com/android/volley/Request:setRedirectUrl\011(Ljava/lang/String;)V
    //   170: aload 4
    //   172: invokeinterface 292 1 0
    //   177: ifnull +77 -> 254
    //   180: aload_0
    //   181: aload 4
    //   183: invokeinterface 292 1 0
    //   188: invokespecial 294\011com/android/volley/toolbox/BasicNetwork:entityToBytes\011(Lorg/apache/http/HttpEntity;)[B
    //   191: astore 26
    //   193: aload 26
    //   195: astore 9
    //   197: aload_0
    //   198: invokestatic 220\011android/os/SystemClock:elapsedRealtime\011()J
    //   201: lload_2
    //   202: lsub
    //   203: aload_1
    //   204: aload 9
    //   206: aload 18
    //   208: invokespecial 296\011com/android/volley/toolbox/BasicNetwork:logSlowRequests\011(JLcom/android/volley/Request;[BLorg/apache/http/StatusLine;)V
    //   211: iload 19
    //   213: sipush 200
    //   216: if_icmplt +11 -> 227
    //   219: iload 19
    //   221: sipush 299
    //   224: if_icmple +38 -> 262
    //   227: new 139\011java/io/IOException
    //   230: dup
    //   231: invokespecial 297\011java/io/IOException:<init>\011()V
    //   234: athrow
    //   235: astore 22
    //   237: ldc_w 299
    //   240: aload_1
    //   241: new 301\011com/android/volley/TimeoutError
    //   244: dup
    //   245: invokespecial 302\011com/android/volley/TimeoutError:<init>\011()V
    //   248: invokestatic 304\011com/android/volley/toolbox/BasicNetwork:attemptRetryOnException\011(Ljava/lang/String;Lcom/android/volley/Request;Lcom/android/volley/VolleyError;)V
    //   251: goto -247 -> 4
    //   254: iconst_0
    //   255: newarray byte
    //   257: astore 9
    //   259: goto -62 -> 197
    //   262: invokestatic 220\011android/os/SystemClock:elapsedRealtime\011()J
    //   265: lload_2
    //   266: lsub
    //   267: lstore 23
    //   269: new 264\011com/android/volley/NetworkResponse
    //   272: dup
    //   273: iload 19
    //   275: aload 9
    //   277: aload 5
    //   279: iconst_0
    //   280: lload 23
    //   282: invokespecial 267\011com/android/volley/NetworkResponse:<init>\011(I[BLjava/util/Map;ZJ)V
    //   285: astore 25
    //   287: aload 25
    //   289: areturn
    //   290: astore 17
    //   292: ldc_w 306
    //   295: aload_1
    //   296: new 301\011com/android/volley/TimeoutError
    //   299: dup
    //   300: invokespecial 302\011com/android/volley/TimeoutError:<init>\011()V
    //   303: invokestatic 304\011com/android/volley/toolbox/BasicNetwork:attemptRetryOnException\011(Ljava/lang/String;Lcom/android/volley/Request;Lcom/android/volley/VolleyError;)V
    //   306: goto -302 -> 4
    //   309: astore 16
    //   311: new 308\011java/lang/RuntimeException
    //   314: dup
    //   315: new 310\011java/lang/StringBuilder
    //   318: dup
    //   319: invokespecial 311\011java/lang/StringBuilder:<init>\011()V
    //   322: ldc_w 313
    //   325: invokevirtual 317\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   328: aload_1
    //   329: invokevirtual 320\011com/android/volley/Request:getUrl\011()Ljava/lang/String;
    //   332: invokevirtual 317\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   335: invokevirtual 323\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
    //   338: aload 16
    //   340: invokespecial 326\011java/lang/RuntimeException:<init>\011(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   343: athrow
    //   344: astore 8
    //   346: aconst_null
    //   347: astore 9
    //   349: aload 4
    //   351: ifnull +128 -> 479
    //   354: aload 4
    //   356: invokeinterface 256 1 0
    //   361: invokeinterface 203 1 0
    //   366: istore 10
    //   368: iload 10
    //   370: sipush 301
    //   373: if_icmpeq +11 -> 384
    //   376: iload 10
    //   378: sipush 302
    //   381: if_icmpne +108 -> 489
    //   384: iconst_2
    //   385: anewarray 4\011java/lang/Object
    //   388: astore 11
    //   390: aload 11
    //   392: iconst_0
    //   393: aload_1
    //   394: invokevirtual 329\011com/android/volley/Request:getOriginUrl\011()Ljava/lang/String;
    //   397: aastore
    //   398: aload 11
    //   400: iconst_1
    //   401: aload_1
    //   402: invokevirtual 320\011com/android/volley/Request:getUrl\011()Ljava/lang/String;
    //   405: aastore
    //   406: ldc_w 331
    //   409: aload 11
    //   411: invokestatic 334\011com/android/volley/VolleyLog:e\011(Ljava/lang/String;[Ljava/lang/Object;)V
    //   414: aload 9
    //   416: ifnull +152 -> 568
    //   419: invokestatic 220\011android/os/SystemClock:elapsedRealtime\011()J
    //   422: lload_2
    //   423: lsub
    //   424: lstore 12
    //   426: new 264\011com/android/volley/NetworkResponse
    //   429: dup
    //   430: iload 10
    //   432: aload 9
    //   434: aload 5
    //   436: iconst_0
    //   437: lload 12
    //   439: invokespecial 267\011com/android/volley/NetworkResponse:<init>\011(I[BLjava/util/Map;ZJ)V
    //   442: astore 14
    //   444: iload 10
    //   446: sipush 401
    //   449: if_icmpeq +11 -> 460
    //   452: iload 10
    //   454: sipush 403
    //   457: if_icmpne +66 -> 523
    //   460: ldc_w 336
    //   463: aload_1
    //   464: new 338\011com/android/volley/AuthFailureError
    //   467: dup
    //   468: aload 14
    //   470: invokespecial 341\011com/android/volley/AuthFailureError:<init>\011(Lcom/android/volley/NetworkResponse;)V
    //   473: invokestatic 304\011com/android/volley/toolbox/BasicNetwork:attemptRetryOnException\011(Ljava/lang/String;Lcom/android/volley/Request;Lcom/android/volley/VolleyError;)V
    //   476: goto -472 -> 4
    //   479: new 343\011com/android/volley/NoConnectionError
    //   482: dup
    //   483: aload 8
    //   485: invokespecial 346\011com/android/volley/NoConnectionError:<init>\011(Ljava/lang/Throwable;)V
    //   488: athrow
    //   489: iconst_2
    //   490: anewarray 4\011java/lang/Object
    //   493: astore 15
    //   495: aload 15
    //   497: iconst_0
    //   498: iload 10
    //   500: invokestatic 101\011java/lang/Integer:valueOf\011(I)Ljava/lang/Integer;
    //   503: aastore
    //   504: aload 15
    //   506: iconst_1
    //   507: aload_1
    //   508: invokevirtual 320\011com/android/volley/Request:getUrl\011()Ljava/lang/String;
    //   511: aastore
    //   512: ldc_w 348
    //   515: aload 15
    //   517: invokestatic 334\011com/android/volley/VolleyLog:e\011(Ljava/lang/String;[Ljava/lang/Object;)V
    //   520: goto -106 -> 414
    //   523: iload 10
    //   525: sipush 301
    //   528: if_icmpeq +11 -> 539
    //   531: iload 10
    //   533: sipush 302
    //   536: if_icmpne +22 -> 558
    //   539: ldc_w 350
    //   542: aload_1
    //   543: new 338\011com/android/volley/AuthFailureError
    //   546: dup
    //   547: aload 14
    //   549: invokespecial 341\011com/android/volley/AuthFailureError:<init>\011(Lcom/android/volley/NetworkResponse;)V
    //   552: invokestatic 304\011com/android/volley/toolbox/BasicNetwork:attemptRetryOnException\011(Ljava/lang/String;Lcom/android/volley/Request;Lcom/android/volley/VolleyError;)V
    //   555: goto -551 -> 4
    //   558: new 141\011com/android/volley/ServerError
    //   561: dup
    //   562: aload 14
    //   564: invokespecial 351\011com/android/volley/ServerError:<init>\011(Lcom/android/volley/NetworkResponse;)V
    //   567: athrow
    //   568: new 353\011com/android/volley/NetworkError
    //   571: dup
    //   572: aconst_null
    //   573: invokespecial 354\011com/android/volley/NetworkError:<init>\011(Lcom/android/volley/NetworkResponse;)V
    //   576: athrow
    //   577: astore 8
    //   579: goto -230 -> 349
    //   582: astore 16
    //   584: goto -273 -> 311
    //   587: astore 21
    //   589: goto -297 -> 292
    //   592: astore 7
    //   594: goto -357 -> 237
    //   597: iload 19
    //   599: sipush 301
    //   602: if_icmpeq -449 -> 153
    //   605: iload 19
    //   607: sipush 302
    //   610: if_icmpne -440 -> 170
    //   613: goto -460 -> 153
    //
    // Exception table:
    //   from\011to\011target\011type
    //   197\011211\011235\011java/net/SocketTimeoutException
    //   227\011235\011235\011java/net/SocketTimeoutException
    //   262\011287\011235\011java/net/SocketTimeoutException
    //   12\01175\011290\011org/apache/http/conn/ConnectTimeoutException
    //   83\01189\011290\011org/apache/http/conn/ConnectTimeoutException
    //   94\011114\011290\011org/apache/http/conn/ConnectTimeoutException
    //   114\011153\011290\011org/apache/http/conn/ConnectTimeoutException
    //   153\011170\011290\011org/apache/http/conn/ConnectTimeoutException
    //   170\011193\011290\011org/apache/http/conn/ConnectTimeoutException
    //   254\011259\011290\011org/apache/http/conn/ConnectTimeoutException
    //   12\01175\011309\011java/net/MalformedURLException
    //   83\01189\011309\011java/net/MalformedURLException
    //   94\011114\011309\011java/net/MalformedURLException
    //   114\011153\011309\011java/net/MalformedURLException
    //   153\011170\011309\011java/net/MalformedURLException
    //   170\011193\011309\011java/net/MalformedURLException
    //   254\011259\011309\011java/net/MalformedURLException
    //   12\01175\011344\011java/io/IOException
    //   83\01189\011344\011java/io/IOException
    //   94\011114\011344\011java/io/IOException
    //   114\011153\011344\011java/io/IOException
    //   153\011170\011344\011java/io/IOException
    //   170\011193\011344\011java/io/IOException
    //   254\011259\011344\011java/io/IOException
    //   197\011211\011577\011java/io/IOException
    //   227\011235\011577\011java/io/IOException
    //   262\011287\011577\011java/io/IOException
    //   197\011211\011582\011java/net/MalformedURLException
    //   227\011235\011582\011java/net/MalformedURLException
    //   262\011287\011582\011java/net/MalformedURLException
    //   197\011211\011587\011org/apache/http/conn/ConnectTimeoutException
    //   227\011235\011587\011org/apache/http/conn/ConnectTimeoutException
    //   262\011287\011587\011org/apache/http/conn/ConnectTimeoutException
    //   12\01175\011592\011java/net/SocketTimeoutException
    //   83\01189\011592\011java/net/SocketTimeoutException
    //   94\011114\011592\011java/net/SocketTimeoutException
    //   114\011153\011592\011java/net/SocketTimeoutException
    //   153\011170\011592\011java/net/SocketTimeoutException
    //   170\011193\011592\011java/net/SocketTimeoutException
    //   254\011259\011592\011java/net/SocketTimeoutException
  }
}