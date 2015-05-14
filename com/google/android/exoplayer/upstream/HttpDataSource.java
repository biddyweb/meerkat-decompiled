package com.google.android.exoplayer.upstream;

import android.net.Uri;
import android.text.TextUtils;
import com.google.android.exoplayer.util.Assertions;
import com.google.android.exoplayer.util.Predicate;
import com.google.android.exoplayer.util.Util;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.regex.Pattern;

public class HttpDataSource
  implements DataSource
{
  private static final Pattern CONTENT_RANGE_HEADER = Pattern.compile("^bytes (\\d+)-(\\d+)/(\\d+)$");
  public static final int DEFAULT_CONNECT_TIMEOUT_MILLIS = 8000;
  public static final int DEFAULT_READ_TIMEOUT_MILLIS = 8000;
  public static final Predicate<String> REJECT_PAYWALL_TYPES = new Predicate()
  {
    public boolean evaluate(String paramAnonymousString)
    {
      String str = Util.toLowerInvariant(paramAnonymousString);
      return (!TextUtils.isEmpty(str)) && ((!str.contains("text")) || (str.contains("text/vtt"))) && (!str.contains("html")) && (!str.contains("xml"));
    }
  };
  private static final String TAG = "HttpDataSource";
  private long bytesRead;
  private final int connectTimeoutMillis;
  private HttpURLConnection connection;
  private final Predicate<String> contentTypePredicate;
  private long dataLength;
  private DataSpec dataSpec;
  private InputStream inputStream;
  private final TransferListener listener;
  private boolean opened;
  private final int readTimeoutMillis;
  private final HashMap<String, String> requestProperties;
  private final String userAgent;

  public HttpDataSource(String paramString, Predicate<String> paramPredicate)
  {
    this(paramString, paramPredicate, null);
  }

  public HttpDataSource(String paramString, Predicate<String> paramPredicate, TransferListener paramTransferListener)
  {
    this(paramString, paramPredicate, paramTransferListener, 8000, 8000);
  }

  public HttpDataSource(String paramString, Predicate<String> paramPredicate, TransferListener paramTransferListener, int paramInt1, int paramInt2)
  {
    this.userAgent = Assertions.checkNotEmpty(paramString);
    this.contentTypePredicate = paramPredicate;
    this.listener = paramTransferListener;
    this.requestProperties = new HashMap();
    this.connectTimeoutMillis = paramInt1;
    this.readTimeoutMillis = paramInt2;
  }

  private void closeConnection()
  {
    if (this.connection != null)
    {
      this.connection.disconnect();
      this.connection = null;
    }
  }

  // ERROR //
  private long getContentLength(HttpURLConnection paramHttpURLConnection)
  {
    // Byte code:
    //   0: ldc2_w 100
    //   3: lstore_2
    //   4: aload_1
    //   5: ldc 103
    //   7: invokevirtual 106\011java/net/HttpURLConnection:getHeaderField\011(Ljava/lang/String;)Ljava/lang/String;
    //   10: astore 4
    //   12: aload 4
    //   14: invokestatic 112\011android/text/TextUtils:isEmpty\011(Ljava/lang/CharSequence;)Z
    //   17: ifne +13 -> 30
    //   20: aload 4
    //   22: invokestatic 118\011java/lang/Long:parseLong\011(Ljava/lang/String;)J
    //   25: lstore 20
    //   27: lload 20
    //   29: lstore_2
    //   30: aload_1
    //   31: ldc 120
    //   33: invokevirtual 106\011java/net/HttpURLConnection:getHeaderField\011(Ljava/lang/String;)Ljava/lang/String;
    //   36: astore 5
    //   38: aload 5
    //   40: invokestatic 112\011android/text/TextUtils:isEmpty\011(Ljava/lang/CharSequence;)Z
    //   43: ifne +61 -> 104
    //   46: getstatic 58\011com/google/android/exoplayer/upstream/HttpDataSource:CONTENT_RANGE_HEADER\011Ljava/util/regex/Pattern;
    //   49: aload 5
    //   51: invokevirtual 124\011java/util/regex/Pattern:matcher\011(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;
    //   54: astore 6
    //   56: aload 6
    //   58: invokevirtual 130\011java/util/regex/Matcher:find\011()Z
    //   61: ifeq +43 -> 104
    //   64: aload 6
    //   66: iconst_2
    //   67: invokevirtual 134\011java/util/regex/Matcher:group\011(I)Ljava/lang/String;
    //   70: invokestatic 118\011java/lang/Long:parseLong\011(Ljava/lang/String;)J
    //   73: lstore 9
    //   75: aload 6
    //   77: iconst_1
    //   78: invokevirtual 134\011java/util/regex/Matcher:group\011(I)Ljava/lang/String;
    //   81: invokestatic 118\011java/lang/Long:parseLong\011(Ljava/lang/String;)J
    //   84: lstore 11
    //   86: lconst_1
    //   87: lload 9
    //   89: lload 11
    //   91: lsub
    //   92: ladd
    //   93: lstore 13
    //   95: lload_2
    //   96: lconst_0
    //   97: lcmp
    //   98: ifge +44 -> 142
    //   101: lload 13
    //   103: lstore_2
    //   104: lload_2
    //   105: lreturn
    //   106: astore 18
    //   108: ldc 19
    //   110: new 136\011java/lang/StringBuilder
    //   113: dup
    //   114: invokespecial 137\011java/lang/StringBuilder:<init>\011()V
    //   117: ldc 139
    //   119: invokevirtual 143\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   122: aload 4
    //   124: invokevirtual 143\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   127: ldc 145
    //   129: invokevirtual 143\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   132: invokevirtual 149\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
    //   135: invokestatic 155\011android/util/Log:e\011(Ljava/lang/String;Ljava/lang/String;)I
    //   138: pop
    //   139: goto -109 -> 30
    //   142: lload_2
    //   143: lload 13
    //   145: lcmp
    //   146: ifeq -42 -> 104
    //   149: ldc 19
    //   151: new 136\011java/lang/StringBuilder
    //   154: dup
    //   155: invokespecial 137\011java/lang/StringBuilder:<init>\011()V
    //   158: ldc 157
    //   160: invokevirtual 143\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   163: aload 4
    //   165: invokevirtual 143\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   168: ldc 159
    //   170: invokevirtual 143\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   173: aload 5
    //   175: invokevirtual 143\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   178: ldc 145
    //   180: invokevirtual 143\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   183: invokevirtual 149\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
    //   186: invokestatic 162\011android/util/Log:w\011(Ljava/lang/String;Ljava/lang/String;)I
    //   189: pop
    //   190: lload_2
    //   191: lload 13
    //   193: invokestatic 168\011java/lang/Math:max\011(JJ)J
    //   196: lstore 16
    //   198: lload 16
    //   200: lreturn
    //   201: astore 7
    //   203: ldc 19
    //   205: new 136\011java/lang/StringBuilder
    //   208: dup
    //   209: invokespecial 137\011java/lang/StringBuilder:<init>\011()V
    //   212: ldc 170
    //   214: invokevirtual 143\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   217: aload 5
    //   219: invokevirtual 143\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   222: ldc 145
    //   224: invokevirtual 143\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   227: invokevirtual 149\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
    //   230: invokestatic 155\011android/util/Log:e\011(Ljava/lang/String;Ljava/lang/String;)I
    //   233: pop
    //   234: lload_2
    //   235: lreturn
    //
    // Exception table:
    //   from\011to\011target\011type
    //   20\01127\011106\011java/lang/NumberFormatException
    //   64\01186\011201\011java/lang/NumberFormatException
    //   149\011198\011201\011java/lang/NumberFormatException
  }

  private HttpURLConnection makeConnection(DataSpec paramDataSpec)
    throws IOException
  {
    HttpURLConnection localHttpURLConnection = (HttpURLConnection)new URL(paramDataSpec.uri.toString()).openConnection();
    localHttpURLConnection.setConnectTimeout(this.connectTimeoutMillis);
    localHttpURLConnection.setReadTimeout(this.readTimeoutMillis);
    localHttpURLConnection.setDoOutput(false);
    synchronized (this.requestProperties)
    {
      Iterator localIterator = this.requestProperties.entrySet().iterator();
      if (localIterator.hasNext())
      {
        Map.Entry localEntry = (Map.Entry)localIterator.next();
        localHttpURLConnection.setRequestProperty((String)localEntry.getKey(), (String)localEntry.getValue());
      }
    }
    setRangeHeader(localHttpURLConnection, paramDataSpec);
    localHttpURLConnection.setRequestProperty("User-Agent", this.userAgent);
    localHttpURLConnection.connect();
    return localHttpURLConnection;
  }

  private void setRangeHeader(HttpURLConnection paramHttpURLConnection, DataSpec paramDataSpec)
  {
    if ((paramDataSpec.position == 0L) && (paramDataSpec.length == -1L))
      return;
    String str = "bytes=" + paramDataSpec.position + "-";
    if (paramDataSpec.length != -1L)
      str = str + (paramDataSpec.position + paramDataSpec.length - 1L);
    paramHttpURLConnection.setRequestProperty("Range", str);
  }

  protected final long bytesRead()
  {
    return this.bytesRead;
  }

  protected final long bytesRemaining()
  {
    if (this.dataLength == -1L)
      return this.dataLength;
    return this.dataLength - this.bytesRead;
  }

  public void clearAllRequestProperties()
  {
    synchronized (this.requestProperties)
    {
      this.requestProperties.clear();
      return;
    }
  }

  public void clearRequestProperty(String paramString)
  {
    Assertions.checkNotNull(paramString);
    synchronized (this.requestProperties)
    {
      this.requestProperties.remove(paramString);
      return;
    }
  }

  public void close()
    throws HttpDataSource.HttpDataSourceException
  {
    try
    {
      InputStream localInputStream = this.inputStream;
      if (localInputStream != null);
      try
      {
        this.inputStream.close();
        this.inputStream = null;
        return;
      }
      catch (IOException localIOException)
      {
        throw new HttpDataSourceException(localIOException, this.dataSpec);
      }
    }
    finally
    {
      if (this.opened)
      {
        this.opened = false;
        if (this.listener != null)
          this.listener.onTransferEnd();
        closeConnection();
      }
    }
  }

  protected final HttpURLConnection getConnection()
  {
    return this.connection;
  }

  // ERROR //
  public long open(DataSpec paramDataSpec)
    throws HttpDataSource.HttpDataSourceException
  {
    // Byte code:
    //   0: aload_0
    //   1: aload_1
    //   2: putfield 298\011com/google/android/exoplayer/upstream/HttpDataSource:dataSpec\011Lcom/google/android/exoplayer/upstream/DataSpec;
    //   5: aload_0
    //   6: lconst_0
    //   7: putfield 263\011com/google/android/exoplayer/upstream/HttpDataSource:bytesRead\011J
    //   10: aload_0
    //   11: aload_0
    //   12: aload_1
    //   13: invokespecial 307\011com/google/android/exoplayer/upstream/HttpDataSource:makeConnection\011(Lcom/google/android/exoplayer/upstream/DataSpec;)Ljava/net/HttpURLConnection;
    //   16: putfield 90\011com/google/android/exoplayer/upstream/HttpDataSource:connection\011Ljava/net/HttpURLConnection;
    //   19: aload_0
    //   20: getfield 90\011com/google/android/exoplayer/upstream/HttpDataSource:connection\011Ljava/net/HttpURLConnection;
    //   23: invokevirtual 311\011java/net/HttpURLConnection:getResponseCode\011()I
    //   26: istore 4
    //   28: iload 4
    //   30: sipush 200
    //   33: if_icmplt +11 -> 44
    //   36: iload 4
    //   38: sipush 299
    //   41: if_icmple +103 -> 144
    //   44: aload_0
    //   45: getfield 90\011com/google/android/exoplayer/upstream/HttpDataSource:connection\011Ljava/net/HttpURLConnection;
    //   48: invokevirtual 315\011java/net/HttpURLConnection:getHeaderFields\011()Ljava/util/Map;
    //   51: astore 5
    //   53: aload_0
    //   54: invokespecial 296\011com/google/android/exoplayer/upstream/HttpDataSource:closeConnection\011()V
    //   57: new 317\011com/google/android/exoplayer/upstream/HttpDataSource$InvalidResponseCodeException
    //   60: dup
    //   61: iload 4
    //   63: aload 5
    //   65: aload_1
    //   66: invokespecial 320\011com/google/android/exoplayer/upstream/HttpDataSource$InvalidResponseCodeException:<init>\011(ILjava/util/Map;Lcom/google/android/exoplayer/upstream/DataSpec;)V
    //   69: athrow
    //   70: astore_2
    //   71: new 281\011com/google/android/exoplayer/upstream/HttpDataSource$HttpDataSourceException
    //   74: dup
    //   75: new 136\011java/lang/StringBuilder
    //   78: dup
    //   79: invokespecial 137\011java/lang/StringBuilder:<init>\011()V
    //   82: ldc_w 322
    //   85: invokevirtual 143\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   88: aload_1
    //   89: getfield 182\011com/google/android/exoplayer/upstream/DataSpec:uri\011Landroid/net/Uri;
    //   92: invokevirtual 185\011android/net/Uri:toString\011()Ljava/lang/String;
    //   95: invokevirtual 143\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   98: invokevirtual 149\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
    //   101: aload_2
    //   102: aload_1
    //   103: invokespecial 325\011com/google/android/exoplayer/upstream/HttpDataSource$HttpDataSourceException:<init>\011(Ljava/lang/String;Ljava/io/IOException;Lcom/google/android/exoplayer/upstream/DataSpec;)V
    //   106: athrow
    //   107: astore_3
    //   108: new 281\011com/google/android/exoplayer/upstream/HttpDataSource$HttpDataSourceException
    //   111: dup
    //   112: new 136\011java/lang/StringBuilder
    //   115: dup
    //   116: invokespecial 137\011java/lang/StringBuilder:<init>\011()V
    //   119: ldc_w 322
    //   122: invokevirtual 143\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   125: aload_1
    //   126: getfield 182\011com/google/android/exoplayer/upstream/DataSpec:uri\011Landroid/net/Uri;
    //   129: invokevirtual 185\011android/net/Uri:toString\011()Ljava/lang/String;
    //   132: invokevirtual 143\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   135: invokevirtual 149\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
    //   138: aload_3
    //   139: aload_1
    //   140: invokespecial 325\011com/google/android/exoplayer/upstream/HttpDataSource$HttpDataSourceException:<init>\011(Ljava/lang/String;Ljava/io/IOException;Lcom/google/android/exoplayer/upstream/DataSpec;)V
    //   143: athrow
    //   144: aload_0
    //   145: getfield 90\011com/google/android/exoplayer/upstream/HttpDataSource:connection\011Ljava/net/HttpURLConnection;
    //   148: invokevirtual 328\011java/net/HttpURLConnection:getContentType\011()Ljava/lang/String;
    //   151: astore 6
    //   153: aload_0
    //   154: getfield 76\011com/google/android/exoplayer/upstream/HttpDataSource:contentTypePredicate\011Lcom/google/android/exoplayer/util/Predicate;
    //   157: ifnull +32 -> 189
    //   160: aload_0
    //   161: getfield 76\011com/google/android/exoplayer/upstream/HttpDataSource:contentTypePredicate\011Lcom/google/android/exoplayer/util/Predicate;
    //   164: aload 6
    //   166: invokeinterface 334 2 0
    //   171: ifne +18 -> 189
    //   174: aload_0
    //   175: invokespecial 296\011com/google/android/exoplayer/upstream/HttpDataSource:closeConnection\011()V
    //   178: new 336\011com/google/android/exoplayer/upstream/HttpDataSource$InvalidContentTypeException
    //   181: dup
    //   182: aload 6
    //   184: aload_1
    //   185: invokespecial 339\011com/google/android/exoplayer/upstream/HttpDataSource$InvalidContentTypeException:<init>\011(Ljava/lang/String;Lcom/google/android/exoplayer/upstream/DataSpec;)V
    //   188: athrow
    //   189: aload_0
    //   190: aload_0
    //   191: getfield 90\011com/google/android/exoplayer/upstream/HttpDataSource:connection\011Ljava/net/HttpURLConnection;
    //   194: invokespecial 341\011com/google/android/exoplayer/upstream/HttpDataSource:getContentLength\011(Ljava/net/HttpURLConnection;)J
    //   197: lstore 7
    //   199: aload_1
    //   200: getfield 251\011com/google/android/exoplayer/upstream/DataSpec:length\011J
    //   203: ldc2_w 100
    //   206: lcmp
    //   207: ifne +69 -> 276
    //   210: lload 7
    //   212: lstore 9
    //   214: aload_0
    //   215: lload 9
    //   217: putfield 266\011com/google/android/exoplayer/upstream/HttpDataSource:dataLength\011J
    //   220: aload_1
    //   221: getfield 251\011com/google/android/exoplayer/upstream/DataSpec:length\011J
    //   224: ldc2_w 100
    //   227: lcmp
    //   228: ifeq +57 -> 285
    //   231: lload 7
    //   233: ldc2_w 100
    //   236: lcmp
    //   237: ifeq +48 -> 285
    //   240: lload 7
    //   242: aload_1
    //   243: getfield 251\011com/google/android/exoplayer/upstream/DataSpec:length\011J
    //   246: lcmp
    //   247: ifeq +38 -> 285
    //   250: aload_0
    //   251: invokespecial 296\011com/google/android/exoplayer/upstream/HttpDataSource:closeConnection\011()V
    //   254: new 281\011com/google/android/exoplayer/upstream/HttpDataSource$HttpDataSourceException
    //   257: dup
    //   258: new 343\011com/google/android/exoplayer/upstream/UnexpectedLengthException
    //   261: dup
    //   262: aload_1
    //   263: getfield 251\011com/google/android/exoplayer/upstream/DataSpec:length\011J
    //   266: lload 7
    //   268: invokespecial 346\011com/google/android/exoplayer/upstream/UnexpectedLengthException:<init>\011(JJ)V
    //   271: aload_1
    //   272: invokespecial 301\011com/google/android/exoplayer/upstream/HttpDataSource$HttpDataSourceException:<init>\011(Ljava/io/IOException;Lcom/google/android/exoplayer/upstream/DataSpec;)V
    //   275: athrow
    //   276: aload_1
    //   277: getfield 251\011com/google/android/exoplayer/upstream/DataSpec:length\011J
    //   280: lstore 9
    //   282: goto -68 -> 214
    //   285: aload_0
    //   286: aload_0
    //   287: getfield 90\011com/google/android/exoplayer/upstream/HttpDataSource:connection\011Ljava/net/HttpURLConnection;
    //   290: invokevirtual 350\011java/net/HttpURLConnection:getInputStream\011()Ljava/io/InputStream;
    //   293: putfield 283\011com/google/android/exoplayer/upstream/HttpDataSource:inputStream\011Ljava/io/InputStream;
    //   296: aload_0
    //   297: iconst_1
    //   298: putfield 289\011com/google/android/exoplayer/upstream/HttpDataSource:opened\011Z
    //   301: aload_0
    //   302: getfield 78\011com/google/android/exoplayer/upstream/HttpDataSource:listener\011Lcom/google/android/exoplayer/upstream/TransferListener;
    //   305: ifnull +12 -> 317
    //   308: aload_0
    //   309: getfield 78\011com/google/android/exoplayer/upstream/HttpDataSource:listener\011Lcom/google/android/exoplayer/upstream/TransferListener;
    //   312: invokeinterface 353 1 0
    //   317: aload_0
    //   318: getfield 266\011com/google/android/exoplayer/upstream/HttpDataSource:dataLength\011J
    //   321: lreturn
    //   322: astore 11
    //   324: aload_0
    //   325: invokespecial 296\011com/google/android/exoplayer/upstream/HttpDataSource:closeConnection\011()V
    //   328: new 281\011com/google/android/exoplayer/upstream/HttpDataSource$HttpDataSourceException
    //   331: dup
    //   332: aload 11
    //   334: aload_1
    //   335: invokespecial 301\011com/google/android/exoplayer/upstream/HttpDataSource$HttpDataSourceException:<init>\011(Ljava/io/IOException;Lcom/google/android/exoplayer/upstream/DataSpec;)V
    //   338: athrow
    //
    // Exception table:
    //   from\011to\011target\011type
    //   10\01119\01170\011java/io/IOException
    //   19\01128\011107\011java/io/IOException
    //   285\011296\011322\011java/io/IOException
  }

  public int read(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws HttpDataSource.HttpDataSourceException
  {
    do
      try
      {
        int i = this.inputStream.read(paramArrayOfByte, paramInt1, paramInt2);
        if (i > 0)
        {
          this.bytesRead += i;
          if (this.listener != null)
            this.listener.onBytesTransferred(i);
          return i;
        }
      }
      catch (IOException localIOException)
      {
        throw new HttpDataSourceException(localIOException, this.dataSpec);
      }
    while ((this.dataLength == -1L) || (this.dataLength == this.bytesRead));
    throw new HttpDataSourceException(new UnexpectedLengthException(this.dataLength, this.bytesRead), this.dataSpec);
  }

  public void setRequestProperty(String paramString1, String paramString2)
  {
    Assertions.checkNotNull(paramString1);
    Assertions.checkNotNull(paramString2);
    synchronized (this.requestProperties)
    {
      this.requestProperties.put(paramString1, paramString2);
      return;
    }
  }

  public static class HttpDataSourceException extends IOException
  {
    public final DataSpec dataSpec;

    public HttpDataSourceException(DataSpec paramDataSpec)
    {
      this.dataSpec = paramDataSpec;
    }

    public HttpDataSourceException(IOException paramIOException, DataSpec paramDataSpec)
    {
      super();
      this.dataSpec = paramDataSpec;
    }

    public HttpDataSourceException(String paramString, DataSpec paramDataSpec)
    {
      super();
      this.dataSpec = paramDataSpec;
    }

    public HttpDataSourceException(String paramString, IOException paramIOException, DataSpec paramDataSpec)
    {
      super(paramIOException);
      this.dataSpec = paramDataSpec;
    }
  }

  public static final class InvalidContentTypeException extends HttpDataSource.HttpDataSourceException
  {
    public final String contentType;

    public InvalidContentTypeException(String paramString, DataSpec paramDataSpec)
    {
      super(paramDataSpec);
      this.contentType = paramString;
    }
  }

  public static final class InvalidResponseCodeException extends HttpDataSource.HttpDataSourceException
  {
    public final Map<String, List<String>> headerFields;
    public final int responseCode;

    public InvalidResponseCodeException(int paramInt, Map<String, List<String>> paramMap, DataSpec paramDataSpec)
    {
      super(paramDataSpec);
      this.responseCode = paramInt;
      this.headerFields = paramMap;
    }
  }
}