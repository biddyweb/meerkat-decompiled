package com.google.common.io;

import com.google.common.annotations.Beta;
import com.google.common.base.Preconditions;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.DataInput;
import java.io.DataInputStream;
import java.io.DataOutput;
import java.io.DataOutputStream;
import java.io.EOFException;
import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.ByteBuffer;
import java.nio.channels.ReadableByteChannel;
import java.nio.channels.WritableByteChannel;
import java.util.Arrays;

@Beta
public final class ByteStreams
{
  private static final int BUF_SIZE = 4096;
  private static final OutputStream NULL_OUTPUT_STREAM = new OutputStream()
  {
    public String toString()
    {
      return "ByteStreams.nullOutputStream()";
    }

    public void write(int paramAnonymousInt)
    {
    }

    public void write(byte[] paramAnonymousArrayOfByte)
    {
      Preconditions.checkNotNull(paramAnonymousArrayOfByte);
    }

    public void write(byte[] paramAnonymousArrayOfByte, int paramAnonymousInt1, int paramAnonymousInt2)
    {
      Preconditions.checkNotNull(paramAnonymousArrayOfByte);
    }
  };

  public static long copy(InputStream paramInputStream, OutputStream paramOutputStream)
    throws IOException
  {
    Preconditions.checkNotNull(paramInputStream);
    Preconditions.checkNotNull(paramOutputStream);
    byte[] arrayOfByte = new byte[4096];
    int i;
    for (long l = 0L; ; l += i)
    {
      i = paramInputStream.read(arrayOfByte);
      if (i == -1)
        return l;
      paramOutputStream.write(arrayOfByte, 0, i);
    }
  }

  public static long copy(ReadableByteChannel paramReadableByteChannel, WritableByteChannel paramWritableByteChannel)
    throws IOException
  {
    Preconditions.checkNotNull(paramReadableByteChannel);
    Preconditions.checkNotNull(paramWritableByteChannel);
    ByteBuffer localByteBuffer = ByteBuffer.allocate(4096);
    long l = 0L;
    while (paramReadableByteChannel.read(localByteBuffer) != -1)
    {
      localByteBuffer.flip();
      while (localByteBuffer.hasRemaining())
        l += paramWritableByteChannel.write(localByteBuffer);
      localByteBuffer.clear();
    }
    return l;
  }

  public static InputStream limit(InputStream paramInputStream, long paramLong)
  {
    return new LimitedInputStream(paramInputStream, paramLong);
  }

  public static ByteArrayDataInput newDataInput(ByteArrayInputStream paramByteArrayInputStream)
  {
    return new ByteArrayDataInputStream((ByteArrayInputStream)Preconditions.checkNotNull(paramByteArrayInputStream));
  }

  public static ByteArrayDataInput newDataInput(byte[] paramArrayOfByte)
  {
    return newDataInput(new ByteArrayInputStream(paramArrayOfByte));
  }

  public static ByteArrayDataInput newDataInput(byte[] paramArrayOfByte, int paramInt)
  {
    Preconditions.checkPositionIndex(paramInt, paramArrayOfByte.length);
    return newDataInput(new ByteArrayInputStream(paramArrayOfByte, paramInt, paramArrayOfByte.length - paramInt));
  }

  public static ByteArrayDataOutput newDataOutput()
  {
    return newDataOutput(new ByteArrayOutputStream());
  }

  public static ByteArrayDataOutput newDataOutput(int paramInt)
  {
    if (paramInt >= 0);
    for (boolean bool = true; ; bool = false)
    {
      Object[] arrayOfObject = new Object[1];
      arrayOfObject[0] = Integer.valueOf(paramInt);
      Preconditions.checkArgument(bool, "Invalid size: %s", arrayOfObject);
      return newDataOutput(new ByteArrayOutputStream(paramInt));
    }
  }

  public static ByteArrayDataOutput newDataOutput(ByteArrayOutputStream paramByteArrayOutputStream)
  {
    return new ByteArrayDataOutputStream((ByteArrayOutputStream)Preconditions.checkNotNull(paramByteArrayOutputStream));
  }

  public static OutputStream nullOutputStream()
  {
    return NULL_OUTPUT_STREAM;
  }

