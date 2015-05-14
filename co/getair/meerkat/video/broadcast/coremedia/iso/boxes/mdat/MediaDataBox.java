package co.getair.meerkat.video.broadcast.coremedia.iso.boxes.mdat;

import co.getair.meerkat.video.broadcast.coremedia.iso.BoxParser;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.Box;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.Container;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.DataSource;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.WritableByteChannel;
import java.util.logging.Logger;

public final class MediaDataBox
  implements Box
{
  private static Logger LOG = Logger.getLogger(MediaDataBox.class.getName());
  public static final String TYPE = "mdat";
  private DataSource dataSource;
  boolean largeBox = false;
  private long offset;
  Container parent;
  private long size;

  private static void transfer(DataSource paramDataSource, long paramLong1, long paramLong2, WritableByteChannel paramWritableByteChannel)
    throws IOException
  {
    for (long l = 0L; l < paramLong2; l += paramDataSource.transferTo(paramLong1 + l, Math.min(67076096L, paramLong2 - l), paramWritableByteChannel));
  }

  public void getBox(WritableByteChannel paramWritableByteChannel)
    throws IOException
  {
    transfer(this.dataSource, this.offset, this.size, paramWritableByteChannel);
  }

  public long getOffset()
  {
    return this.offset;
  }

  public Container getParent()
  {
    return this.parent;
  }

  public long getSize()
  {
    return this.size;
  }

  public String getType()
  {
    return "mdat";
  }

  public void parse(DataSource paramDataSource, ByteBuffer paramByteBuffer, long paramLong, BoxParser paramBoxParser)
    throws IOException
  {
    this.offset = (paramDataSource.position() - paramByteBuffer.remaining());
    this.dataSource = paramDataSource;
    this.size = (paramLong + paramByteBuffer.remaining());
    paramDataSource.position(paramLong + paramDataSource.position());
  }

  public void setParent(Container paramContainer)
  {
    this.parent = paramContainer;
  }

  public String toString()
  {
    return "MediaDataBox{size=" + this.size + '}';
  }
}