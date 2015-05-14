package com.google.common.io;

import com.google.common.annotations.Beta;
import com.google.common.base.Ascii;
import com.google.common.base.Preconditions;
import com.google.common.collect.ImmutableList;
import com.google.common.hash.Funnels;
import com.google.common.hash.HashCode;
import com.google.common.hash.HashFunction;
import com.google.common.hash.Hasher;
import java.io.BufferedInputStream;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.Reader;
import java.nio.charset.Charset;
import java.util.Arrays;
import java.util.Iterator;

public abstract class ByteSource
{
  private static final int BUF_SIZE = 4096;
  private static final byte[] countBuffer = new byte[4096];

  public static ByteSource concat(Iterable<? extends ByteSource> paramIterable)
  {
    return new ConcatenatedByteSource(paramIterable);
  }

  public static ByteSource concat(Iterator<? extends ByteSource> paramIterator)
  {
    return concat(ImmutableList.copyOf(paramIterator));
  }

  public static ByteSource concat(ByteSource[] paramArrayOfByteSource)
  {
    return concat(ImmutableList.copyOf(paramArrayOfByteSource));
  }

  private long countByReading(InputStream paramInputStream)
    throws IOException
  {
    long l2;
    for (long l1 = 0L; ; l1 += l2)
    {
      l2 = paramInputStream.read(countBuffer);
      if (l2 == -1L)
        break;
    }
    return l1;
  }

  private long countBySkipping(InputStream paramInputStream)
    throws IOException
  {
    long l1 = 0L;
    while (true)
    {
      long l2 = paramInputStream.skip(Math.min(paramInputStream.available(), 2147483647));
      if (l2 <= 0L)
      {
        if (paramInputStream.read() == -1)
          return l1;
        if ((l1 == 0L) && (paramInputStream.available() == 0))
          throw new IOException();
        l1 += 1L;
      }
      else
      {
        l1 += l2;
      }
    }
  }

  public static ByteSource empty()
  {
    return EmptyByteSource.INSTANCE;
  }

  public static ByteSource wrap(byte[] paramArrayOfByte)
  {
    return new ByteArrayByteSource(paramArrayOfByte);
  }

  public CharSource asCharSource(Charset paramCharset)
  {
    return new AsCharSource(paramCharset, null);
  }

  public boolean contentEquals(ByteSource paramByteSource)
    throws IOException
  {
    Preconditions.checkNotNull(paramByteSource);
    byte[] arrayOfByte1 = new byte[4096];
    byte[] arrayOfByte2 = new byte[4096];
    Closer localCloser = Closer.create();
    try
    {
      InputStream localInputStream1 = (InputStream)localCloser.register(openStream());
      InputStream localInputStream2 = (InputStream)localCloser.register(paramByteSource.openStream());
      int i;
      do
      {
        i = ByteStreams.read(localInputStream1, arrayOfByte1, 0, 4096);
        if (i == ByteStreams.read(localInputStream2, arrayOfByte2, 0, 4096))
        {
          boolean bool = Arrays.equals(arrayOfByte1, arrayOfByte2);
          if (bool);
        }
        else
        {
          return false;
        }
      }
      while (i == 4096);
      return true;
    }
    catch (Throwable localThrowable)
    {
      throw localCloser.rethrow(localThrowable);
    }
    finally
    {
      localCloser.close();
    }
  }

  public long copyTo(ByteSink paramByteSink)
    throws IOException
  {
    Preconditions.checkNotNull(paramByteSink);
    Closer localCloser = Closer.create();
    try
    {
      long l = ByteStreams.copy((InputStream)localCloser.register(openStream()), (OutputStream)localCloser.register(paramByteSink.openStream()));
      return l;
    }
    catch (Throwable localThrowable)
    {
      throw localCloser.rethrow(localThrowable);
    }
    finally
    {
      localCloser.close();
    }
  }

