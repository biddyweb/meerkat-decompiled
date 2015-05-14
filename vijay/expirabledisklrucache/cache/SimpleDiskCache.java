package vijay.expirabledisklrucache.cache;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import com.jakewharton.disklrucache.DiskLruCache;
import com.jakewharton.disklrucache.DiskLruCache.Editor;
import com.jakewharton.disklrucache.DiskLruCache.Snapshot;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FilterOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.Serializable;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import vijay.expirabledisklrucache.cache.utils.ByteStreams;

class SimpleDiskCache
{
  private static final String LOG_TAG = "SIMPLE_DISK_CACHE";
  private static final int METADATA_IDX = 1;
  private static final int VALUE_IDX;
  private static final List<File> sUsedDirs = new ArrayList();
  private int mAppVersion;
  private DiskLruCache mDiskLruCache;

  private SimpleDiskCache(File paramFile, int paramInt, long paramLong)
    throws IOException
  {
    this.mAppVersion = paramInt;
    this.mDiskLruCache = DiskLruCache.open(paramFile, paramInt, 2, paramLong);
  }

  private String md5(String paramString)
  {
    try
    {
      MessageDigest localMessageDigest = MessageDigest.getInstance("MD5");
      localMessageDigest.update(paramString.getBytes("UTF-8"));
      String str = new BigInteger(1, localMessageDigest.digest()).toString(16);
      return str;
    }
    catch (NoSuchAlgorithmException localNoSuchAlgorithmException)
    {
      throw new AssertionError();
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException)
    {
    }
    throw new AssertionError();
  }

  public static SimpleDiskCache open(File paramFile, int paramInt, long paramLong)
    throws IOException
  {
    try
    {
      if (sUsedDirs.contains(paramFile))
        throw new IllegalStateException("Cache dir " + paramFile.getAbsolutePath() + " was used before.");
    }
    finally
    {
    }
    sUsedDirs.add(paramFile);
    SimpleDiskCache localSimpleDiskCache = new SimpleDiskCache(paramFile, paramInt, paramLong);
    return localSimpleDiskCache;
  }

