package com.android.volley.toolbox;

import android.os.SystemClock;
import com.android.volley.Cache;
import com.android.volley.Cache.Entry;
import com.android.volley.VolleyLog;
import java.io.EOFException;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

public class DiskBasedCache
  implements Cache
{
  private static final int CACHE_MAGIC = 538247942;
  private static final int DEFAULT_DISK_USAGE_BYTES = 5242880;
  private static final float HYSTERESIS_FACTOR = 0.9F;
  private final Map<String, CacheHeader> mEntries = new LinkedHashMap(16, 0.75F, true);
  private final int mMaxCacheSizeInBytes;
  private final File mRootDirectory;
  private long mTotalSize = 0L;

  public DiskBasedCache(File paramFile)
  {
    this(paramFile, 5242880);
  }

  public DiskBasedCache(File paramFile, int paramInt)
  {
    this.mRootDirectory = paramFile;
    this.mMaxCacheSizeInBytes = paramInt;
  }

  private String getFilenameForKey(String paramString)
  {
    int i = paramString.length() / 2;
    String str = String.valueOf(paramString.substring(0, i).hashCode());
    return str + String.valueOf(paramString.substring(i).hashCode());
  }

  private void pruneIfNeeded(int paramInt)
  {
    if (this.mTotalSize + paramInt < this.mMaxCacheSizeInBytes)
      return;
    if (VolleyLog.DEBUG)
      VolleyLog.v("Pruning old cache entries.", new Object[0]);
    long l1 = this.mTotalSize;
    int i = 0;
    long l2 = SystemClock.elapsedRealtime();
    Iterator localIterator = this.mEntries.entrySet().iterator();
    label61: CacheHeader localCacheHeader;
    if (localIterator.hasNext())
    {
      localCacheHeader = (CacheHeader)((Map.Entry)localIterator.next()).getValue();
      if (!getFileForKey(localCacheHeader.key).delete())
        break label205;
      this.mTotalSize -= localCacheHeader.size;
    }
    while (true)
    {
      localIterator.remove();
      i++;
      if ((float)(this.mTotalSize + paramInt) >= 0.9F * this.mMaxCacheSizeInBytes)
        break label61;
      if (!VolleyLog.DEBUG)
        break;
      Object[] arrayOfObject1 = new Object[3];
      arrayOfObject1[0] = Integer.valueOf(i);
      arrayOfObject1[1] = Long.valueOf(this.mTotalSize - l1);
      arrayOfObject1[2] = Long.valueOf(SystemClock.elapsedRealtime() - l2);
      VolleyLog.v("pruned %d files, %d bytes, %d ms", arrayOfObject1);
      return;
      label205: Object[] arrayOfObject2 = new Object[2];
      arrayOfObject2[0] = localCacheHeader.key;
      arrayOfObject2[1] = getFilenameForKey(localCacheHeader.key);
      VolleyLog.d("Could not delete cache entry for key=%s, filename=%s", arrayOfObject2);
    }
  }

  private void putEntry(String paramString, CacheHeader paramCacheHeader)
  {
    if (!this.mEntries.containsKey(paramString));
    CacheHeader localCacheHeader;
    for (this.mTotalSize += paramCacheHeader.size; ; this.mTotalSize += paramCacheHeader.size - localCacheHeader.size)
    {
      this.mEntries.put(paramString, paramCacheHeader);
      return;
      localCacheHeader = (CacheHeader)this.mEntries.get(paramString);
    }
  }

  private static int read(InputStream paramInputStream)
    throws IOException
  {
    int i = paramInputStream.read();
    if (i == -1)
      throw new EOFException();
    return i;
  }

  static int readInt(InputStream paramInputStream)
    throws IOException
  {
    return 0x0 | read(paramInputStream) << 0 | read(paramInputStream) << 8 | read(paramInputStream) << 16 | read(paramInputStream) << 24;
  }

  static long readLong(InputStream paramInputStream)
    throws IOException
  {
    return 0L | (0xFF & read(paramInputStream)) << 0 | (0xFF & read(paramInputStream)) << 8 | (0xFF & read(paramInputStream)) << 16 | (0xFF & read(paramInputStream)) << 24 | (0xFF & read(paramInputStream)) << 32 | (0xFF & read(paramInputStream)) << 40 | (0xFF & read(paramInputStream)) << 48 | (0xFF & read(paramInputStream)) << 56;
  }

  static String readString(InputStream paramInputStream)
    throws IOException
  {
    return new String(streamToBytes(paramInputStream, (int)readLong(paramInputStream)), "UTF-8");
  }

  static Map<String, String> readStringStringMap(InputStream paramInputStream)
    throws IOException
  {
    int i = readInt(paramInputStream);
    if (i == 0);
    for (Object localObject = Collections.emptyMap(); ; localObject = new HashMap(i))
      for (int j = 0; j < i; j++)
        ((Map)localObject).put(readString(paramInputStream).intern(), readString(paramInputStream).intern());
    return localObject;
  }

  private void removeEntry(String paramString)
  {
    CacheHeader localCacheHeader = (CacheHeader)this.mEntries.get(paramString);
    if (localCacheHeader != null)
    {
      this.mTotalSize -= localCacheHeader.size;
      this.mEntries.remove(paramString);
    }
  }

  private static byte[] streamToBytes(InputStream paramInputStream, int paramInt)
    throws IOException
  {
    byte[] arrayOfByte = new byte[paramInt];
    int i = 0;
    while (i < paramInt)
    {
      int j = paramInputStream.read(arrayOfByte, i, paramInt - i);
      if (j == -1)
        break;
      i += j;
    }
    if (i != paramInt)
      throw new IOException("Expected " + paramInt + " bytes, read " + i + " bytes");
    return arrayOfByte;
  }

  static void writeInt(OutputStream paramOutputStream, int paramInt)
    throws IOException
  {
    paramOutputStream.write(0xFF & paramInt >> 0);
    paramOutputStream.write(0xFF & paramInt >> 8);
    paramOutputStream.write(0xFF & paramInt >> 16);
    paramOutputStream.write(0xFF & paramInt >> 24);
  }

  static void writeLong(OutputStream paramOutputStream, long paramLong)
    throws IOException
  {
    paramOutputStream.write((byte)(int)(paramLong >>> 0));
    paramOutputStream.write((byte)(int)(paramLong >>> 8));
    paramOutputStream.write((byte)(int)(paramLong >>> 16));
    paramOutputStream.write((byte)(int)(paramLong >>> 24));
    paramOutputStream.write((byte)(int)(paramLong >>> 32));
    paramOutputStream.write((byte)(int)(paramLong >>> 40));
    paramOutputStream.write((byte)(int)(paramLong >>> 48));
    paramOutputStream.write((byte)(int)(paramLong >>> 56));
  }

  static void writeString(OutputStream paramOutputStream, String paramString)
    throws IOException
  {
    byte[] arrayOfByte = paramString.getBytes("UTF-8");
    writeLong(paramOutputStream, arrayOfByte.length);
    paramOutputStream.write(arrayOfByte, 0, arrayOfByte.length);
  }

  static void writeStringStringMap(Map<String, String> paramMap, OutputStream paramOutputStream)
    throws IOException
  {
    if (paramMap != null)
    {
      writeInt(paramOutputStream, paramMap.size());
      Iterator localIterator = paramMap.entrySet().iterator();
      while (localIterator.hasNext())
      {
        Map.Entry localEntry = (Map.Entry)localIterator.next();
        writeString(paramOutputStream, (String)localEntry.getKey());
        writeString(paramOutputStream, (String)localEntry.getValue());
      }
    }
    writeInt(paramOutputStream, 0);
  }

  public void clear()
  {
    int i = 0;
    try
    {
      File[] arrayOfFile = this.mRootDirectory.listFiles();
      if (arrayOfFile != null)
      {
        int j = arrayOfFile.length;
        while (i < j)
        {
          arrayOfFile[i].delete();
          i++;
        }
      }
      this.mEntries.clear();
      this.mTotalSize = 0L;
      VolleyLog.d("Cache cleared.", new Object[0]);
      return;
    }
    finally
    {
    }
  }

  // ERROR //
  public Cache.Entry get(String paramString)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 38\011com/android/volley/toolbox/DiskBasedCache:mEntries\011Ljava/util/Map;
    //   6: aload_1
    //   7: invokeinterface 177 2 0
    //   12: checkcast 125\011com/android/volley/toolbox/DiskBasedCache$CacheHeader
    //   15: astore_3
    //   16: aconst_null
    //   17: astore 4
    //   19: aload_3
    //   20: ifnonnull +8 -> 28
    //   23: aload_0
    //   24: monitorexit
    //   25: aload 4
    //   27: areturn
    //   28: aload_0
    //   29: aload_1
    //   30: invokevirtual 133\011com/android/volley/toolbox/DiskBasedCache:getFileForKey\011(Ljava/lang/String;)Ljava/io/File;
    //   33: astore 5
    //   35: aconst_null
    //   36: astore 6
    //   38: new 288\011com/android/volley/toolbox/DiskBasedCache$CountingInputStream
    //   41: dup
    //   42: new 290\011java/io/FileInputStream
    //   45: dup
    //   46: aload 5
    //   48: invokespecial 292\011java/io/FileInputStream:<init>\011(Ljava/io/File;)V
    //   51: aconst_null
    //   52: invokespecial 295\011com/android/volley/toolbox/DiskBasedCache$CountingInputStream:<init>\011(Ljava/io/InputStream;Lcom/android/volley/toolbox/DiskBasedCache$1;)V
    //   55: astore 7
    //   57: aload 7
    //   59: invokestatic 299\011com/android/volley/toolbox/DiskBasedCache$CacheHeader:readHeader\011(Ljava/io/InputStream;)Lcom/android/volley/toolbox/DiskBasedCache$CacheHeader;
    //   62: pop
    //   63: aload_3
    //   64: aload 7
    //   66: aload 5
    //   68: invokevirtual 301\011java/io/File:length\011()J
    //   71: aload 7
    //   73: invokestatic 305\011com/android/volley/toolbox/DiskBasedCache$CountingInputStream:access$100\011(Lcom/android/volley/toolbox/DiskBasedCache$CountingInputStream;)I
    //   76: i2l
    //   77: lsub
    //   78: l2i
    //   79: invokestatic 203\011com/android/volley/toolbox/DiskBasedCache:streamToBytes\011(Ljava/io/InputStream;I)[B
    //   82: invokevirtual 309\011com/android/volley/toolbox/DiskBasedCache$CacheHeader:toCacheEntry\011([B)Lcom/android/volley/Cache$Entry;
    //   85: astore 14
    //   87: aload 7
    //   89: ifnull +8 -> 97
    //   92: aload 7
    //   94: invokevirtual 312\011com/android/volley/toolbox/DiskBasedCache$CountingInputStream:close\011()V
    //   97: aload 14
    //   99: astore 4
    //   101: goto -78 -> 23
    //   104: astore 15
    //   106: aconst_null
    //   107: astore 4
    //   109: goto -86 -> 23
    //   112: astore 8
    //   114: iconst_2
    //   115: anewarray 4\011java/lang/Object
    //   118: astore 11
    //   120: aload 11
    //   122: iconst_0
    //   123: aload 5
    //   125: invokevirtual 315\011java/io/File:getAbsolutePath\011()Ljava/lang/String;
    //   128: aastore
    //   129: aload 11
    //   131: iconst_1
    //   132: aload 8
    //   134: invokevirtual 316\011java/io/IOException:toString\011()Ljava/lang/String;
    //   137: aastore
    //   138: ldc_w 318
    //   141: aload 11
    //   143: invokestatic 163\011com/android/volley/VolleyLog:d\011(Ljava/lang/String;[Ljava/lang/Object;)V
    //   146: aload_0
    //   147: aload_1
    //   148: invokevirtual 320\011com/android/volley/toolbox/DiskBasedCache:remove\011(Ljava/lang/String;)V
    //   151: aconst_null
    //   152: astore 4
    //   154: aload 6
    //   156: ifnull -133 -> 23
    //   159: aload 6
    //   161: invokevirtual 312\011com/android/volley/toolbox/DiskBasedCache$CountingInputStream:close\011()V
    //   164: aconst_null
    //   165: astore 4
    //   167: goto -144 -> 23
    //   170: astore 12
    //   172: aconst_null
    //   173: astore 4
    //   175: goto -152 -> 23
    //   178: astore 9
    //   180: aload 6
    //   182: ifnull +8 -> 190
    //   185: aload 6
    //   187: invokevirtual 312\011com/android/volley/toolbox/DiskBasedCache$CountingInputStream:close\011()V
    //   190: aload 9
    //   192: athrow
    //   193: astore_2
    //   194: aload_0
    //   195: monitorexit
    //   196: aload_2
    //   197: athrow
    //   198: astore 10
    //   200: aconst_null
    //   201: astore 4
    //   203: goto -180 -> 23
    //   206: astore 9
    //   208: aload 7
    //   210: astore 6
    //   212: goto -32 -> 180
    //   215: astore 8
    //   217: aload 7
    //   219: astore 6
    //   221: goto -107 -> 114
    //
    // Exception table:
    //   from\011to\011target\011type
    //   92\01197\011104\011java/io/IOException
    //   38\01157\011112\011java/io/IOException
    //   159\011164\011170\011java/io/IOException
    //   38\01157\011178\011finally
    //   114\011151\011178\011finally
    //   2\01116\011193\011finally
    //   28\01135\011193\011finally
    //   92\01197\011193\011finally
    //   159\011164\011193\011finally
    //   185\011190\011193\011finally
    //   190\011193\011193\011finally
    //   185\011190\011198\011java/io/IOException
    //   57\01187\011206\011finally
    //   57\01187\011215\011java/io/IOException
  }

  public File getFileForKey(String paramString)
  {
    return new File(this.mRootDirectory, getFilenameForKey(paramString));
  }

  // ERROR //
  public void initialize()
  {
    // Byte code:
    //   0: iconst_0
    //   1: istore_1
    //   2: aload_0
    //   3: monitorenter
    //   4: aload_0
    //   5: getfield 42\011com/android/volley/toolbox/DiskBasedCache:mRootDirectory\011Ljava/io/File;
    //   8: invokevirtual 327\011java/io/File:exists\011()Z
    //   11: ifne +41 -> 52
    //   14: aload_0
    //   15: getfield 42\011com/android/volley/toolbox/DiskBasedCache:mRootDirectory\011Ljava/io/File;
    //   18: invokevirtual 330\011java/io/File:mkdirs\011()Z
    //   21: ifne +28 -> 49
    //   24: iconst_1
    //   25: anewarray 4\011java/lang/Object
    //   28: astore 16
    //   30: aload 16
    //   32: iconst_0
    //   33: aload_0
    //   34: getfield 42\011com/android/volley/toolbox/DiskBasedCache:mRootDirectory\011Ljava/io/File;
    //   37: invokevirtual 315\011java/io/File:getAbsolutePath\011()Ljava/lang/String;
    //   40: aastore
    //   41: ldc_w 332
    //   44: aload 16
    //   46: invokestatic 335\011com/android/volley/VolleyLog:e\011(Ljava/lang/String;[Ljava/lang/Object;)V
    //   49: aload_0
    //   50: monitorexit
    //   51: return
    //   52: aload_0
    //   53: getfield 42\011com/android/volley/toolbox/DiskBasedCache:mRootDirectory\011Ljava/io/File;
    //   56: invokevirtual 281\011java/io/File:listFiles\011()[Ljava/io/File;
    //   59: astore_3
    //   60: aload_3
    //   61: ifnull -12 -> 49
    //   64: aload_3
    //   65: arraylength
    //   66: istore 4
    //   68: iload_1
    //   69: iload 4
    //   71: if_icmpge -22 -> 49
    //   74: aload_3
    //   75: iload_1
    //   76: aaload
    //   77: astore 5
    //   79: aconst_null
    //   80: astore 6
    //   82: new 337\011java/io/BufferedInputStream
    //   85: dup
    //   86: new 290\011java/io/FileInputStream
    //   89: dup
    //   90: aload 5
    //   92: invokespecial 292\011java/io/FileInputStream:<init>\011(Ljava/io/File;)V
    //   95: invokespecial 340\011java/io/BufferedInputStream:<init>\011(Ljava/io/InputStream;)V
    //   98: astore 7
    //   100: aload 7
    //   102: invokestatic 299\011com/android/volley/toolbox/DiskBasedCache$CacheHeader:readHeader\011(Ljava/io/InputStream;)Lcom/android/volley/toolbox/DiskBasedCache$CacheHeader;
    //   105: astore 13
    //   107: aload 13
    //   109: aload 5
    //   111: invokevirtual 301\011java/io/File:length\011()J
    //   114: putfield 141\011com/android/volley/toolbox/DiskBasedCache$CacheHeader:size\011J
    //   117: aload_0
    //   118: aload 13
    //   120: getfield 129\011com/android/volley/toolbox/DiskBasedCache$CacheHeader:key\011Ljava/lang/String;
    //   123: aload 13
    //   125: invokespecial 342\011com/android/volley/toolbox/DiskBasedCache:putEntry\011(Ljava/lang/String;Lcom/android/volley/toolbox/DiskBasedCache$CacheHeader;)V
    //   128: aload 7
    //   130: ifnull +8 -> 138
    //   133: aload 7
    //   135: invokevirtual 343\011java/io/BufferedInputStream:close\011()V
    //   138: iinc 1 1
    //   141: goto -73 -> 68
    //   144: astore 14
    //   146: goto -8 -> 138
    //   149: astore 15
    //   151: aload 5
    //   153: ifnull +9 -> 162
    //   156: aload 5
    //   158: invokevirtual 138\011java/io/File:delete\011()Z
    //   161: pop
    //   162: aload 6
    //   164: ifnull -26 -> 138
    //   167: aload 6
    //   169: invokevirtual 343\011java/io/BufferedInputStream:close\011()V
    //   172: goto -34 -> 138
    //   175: astore 9
    //   177: goto -39 -> 138
    //   180: astore 10
    //   182: aload 6
    //   184: ifnull +8 -> 192
    //   187: aload 6
    //   189: invokevirtual 343\011java/io/BufferedInputStream:close\011()V
    //   192: aload 10
    //   194: athrow
    //   195: astore_2
    //   196: aload_0
    //   197: monitorexit
    //   198: aload_2
    //   199: athrow
    //   200: astore 11
    //   202: goto -10 -> 192
    //   205: astore 10
    //   207: aload 7
    //   209: astore 6
    //   211: goto -29 -> 182
    //   214: astore 8
    //   216: aload 7
    //   218: astore 6
    //   220: goto -69 -> 151
    //
    // Exception table:
    //   from\011to\011target\011type
    //   133\011138\011144\011java/io/IOException
    //   82\011100\011149\011java/io/IOException
    //   167\011172\011175\011java/io/IOException
    //   82\011100\011180\011finally
    //   156\011162\011180\011finally
    //   4\01149\011195\011finally
    //   52\01160\011195\011finally
    //   64\01168\011195\011finally
    //   74\01179\011195\011finally
    //   133\011138\011195\011finally
    //   167\011172\011195\011finally
    //   187\011192\011195\011finally
    //   192\011195\011195\011finally
    //   187\011192\011200\011java/io/IOException
    //   100\011128\011205\011finally
    //   100\011128\011214\011java/io/IOException
  }

  public void invalidate(String paramString, boolean paramBoolean)
  {
    try
    {
      Cache.Entry localEntry = get(paramString);
      if (localEntry != null)
      {
        localEntry.softTtl = 0L;
        if (paramBoolean)
          localEntry.ttl = 0L;
        put(paramString, localEntry);
      }
      return;
    }
    finally
    {
    }
  }

  public void put(String paramString, Cache.Entry paramEntry)
  {
    try
    {
      pruneIfNeeded(paramEntry.data.length);
      File localFile = getFileForKey(paramString);
      while (true)
      {
        FileOutputStream localFileOutputStream;
        CacheHeader localCacheHeader;
        try
        {
          localFileOutputStream = new FileOutputStream(localFile);
          localCacheHeader = new CacheHeader(paramString, paramEntry);
          if (!localCacheHeader.writeHeader(localFileOutputStream))
          {
            localFileOutputStream.close();
            Object[] arrayOfObject2 = new Object[1];
            arrayOfObject2[0] = localFile.getAbsolutePath();
            VolleyLog.d("Failed to write header for %s", arrayOfObject2);
            throw new IOException();
          }
        }
        catch (IOException localIOException)
        {
          if (!localFile.delete())
          {
            Object[] arrayOfObject1 = new Object[1];
            arrayOfObject1[0] = localFile.getAbsolutePath();
            VolleyLog.d("Could not clean up file %s", arrayOfObject1);
          }
          return;
        }
        localFileOutputStream.write(paramEntry.data);
        localFileOutputStream.close();
        putEntry(paramString, localCacheHeader);
      }
    }
    finally
    {
    }
  }

  public void remove(String paramString)
  {
    try
    {
      boolean bool = getFileForKey(paramString).delete();
      removeEntry(paramString);
      if (!bool)
      {
        Object[] arrayOfObject = new Object[2];
        arrayOfObject[0] = paramString;
        arrayOfObject[1] = getFilenameForKey(paramString);
        VolleyLog.d("Could not delete cache entry for key=%s, filename=%s", arrayOfObject);
      }
      return;
    }
    finally
    {
    }
  }

  static class CacheHeader
  {
    public String etag;
    public String key;
    public long lastModified;
    public Map<String, String> responseHeaders;
    public long serverDate;
    public long size;
    public long softTtl;
    public long ttl;

    private CacheHeader()
    {
    }

    public CacheHeader(String paramString, Cache.Entry paramEntry)
    {
      this.key = paramString;
      this.size = paramEntry.data.length;
      this.etag = paramEntry.etag;
      this.serverDate = paramEntry.serverDate;
      this.lastModified = paramEntry.lastModified;
      this.ttl = paramEntry.ttl;
      this.softTtl = paramEntry.softTtl;
      this.responseHeaders = paramEntry.responseHeaders;
    }

    public static CacheHeader readHeader(InputStream paramInputStream)
      throws IOException
    {
      CacheHeader localCacheHeader = new CacheHeader();
      if (DiskBasedCache.readInt(paramInputStream) != 538247942)
        throw new IOException();
      localCacheHeader.key = DiskBasedCache.readString(paramInputStream);
      localCacheHeader.etag = DiskBasedCache.readString(paramInputStream);
      if (localCacheHeader.etag.equals(""))
        localCacheHeader.etag = null;
      localCacheHeader.serverDate = DiskBasedCache.readLong(paramInputStream);
      localCacheHeader.lastModified = DiskBasedCache.readLong(paramInputStream);
      localCacheHeader.ttl = DiskBasedCache.readLong(paramInputStream);
      localCacheHeader.softTtl = DiskBasedCache.readLong(paramInputStream);
      localCacheHeader.responseHeaders = DiskBasedCache.readStringStringMap(paramInputStream);
      return localCacheHeader;
    }

    public Cache.Entry toCacheEntry(byte[] paramArrayOfByte)
    {
      Cache.Entry localEntry = new Cache.Entry();
      localEntry.data = paramArrayOfByte;
      localEntry.etag = this.etag;
      localEntry.serverDate = this.serverDate;
      localEntry.lastModified = this.lastModified;
      localEntry.ttl = this.ttl;
      localEntry.softTtl = this.softTtl;
      localEntry.responseHeaders = this.responseHeaders;
      return localEntry;
    }

    public boolean writeHeader(OutputStream paramOutputStream)
    {
      try
      {
        DiskBasedCache.writeInt(paramOutputStream, 538247942);
        DiskBasedCache.writeString(paramOutputStream, this.key);
        if (this.etag == null);
        for (String str = ""; ; str = this.etag)
        {
          DiskBasedCache.writeString(paramOutputStream, str);
          DiskBasedCache.writeLong(paramOutputStream, this.serverDate);
          DiskBasedCache.writeLong(paramOutputStream, this.lastModified);
          DiskBasedCache.writeLong(paramOutputStream, this.ttl);
          DiskBasedCache.writeLong(paramOutputStream, this.softTtl);
          DiskBasedCache.writeStringStringMap(this.responseHeaders, paramOutputStream);
          paramOutputStream.flush();
          return true;
        }
      }
      catch (IOException localIOException)
      {
        Object[] arrayOfObject = new Object[1];
        arrayOfObject[0] = localIOException.toString();
        VolleyLog.d("%s", arrayOfObject);
      }
      return false;
    }
  }

  private static class CountingInputStream extends FilterInputStream
  {
    private int bytesRead = 0;

    private CountingInputStream(InputStream paramInputStream)
    {
      super();
    }

    public int read()
      throws IOException
    {
      int i = super.read();
      if (i != -1)
        this.bytesRead = (1 + this.bytesRead);
      return i;
    }

    public int read(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
      throws IOException
    {
      int i = super.read(paramArrayOfByte, paramInt1, paramInt2);
      if (i != -1)
        this.bytesRead = (i + this.bytesRead);
      return i;
    }
  }
}