  public long copyTo(OutputStream paramOutputStream)
    throws IOException
  {
    Preconditions.checkNotNull(paramOutputStream);
    Closer localCloser = Closer.create();
    try
    {
      long l = ByteStreams.copy((InputStream)localCloser.register(openStream()), paramOutputStream);
      return l;
    }
    catch (Throwable localThrowable)
    {
      throw localCloser.rethrow(localThrowable);
    }
    finally
    {
      localCloser.close();
    }
  }

  public HashCode hash(HashFunction paramHashFunction)
    throws IOException
  {
    Hasher localHasher = paramHashFunction.newHasher();
    copyTo(Funnels.asOutputStream(localHasher));
    return localHasher.hash();
  }

  public boolean isEmpty()
    throws IOException
  {
    Closer localCloser = Closer.create();
    try
    {
      int i = ((InputStream)localCloser.register(openStream())).read();
      if (i == -1);
      for (boolean bool = true; ; bool = false)
        return bool;
    }
    catch (Throwable localThrowable)
    {
      throw localCloser.rethrow(localThrowable);
    }
    finally
    {
      localCloser.close();
    }
  }

  public InputStream openBufferedStream()
    throws IOException
  {
    InputStream localInputStream = openStream();
    if ((localInputStream instanceof BufferedInputStream))
      return (BufferedInputStream)localInputStream;
    return new BufferedInputStream(localInputStream);
  }

  public abstract InputStream openStream()
    throws IOException;

  @Beta
  public <T> T read(ByteProcessor<T> paramByteProcessor)
    throws IOException
  {
    Preconditions.checkNotNull(paramByteProcessor);
    Closer localCloser = Closer.create();
    try
    {
      Object localObject2 = ByteStreams.readBytes((InputStream)localCloser.register(openStream()), paramByteProcessor);
      return localObject2;
    }
    catch (Throwable localThrowable)
    {
      throw localCloser.rethrow(localThrowable);
    }
    finally
    {
      localCloser.close();
    }
  }

  public byte[] read()
    throws IOException
  {
    Closer localCloser = Closer.create();
    try
    {
      byte[] arrayOfByte = ByteStreams.toByteArray((InputStream)localCloser.register(openStream()));
      return arrayOfByte;
    }
    catch (Throwable localThrowable)
    {
      throw localCloser.rethrow(localThrowable);
    }
    finally
    {
      localCloser.close();
    }
  }

  // ERROR //
  public long size()
    throws IOException
  {
    // Byte code:
    //   0: invokestatic 105\011com/google/common/io/Closer:create\011()Lcom/google/common/io/Closer;
    //   3: astore_1
    //   4: aload_0
    //   5: aload_1
    //   6: aload_0
    //   7: invokevirtual 109\011com/google/common/io/ByteSource:openStream\011()Ljava/io/InputStream;
    //   10: invokevirtual 113\011com/google/common/io/Closer:register\011(Ljava/io/Closeable;)Ljava/io/Closeable;
    //   13: checkcast 42\011java/io/InputStream
    //   16: invokespecial 189\011com/google/common/io/ByteSource:countBySkipping\011(Ljava/io/InputStream;)J
    //   19: lstore 9
    //   21: aload_1
    //   22: invokevirtual 127\011com/google/common/io/Closer:close\011()V
    //   25: lload 9
    //   27: lreturn
    //   28: astore_3
    //   29: aload_1
    //   30: invokevirtual 127\011com/google/common/io/Closer:close\011()V
    //   33: invokestatic 105\011com/google/common/io/Closer:create\011()Lcom/google/common/io/Closer;
    //   36: astore 4
    //   38: aload_0
    //   39: aload 4
    //   41: aload_0
    //   42: invokevirtual 109\011com/google/common/io/ByteSource:openStream\011()Ljava/io/InputStream;
    //   45: invokevirtual 113\011com/google/common/io/Closer:register\011(Ljava/io/Closeable;)Ljava/io/Closeable;
    //   48: checkcast 42\011java/io/InputStream
    //   51: invokespecial 191\011com/google/common/io/ByteSource:countByReading\011(Ljava/io/InputStream;)J
    //   54: lstore 7
    //   56: aload 4
    //   58: invokevirtual 127\011com/google/common/io/Closer:close\011()V
    //   61: lload 7
    //   63: lreturn
    //   64: astore_2
    //   65: aload_1
    //   66: invokevirtual 127\011com/google/common/io/Closer:close\011()V
    //   69: aload_2
    //   70: athrow
    //   71: astore 6
    //   73: aload 4
    //   75: aload 6
    //   77: invokevirtual 131\011com/google/common/io/Closer:rethrow\011(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;
    //   80: athrow
    //   81: astore 5
    //   83: aload 4
    //   85: invokevirtual 127\011com/google/common/io/Closer:close\011()V
    //   88: aload 5
    //   90: athrow
    //
    // Exception table:
    //   from\011to\011target\011type
    //   4\01121\01128\011java/io/IOException
    //   4\01121\01164\011finally
    //   38\01156\01171\011java/lang/Throwable
    //   38\01156\01181\011finally
    //   73\01181\01181\011finally
  }

