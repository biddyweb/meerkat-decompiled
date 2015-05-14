package co.getair.meerkat.video.broadcast.coremedia.iso.boxes;

import co.getair.meerkat.video.broadcast.coremedia.iso.BoxParser;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.DataSource;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.WritableByteChannel;

public abstract interface Box
{
  public abstract void getBox(WritableByteChannel paramWritableByteChannel)
    throws IOException;

  public abstract long getOffset();

  public abstract Container getParent();

  public abstract long getSize();

  public abstract String getType();

  public abstract void parse(DataSource paramDataSource, ByteBuffer paramByteBuffer, long paramLong, BoxParser paramBoxParser)
    throws IOException;

  public abstract void setParent(Container paramContainer);
}