  // ERROR //
  private Map<String, Serializable> readMetadata(DiskLruCache.Snapshot paramSnapshot)
    throws IOException
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore_2
    //   2: new 125\011java/io/ObjectInputStream
    //   5: dup
    //   6: new 127\011java/io/BufferedInputStream
    //   9: dup
    //   10: aload_1
    //   11: iconst_1
    //   12: invokevirtual 133\011com/jakewharton/disklrucache/DiskLruCache$Snapshot:getInputStream\011(I)Ljava/io/InputStream;
    //   15: invokespecial 136\011java/io/BufferedInputStream:<init>\011(Ljava/io/InputStream;)V
    //   18: invokespecial 137\011java/io/ObjectInputStream:<init>\011(Ljava/io/InputStream;)V
    //   21: astore_3
    //   22: aload_3
    //   23: invokevirtual 141\011java/io/ObjectInputStream:readObject\011()Ljava/lang/Object;
    //   26: checkcast 143\011java/util/Map
    //   29: astore 6
    //   31: aload_3
    //   32: iconst_1
    //   33: invokestatic 149\011vijay/expirabledisklrucache/cache/utils/Closeables:close\011(Ljava/io/Closeable;Z)V
    //   36: aload 6
    //   38: areturn
    //   39: astore 4
    //   41: new 151\011java/lang/RuntimeException
    //   44: dup
    //   45: aload 4
    //   47: invokespecial 154\011java/lang/RuntimeException:<init>\011(Ljava/lang/Throwable;)V
    //   50: athrow
    //   51: astore 5
    //   53: aload_2
    //   54: iconst_1
    //   55: invokestatic 149\011vijay/expirabledisklrucache/cache/utils/Closeables:close\011(Ljava/io/Closeable;Z)V
    //   58: aload 5
    //   60: athrow
    //   61: astore 5
    //   63: aload_3
    //   64: astore_2
    //   65: goto -12 -> 53
    //   68: astore 4
    //   70: aload_3
    //   71: astore_2
    //   72: goto -31 -> 41
    //
    // Exception table:
    //   from\011to\011target\011type
    //   2\01122\01139\011java/lang/ClassNotFoundException
    //   2\01122\01151\011finally
    //   41\01151\01151\011finally
    //   22\01131\01161\011finally
    //   22\01131\01168\011java/lang/ClassNotFoundException
  }

  private String toInternalKey(String paramString)
  {
    return md5(paramString);
  }

  // ERROR //
  private void writeMetadata(Map<String, ? extends Serializable> paramMap, DiskLruCache.Editor paramEditor)
    throws IOException
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore_3
    //   2: new 161\011java/io/ObjectOutputStream
    //   5: dup
    //   6: new 163\011java/io/BufferedOutputStream
    //   9: dup
    //   10: aload_2
    //   11: iconst_1
    //   12: invokevirtual 169\011com/jakewharton/disklrucache/DiskLruCache$Editor:newOutputStream\011(I)Ljava/io/OutputStream;
    //   15: invokespecial 172\011java/io/BufferedOutputStream:<init>\011(Ljava/io/OutputStream;)V
    //   18: invokespecial 173\011java/io/ObjectOutputStream:<init>\011(Ljava/io/OutputStream;)V
    //   21: astore 4
    //   23: aload 4
    //   25: aload_1
    //   26: invokevirtual 177\011java/io/ObjectOutputStream:writeObject\011(Ljava/lang/Object;)V
    //   29: aload 4
    //   31: iconst_1
    //   32: invokestatic 149\011vijay/expirabledisklrucache/cache/utils/Closeables:close\011(Ljava/io/Closeable;Z)V
    //   35: return
    //   36: astore 5
    //   38: aload_3
    //   39: iconst_1
    //   40: invokestatic 149\011vijay/expirabledisklrucache/cache/utils/Closeables:close\011(Ljava/io/Closeable;Z)V
    //   43: aload 5
    //   45: athrow
    //   46: astore 5
    //   48: aload 4
    //   50: astore_3
    //   51: goto -13 -> 38
    //
    // Exception table:
    //   from\011to\011target\011type
    //   2\01123\01136\011finally
    //   23\01129\01146\011finally
  }

  public void clear()
    throws IOException
  {
    File localFile = this.mDiskLruCache.getDirectory();
    long l = this.mDiskLruCache.getMaxSize();
    this.mDiskLruCache.delete();
    this.mDiskLruCache = DiskLruCache.open(localFile, this.mAppVersion, 2, l);
  }

  public boolean contains(String paramString)
    throws IOException
  {
    DiskLruCache.Snapshot localSnapshot = this.mDiskLruCache.get(toInternalKey(paramString));
    if (localSnapshot == null)
      return false;
    localSnapshot.close();
    return true;
  }

  public BitmapEntry getBitmap(String paramString)
    throws IOException
  {
    DiskLruCache.Snapshot localSnapshot = this.mDiskLruCache.get(toInternalKey(paramString));
    if (localSnapshot == null)
      return null;
    try
    {
      BitmapEntry localBitmapEntry = new BitmapEntry(BitmapFactory.decodeStream(localSnapshot.getInputStream(0)), readMetadata(localSnapshot));
      return localBitmapEntry;
    }
    finally
    {
      localSnapshot.close();
    }
  }

  public DiskLruCache getCache()
  {
    return this.mDiskLruCache;
  }

  public InputStreamEntry getInputStream(String paramString)
    throws IOException
  {
    DiskLruCache.Snapshot localSnapshot = this.mDiskLruCache.get(toInternalKey(paramString));
    if (localSnapshot == null)
      return null;
    return new InputStreamEntry(localSnapshot, readMetadata(localSnapshot));
  }

  public StringEntry getString(String paramString)
    throws IOException
  {
    DiskLruCache.Snapshot localSnapshot = this.mDiskLruCache.get(toInternalKey(paramString));
    if (localSnapshot == null)
      return null;
    try
    {
      StringEntry localStringEntry = new StringEntry(localSnapshot.getString(0), readMetadata(localSnapshot));
      return localStringEntry;
    }
    finally
    {
      localSnapshot.close();
    }
  }

  public OutputStream openStream(String paramString)
    throws IOException
  {
    return openStream(paramString, new HashMap());
  }

  public OutputStream openStream(String paramString, Map<String, ? extends Serializable> paramMap)
    throws IOException
  {
    DiskLruCache.Editor localEditor = this.mDiskLruCache.edit(toInternalKey(paramString));
    try
    {
      writeMetadata(paramMap, localEditor);
      CacheOutputStream localCacheOutputStream = new CacheOutputStream(new BufferedOutputStream(localEditor.newOutputStream(0)), localEditor, null);
      return localCacheOutputStream;
    }
    catch (IOException localIOException)
    {
      localEditor.abort();
      throw localIOException;
    }
  }

  public void put(String paramString, InputStream paramInputStream)
    throws IOException
  {
    put(paramString, paramInputStream, new HashMap());
  }

  public void put(String paramString, InputStream paramInputStream, Map<String, Serializable> paramMap)
    throws IOException
  {
    OutputStream localOutputStream = null;
    try
    {
      localOutputStream = openStream(paramString, paramMap);
      ByteStreams.copy(paramInputStream, localOutputStream);
      return;
    }
    finally
    {
      if (localOutputStream != null)
        localOutputStream.close();
    }
  }

  public void put(String paramString1, String paramString2)
    throws IOException
  {
    put(paramString1, paramString2, new HashMap());
  }

  public void put(String paramString1, String paramString2, Map<String, ? extends Serializable> paramMap)
    throws IOException
  {
    OutputStream localOutputStream = null;
    try
    {
      localOutputStream = openStream(paramString1, paramMap);
      localOutputStream.write(paramString2.getBytes());
      return;
    }
    finally
    {
      if (localOutputStream != null)
        localOutputStream.close();
    }
  }

  public void remove(String paramString)
    throws IOException
  {
    this.mDiskLruCache.remove(toInternalKey(paramString));
  }

  public static class BitmapEntry
  {
    private final Bitmap bitmap;
    private final Map<String, Serializable> metadata;

    public BitmapEntry(Bitmap paramBitmap, Map<String, Serializable> paramMap)
    {
      this.bitmap = paramBitmap;
      this.metadata = paramMap;
    }

    public Bitmap getBitmap()
    {
      return this.bitmap;
    }

    public Map<String, Serializable> getMetadata()
    {
      return this.metadata;
    }
  }

  private class CacheOutputStream extends FilterOutputStream
  {
    private final DiskLruCache.Editor editor;
    private boolean failed = false;

    private CacheOutputStream(OutputStream paramEditor, DiskLruCache.Editor arg3)
    {
      super();
      Object localObject;
      this.editor = localObject;
    }

    public void close()
      throws IOException
    {
      Object localObject = null;
      try
      {
        super.close();
        if (this.failed)
        {
          this.editor.abort();
          if (localObject == null)
            return;
          throw localObject;
        }
      }
      catch (IOException localIOException)
      {
        while (true)
        {
          localObject = localIOException;
          continue;
          this.editor.commit();
        }
      }
    }

    public void flush()
      throws IOException
    {
      try
      {
        super.flush();
        return;
      }
      catch (IOException localIOException)
      {
        this.failed = true;
        throw localIOException;
      }
    }

    public void write(int paramInt)
      throws IOException
    {
      try
      {
        super.write(paramInt);
        return;
      }
      catch (IOException localIOException)
      {
        this.failed = true;
        throw localIOException;
      }
    }

    public void write(byte[] paramArrayOfByte)
      throws IOException
    {
      try
      {
        super.write(paramArrayOfByte);
        return;
      }
      catch (IOException localIOException)
      {
        this.failed = true;
        throw localIOException;
      }
    }

    public void write(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
      throws IOException
    {
      try
      {
        super.write(paramArrayOfByte, paramInt1, paramInt2);
        return;
      }
      catch (IOException localIOException)
      {
        this.failed = true;
        throw localIOException;
      }
    }
  }

  public static class InputStreamEntry
  {
    private final Map<String, Serializable> metadata;
    private final DiskLruCache.Snapshot snapshot;

    public InputStreamEntry(DiskLruCache.Snapshot paramSnapshot, Map<String, Serializable> paramMap)
    {
      this.metadata = paramMap;
      this.snapshot = paramSnapshot;
    }

    public void close()
    {
      this.snapshot.close();
    }

    public InputStream getInputStream()
    {
      return this.snapshot.getInputStream(0);
    }

    public Map<String, Serializable> getMetadata()
    {
      return this.metadata;
    }
  }

  public static class StringEntry
  {
    private final Map<String, Serializable> metadata;
    private final String string;

    public StringEntry(String paramString, Map<String, Serializable> paramMap)
    {
      this.string = paramString;
      this.metadata = paramMap;
    }

    public Map<String, Serializable> getMetadata()
    {
      return this.metadata;
    }

    public String getString()
    {
      return this.string;
    }
  }
}