  public ByteSource slice(long paramLong1, long paramLong2)
  {
    return new SlicedByteSource(paramLong1, paramLong2, null);
  }

  private final class AsCharSource extends CharSource
  {
    private final Charset charset;

    private AsCharSource(Charset arg2)
    {
      Object localObject;
      this.charset = ((Charset)Preconditions.checkNotNull(localObject));
    }

    public Reader openStream()
      throws IOException
    {
      return new InputStreamReader(ByteSource.this.openStream(), this.charset);
    }

    public String toString()
    {
      String str1 = String.valueOf(String.valueOf(ByteSource.this.toString()));
      String str2 = String.valueOf(String.valueOf(this.charset));
      return 15 + str1.length() + str2.length() + str1 + ".asCharSource(" + str2 + ")";
    }
  }

  private static class ByteArrayByteSource extends ByteSource
  {
    protected final byte[] bytes;

    protected ByteArrayByteSource(byte[] paramArrayOfByte)
    {
      this.bytes = ((byte[])Preconditions.checkNotNull(paramArrayOfByte));
    }

    public long copyTo(OutputStream paramOutputStream)
      throws IOException
    {
      paramOutputStream.write(this.bytes);
      return this.bytes.length;
    }

    public HashCode hash(HashFunction paramHashFunction)
      throws IOException
    {
      return paramHashFunction.hashBytes(this.bytes);
    }

    public boolean isEmpty()
    {
      return this.bytes.length == 0;
    }

    public InputStream openBufferedStream()
      throws IOException
    {
      return openStream();
    }

    public InputStream openStream()
    {
      return new ByteArrayInputStream(this.bytes);
    }

    public <T> T read(ByteProcessor<T> paramByteProcessor)
      throws IOException
    {
      paramByteProcessor.processBytes(this.bytes, 0, this.bytes.length);
      return paramByteProcessor.getResult();
    }

    public byte[] read()
    {
      return (byte[])this.bytes.clone();
    }

    public long size()
    {
      return this.bytes.length;
    }

    public String toString()
    {
      String str = String.valueOf(String.valueOf(Ascii.truncate(BaseEncoding.base16().encode(this.bytes), 30, "...")));
      return 17 + str.length() + "ByteSource.wrap(" + str + ")";
    }
  }

  private static final class ConcatenatedByteSource extends ByteSource
  {
    private final Iterable<? extends ByteSource> sources;

    ConcatenatedByteSource(Iterable<? extends ByteSource> paramIterable)
    {
      this.sources = ((Iterable)Preconditions.checkNotNull(paramIterable));
    }

    public boolean isEmpty()
      throws IOException
    {
      Iterator localIterator = this.sources.iterator();
      while (localIterator.hasNext())
        if (!((ByteSource)localIterator.next()).isEmpty())
          return false;
      return true;
    }

    public InputStream openStream()
      throws IOException
    {
      return new MultiInputStream(this.sources.iterator());
    }

