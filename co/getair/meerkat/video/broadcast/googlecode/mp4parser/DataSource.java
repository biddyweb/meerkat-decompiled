package co.getair.meerkat.video.broadcast.googlecode.mp4parser;

import java.io.Closeable;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.WritableByteChannel;

public abstract interface DataSource extends Closeable
{
  public abstract void close()
    throws IOException;

  public abstract ByteBuffer map(long paramLong1, long paramLong2)
    throws IOException;

  public abstract long position()
    throws IOException;

  public abstract void position(long paramLong)
    throws IOException;

  public abstract int read(ByteBuffer paramByteBuffer)
    throws IOException;

  public abstract long size()
    throws IOException;

  public abstract long transferTo(long paramLong1, long paramLong2, WritableByteChannel paramWritableByteChannel)
    throws IOException;
}