  public static int read(InputStream paramInputStream, byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    Preconditions.checkNotNull(paramInputStream);
    Preconditions.checkNotNull(paramArrayOfByte);
    if (paramInt2 < 0)
      throw new IndexOutOfBoundsException("len is negative");
    int i = 0;
    while (true)
    {
      int j;
      if (i < paramInt2)
      {
        j = paramInputStream.read(paramArrayOfByte, paramInt1 + i, paramInt2 - i);
        if (j != -1);
      }
      else
      {
        return i;
      }
      i += j;
    }
  }

  public static <T> T readBytes(InputStream paramInputStream, ByteProcessor<T> paramByteProcessor)
    throws IOException
  {
    Preconditions.checkNotNull(paramInputStream);
    Preconditions.checkNotNull(paramByteProcessor);
    byte[] arrayOfByte = new byte[4096];
    int i;
    do
      i = paramInputStream.read(arrayOfByte);
    while ((i != -1) && (paramByteProcessor.processBytes(arrayOfByte, 0, i)));
    return paramByteProcessor.getResult();
  }

  public static void readFully(InputStream paramInputStream, byte[] paramArrayOfByte)
    throws IOException
  {
    readFully(paramInputStream, paramArrayOfByte, 0, paramArrayOfByte.length);
  }

  public static void readFully(InputStream paramInputStream, byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    int i = read(paramInputStream, paramArrayOfByte, paramInt1, paramInt2);
    if (i != paramInt2)
      throw new EOFException(81 + "reached end of stream after reading " + i + " bytes; " + paramInt2 + " bytes expected");
  }

  public static void skipFully(InputStream paramInputStream, long paramLong)
    throws IOException
  {
    long l1 = paramLong;
    while (paramLong > 0L)
    {
      long l2 = paramInputStream.skip(paramLong);
      if (l2 == 0L)
      {
        if (paramInputStream.read() == -1)
        {
          long l3 = l1 - paramLong;
          throw new EOFException(100 + "reached end of stream after skipping " + l3 + " bytes; " + l1 + " bytes expected");
        }
        paramLong -= 1L;
      }
      else
      {
        paramLong -= l2;
      }
    }
  }

  public static byte[] toByteArray(InputStream paramInputStream)
    throws IOException
  {
    ByteArrayOutputStream localByteArrayOutputStream = new ByteArrayOutputStream();
    copy(paramInputStream, localByteArrayOutputStream);
    return localByteArrayOutputStream.toByteArray();
  }

  static byte[] toByteArray(InputStream paramInputStream, int paramInt)
    throws IOException
  {
    byte[] arrayOfByte1 = new byte[paramInt];
    int i = paramInt;
    int m;
    if (i > 0)
    {
      int k = paramInt - i;
      m = paramInputStream.read(arrayOfByte1, k, i);
      if (m == -1)
        arrayOfByte1 = Arrays.copyOf(arrayOfByte1, k);
    }
    int j;
    do
    {
      return arrayOfByte1;
      i -= m;
      break;
      j = paramInputStream.read();
    }
    while (j == -1);
    FastByteArrayOutputStream localFastByteArrayOutputStream = new FastByteArrayOutputStream(null);
    localFastByteArrayOutputStream.write(j);
    copy(paramInputStream, localFastByteArrayOutputStream);
    byte[] arrayOfByte2 = new byte[arrayOfByte1.length + localFastByteArrayOutputStream.size()];
    System.arraycopy(arrayOfByte1, 0, arrayOfByte2, 0, arrayOfByte1.length);
    localFastByteArrayOutputStream.writeTo(arrayOfByte2, arrayOfByte1.length);
    return arrayOfByte2;
  }