    public long size()
      throws IOException
    {
      long l = 0L;
      Iterator localIterator = this.sources.iterator();
      while (localIterator.hasNext())
        l += ((ByteSource)localIterator.next()).size();
      return l;
    }

    public String toString()
    {
      String str = String.valueOf(String.valueOf(this.sources));
      return 19 + str.length() + "ByteSource.concat(" + str + ")";
    }
  }

  private static final class EmptyByteSource extends ByteSource.ByteArrayByteSource
  {
    private static final EmptyByteSource INSTANCE = new EmptyByteSource();

    private EmptyByteSource()
    {
      super();
    }

    public CharSource asCharSource(Charset paramCharset)
    {
      Preconditions.checkNotNull(paramCharset);
      return CharSource.empty();
    }

    public byte[] read()
    {
      return this.bytes;
    }

    public String toString()
    {
      return "ByteSource.empty()";
    }
  }

  private final class SlicedByteSource extends ByteSource
  {
    private final long length;
    private final long offset;

    private SlicedByteSource(long arg2, long arg4)
    {
      boolean bool1;
      Object localObject;
      if (??? >= 0L)
      {
        bool1 = true;
        Object[] arrayOfObject1 = new Object[1];
        arrayOfObject1[0] = Long.valueOf(???);
        Preconditions.checkArgument(bool1, "offset (%s) may not be negative", arrayOfObject1);
        if (localObject < 0L)
          break label93;
      }
      label93: for (boolean bool2 = true; ; bool2 = false)
      {
        Object[] arrayOfObject2 = new Object[1];
        arrayOfObject2[0] = Long.valueOf(localObject);
        Preconditions.checkArgument(bool2, "length (%s) may not be negative", arrayOfObject2);
        this.offset = ???;
        this.length = localObject;
        return;
        bool1 = false;
        break;
      }
    }

    private InputStream sliceStream(InputStream paramInputStream)
      throws IOException
    {
      if (this.offset > 0L);
      try
      {
        ByteStreams.skipFully(paramInputStream, this.offset);
        return ByteStreams.limit(paramInputStream, this.length);
      }
      catch (Throwable localThrowable)
      {
        Closer localCloser = Closer.create();
        localCloser.register(paramInputStream);
        try
        {
          throw localCloser.rethrow(localThrowable);
        }
        finally
        {
          localCloser.close();
        }
      }
    }

    public boolean isEmpty()
      throws IOException
    {
      return (this.length == 0L) || (super.isEmpty());
    }

    public InputStream openBufferedStream()
      throws IOException
    {
      return sliceStream(ByteSource.this.openBufferedStream());
    }

    public InputStream openStream()
      throws IOException
    {
      return sliceStream(ByteSource.this.openStream());
    }

    public ByteSource slice(long paramLong1, long paramLong2)
    {
      boolean bool1;
      if (paramLong1 >= 0L)
      {
        bool1 = true;
        Object[] arrayOfObject1 = new Object[1];
        arrayOfObject1[0] = Long.valueOf(paramLong1);
        Preconditions.checkArgument(bool1, "offset (%s) may not be negative", arrayOfObject1);
        if (paramLong2 < 0L)
          break label98;
      }
      label98: for (boolean bool2 = true; ; bool2 = false)
      {
        Object[] arrayOfObject2 = new Object[1];
        arrayOfObject2[0] = Long.valueOf(paramLong2);
        Preconditions.checkArgument(bool2, "length (%s) may not be negative", arrayOfObject2);
        long l = this.length - paramLong1;
        return ByteSource.this.slice(paramLong1 + this.offset, Math.min(paramLong2, l));
        bool1 = false;
        break;
      }
    }

    public String toString()
    {
      String str = String.valueOf(String.valueOf(ByteSource.this.toString()));
      long l1 = this.offset;
      long l2 = this.length;
      return 50 + str.length() + str + ".slice(" + l1 + ", " + l2 + ")";
    }
  }
}