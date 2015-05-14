package co.getair.meerkat.video.broadcast.googlecode.mp4parser;

import co.getair.meerkat.video.broadcast.googlecode.mp4parser.util.CastUtils;
import java.io.File;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.nio.ByteBuffer;
import java.nio.channels.WritableByteChannel;

public class DirectFileReadDataSource
  implements DataSource
{
  private static final int TRANSFER_SIZE = 8192;
  private String filename;
  private RandomAccessFile raf;

  public DirectFileReadDataSource(File paramFile)
    throws IOException
  {
    this.raf = new RandomAccessFile(paramFile, "r");
    this.filename = paramFile.getName();
  }

  public void close()
    throws IOException
  {
    this.raf.close();
  }

  public ByteBuffer map(long paramLong1, long paramLong2)
    throws IOException
  {
    this.raf.seek(paramLong1);
    byte[] arrayOfByte = new byte[CastUtils.l2i(paramLong2)];
    this.raf.readFully(arrayOfByte);
    return ByteBuffer.wrap(arrayOfByte);
  }

  public long position()
    throws IOException
  {
    return this.raf.getFilePointer();
  }

  public void position(long paramLong)
    throws IOException
  {
    this.raf.seek(paramLong);
  }

  public int read(ByteBuffer paramByteBuffer)
    throws IOException
  {
    int i = paramByteBuffer.remaining();
    int j = 0;
    int k = 0;
    byte[] arrayOfByte = new byte[8192];
    while (true)
    {
      if (j < i)
      {
        int m = Math.min(i - j, 8192);
        k = this.raf.read(arrayOfByte, 0, m);
        if (k >= 0);
      }
      else
      {
        if ((k < 0) && (j == 0))
          j = -1;
        return j;
      }
      j += k;
      paramByteBuffer.put(arrayOfByte, 0, k);
    }
  }

  public int readAllInOnce(ByteBuffer paramByteBuffer)
    throws IOException
  {
    byte[] arrayOfByte = new byte[paramByteBuffer.remaining()];
    int i = this.raf.read(arrayOfByte);
    paramByteBuffer.put(arrayOfByte, 0, i);
    return i;
  }

  public long size()
    throws IOException
  {
    return this.raf.length();
  }

  public String toString()
  {
    return this.filename;
  }

  public long transferTo(long paramLong1, long paramLong2, WritableByteChannel paramWritableByteChannel)
    throws IOException
  {
    return paramWritableByteChannel.write(map(paramLong1, paramLong2));
  }
}