  private static class ByteArrayDataInputStream
    implements ByteArrayDataInput
  {
    final DataInput input;

    ByteArrayDataInputStream(ByteArrayInputStream paramByteArrayInputStream)
    {
      this.input = new DataInputStream(paramByteArrayInputStream);
    }

    public boolean readBoolean()
    {
      try
      {
        boolean bool = this.input.readBoolean();
        return bool;
      }
      catch (IOException localIOException)
      {
        throw new IllegalStateException(localIOException);
      }
    }

    public byte readByte()
    {
      try
      {
        byte b = this.input.readByte();
        return b;
      }
      catch (EOFException localEOFException)
      {
        throw new IllegalStateException(localEOFException);
      }
      catch (IOException localIOException)
      {
        throw new AssertionError(localIOException);
      }
    }

    public char readChar()
    {
      try
      {
        char c = this.input.readChar();
        return c;
      }
      catch (IOException localIOException)
      {
        throw new IllegalStateException(localIOException);
      }
    }

    public double readDouble()
    {
      try
      {
        double d = this.input.readDouble();
        return d;
      }
      catch (IOException localIOException)
      {
        throw new IllegalStateException(localIOException);
      }
    }

    public float readFloat()
    {
      try
      {
        float f = this.input.readFloat();
        return f;
      }
      catch (IOException localIOException)
      {
        throw new IllegalStateException(localIOException);
      }
    }

    public void readFully(byte[] paramArrayOfByte)
    {
      try
      {
        this.input.readFully(paramArrayOfByte);
        return;
      }
      catch (IOException localIOException)
      {
        throw new IllegalStateException(localIOException);
      }
    }

    public void readFully(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    {
      try
      {
        this.input.readFully(paramArrayOfByte, paramInt1, paramInt2);
        return;
      }
      catch (IOException localIOException)
      {
        throw new IllegalStateException(localIOException);
      }
    }

    public int readInt()
    {
      try
      {
        int i = this.input.readInt();
        return i;
      }
      catch (IOException localIOException)
      {
        throw new IllegalStateException(localIOException);
      }
    }

    public String readLine()
    {
      try
      {
        String str = this.input.readLine();
        return str;
      }
      catch (IOException localIOException)
      {
        throw new IllegalStateException(localIOException);
      }
    }

    public long readLong()
    {
      try
      {
        long l = this.input.readLong();
        return l;
      }
      catch (IOException localIOException)
      {
        throw new IllegalStateException(localIOException);
      }
    }

    public short readShort()
    {
      try
      {
        short s = this.input.readShort();
        return s;
      }
      catch (IOException localIOException)
      {
        throw new IllegalStateException(localIOException);
      }
    }

    public String readUTF()
    {
      try
      {
        String str = this.input.readUTF();
        return str;
      }
      catch (IOException localIOException)
      {
        throw new IllegalStateException(localIOException);
      }
    }

    public int readUnsignedByte()
    {
      try
      {
        int i = this.input.readUnsignedByte();
        return i;
      }
      catch (IOException localIOException)
      {
        throw new IllegalStateException(localIOException);
      }
    }

    public int readUnsignedShort()
    {
      try
      {
        int i = this.input.readUnsignedShort();
        return i;
      }
      catch (IOException localIOException)
      {
        throw new IllegalStateException(localIOException);
      }
    }

    public int skipBytes(int paramInt)
    {
      try
      {
        int i = this.input.skipBytes(paramInt);
        return i;
      }
      catch (IOException localIOException)
      {
        throw new IllegalStateException(localIOException);
      }
    }
  }

  private static class ByteArrayDataOutputStream
    implements ByteArrayDataOutput
  {
    final ByteArrayOutputStream byteArrayOutputSteam;
    final DataOutput output;

    ByteArrayDataOutputStream(ByteArrayOutputStream paramByteArrayOutputStream)
    {
      this.byteArrayOutputSteam = paramByteArrayOutputStream;
      this.output = new DataOutputStream(paramByteArrayOutputStream);
    }

    public byte[] toByteArray()
    {
      return this.byteArrayOutputSteam.toByteArray();
    }

    public void write(int paramInt)
    {
      try
      {
        this.output.write(paramInt);
        return;
      }
      catch (IOException localIOException)
      {
        throw new AssertionError(localIOException);
      }
    }

    public void write(byte[] paramArrayOfByte)
    {
      try
      {
        this.output.write(paramArrayOfByte);
        return;
      }
      catch (IOException localIOException)
      {
        throw new AssertionError(localIOException);
      }
    }

    public void write(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    {
      try
      {
        this.output.write(paramArrayOfByte, paramInt1, paramInt2);
        return;
      }
      catch (IOException localIOException)
      {
        throw new AssertionError(localIOException);
      }
    }

    public void writeBoolean(boolean paramBoolean)
    {
      try
      {
        this.output.writeBoolean(paramBoolean);
        return;
      }
      catch (IOException localIOException)
      {
        throw new AssertionError(localIOException);
      }
    }

    public void writeByte(int paramInt)
    {
      try
      {
        this.output.writeByte(paramInt);
        return;
      }
      catch (IOException localIOException)
      {
        throw new AssertionError(localIOException);
      }
    }

    public void writeBytes(String paramString)
    {
      try
      {
        this.output.writeBytes(paramString);
        return;
      }
      catch (IOException localIOException)
      {
        throw new AssertionError(localIOException);
      }
    }

    public void writeChar(int paramInt)
    {
      try
      {
        this.output.writeChar(paramInt);
        return;
      }
      catch (IOException localIOException)
      {
        throw new AssertionError(localIOException);
      }
    }

    public void writeChars(String paramString)
    {
      try
      {
        this.output.writeChars(paramString);
        return;
      }
      catch (IOException localIOException)
      {
        throw new AssertionError(localIOException);
      }
    }

    public void writeDouble(double paramDouble)
    {
      try
      {
        this.output.writeDouble(paramDouble);
        return;
      }
      catch (IOException localIOException)
      {
        throw new AssertionError(localIOException);
      }
    }

    public void writeFloat(float paramFloat)
    {
      try
      {
        this.output.writeFloat(paramFloat);
        return;
      }
      catch (IOException localIOException)
      {
        throw new AssertionError(localIOException);
      }
    }

    public void writeInt(int paramInt)
    {
      try
      {
        this.output.writeInt(paramInt);
        return;
      }
      catch (IOException localIOException)
      {
        throw new AssertionError(localIOException);
      }
    }

    public void writeLong(long paramLong)
    {
      try
      {
        this.output.writeLong(paramLong);
        return;
      }
      catch (IOException localIOException)
      {
        throw new AssertionError(localIOException);
      }
    }

    public void writeShort(int paramInt)
    {
      try
      {
        this.output.writeShort(paramInt);
        return;
      }
      catch (IOException localIOException)
      {
        throw new AssertionError(localIOException);
      }
    }

    public void writeUTF(String paramString)
    {
      try
      {
        this.output.writeUTF(paramString);
        return;
      }
      catch (IOException localIOException)
      {
        throw new AssertionError(localIOException);
      }
    }
  }

  private static final class FastByteArrayOutputStream extends ByteArrayOutputStream
  {
    void writeTo(byte[] paramArrayOfByte, int paramInt)
    {
      System.arraycopy(this.buf, 0, paramArrayOfByte, paramInt, this.count);
    }
  }

  private static final class LimitedInputStream extends FilterInputStream
  {
    private long left;
    private long mark = -1L;

    LimitedInputStream(InputStream paramInputStream, long paramLong)
    {
      super();
      Preconditions.checkNotNull(paramInputStream);
      if (paramLong >= 0L);
      for (boolean bool = true; ; bool = false)
      {
        Preconditions.checkArgument(bool, "limit must be non-negative");
        this.left = paramLong;
        return;
      }
    }

    public int available()
      throws IOException
    {
      return (int)Math.min(this.in.available(), this.left);
    }

    public void mark(int paramInt)
    {
      try
      {
        this.in.mark(paramInt);
        this.mark = this.left;
        return;
      }
      finally
      {
        localObject = finally;
        throw localObject;
      }
    }

    public int read()
      throws IOException
    {
      int i;
      if (this.left == 0L)
        i = -1;
      do
      {
        return i;
        i = this.in.read();
      }
      while (i == -1);
      this.left -= 1L;
      return i;
    }

    public int read(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
      throws IOException
    {
      int j;
      if (this.left == 0L)
        j = -1;
      do
      {
        return j;
        int i = (int)Math.min(paramInt2, this.left);
        j = this.in.read(paramArrayOfByte, paramInt1, i);
      }
      while (j == -1);
      this.left -= j;
      return j;
    }

    public void reset()
      throws IOException
    {
      try
      {
        if (!this.in.markSupported())
          throw new IOException("Mark not supported");
      }
      finally
      {
      }
      if (this.mark == -1L)
        throw new IOException("Mark not set");
      this.in.reset();
      this.left = this.mark;
    }

    public long skip(long paramLong)
      throws IOException
    {
      long l1 = Math.min(paramLong, this.left);
      long l2 = this.in.skip(l1);
      this.left -= l2;
      return l2;
    }
  }
}